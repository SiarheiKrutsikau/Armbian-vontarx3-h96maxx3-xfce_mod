#!/usr/bin/env bash

# Project: PiShrink-Btrfs-Edition (All-in-One Ultimate)
version="v26.05.09-ultimate-fixed"
SCRIPTNAME="${0##*/}"

# --- Выбор языка ---
echo "Choose language / Выберите язык (1/2):"
echo "1) English (en)"
echo "2) Русский (ru)"
read -p "Selection: " lang_choice

if [[ "$lang_choice" == "2" || "$lang_choice" == "ru" ]]; then
    export LANG=ru_RU.UTF-8
    L_OPT_COMP="Выберите метод сжатия архива:"
    L_COMP_NONE="1) Без сжатия (только .img)"
    L_COMP_GZ="2) Gzip (.gz) - уровень -9"
    L_COMP_XZ="3) XZ (.xz) - максимально"
    L_COMP_ALL="4) Всё вместе (.gz + .xz)"
    L_INFO="Создаю рабочую копию образа..."
    L_OLD_DEL="Удаляю старый файл:"
    L_ZERO="Зануляю свободное место (progress)..."
    L_OPT="Оптимизация Btrfs (balance/defrag)..."
    L_SH_B="Сжимаю Btrfs до"
    L_DONE="Готово!"
    L_COMPRESSING="Запаковываю образ..."
    L_CPU="Загрузка CPU:"
    L_STATUS="Статус файлов:"
else
    export LANG=en_US.UTF-8
    L_OPT_COMP="Choose compression method:"
    L_COMP_NONE="1) No compression"
    L_COMP_GZ="2) Gzip (.gz) - level -9"
    L_COMP_XZ="3) XZ (.xz) - maximum"
    L_COMP_ALL="4) All together (.gz + .xz)"
    L_INFO="Creating working copy..."
    L_OLD_DEL="Deleting old file:"
    L_ZERO="Zeroing free space..."
    L_OPT="Btrfs optimization..."
    L_SH_B="Shrinking Btrfs to"
    L_DONE="Done!"
    L_COMPRESSING="Compressing image..."
    L_CPU="CPU Usage:"
    L_STATUS="File status:"
fi

echo -e "\n$L_OPT_COMP"
echo "$L_COMP_NONE"
echo "$L_COMP_GZ"
echo "$L_COMP_XZ"
echo "$L_COMP_ALL"
read -p "Selection (1/2/3/4): " comp_choice

GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
NC='\e[0m'

function info() { echo -e "${GREEN}${SCRIPTNAME}:${NC} $1"; }
function warn() { echo -e "${YELLOW}${SCRIPTNAME}: $1${NC}"; }

function cleanup() {
    if [ -n "$mountdir" ] && mountpoint -q "$mountdir"; then umount "$mountdir" 2>/dev/null; fi
    if [ -n "$loopback" ] && losetup "$loopback" &>/dev/null; then losetup -d "$loopback"; fi
    [ -d "$mountdir" ] && rm -rf "$mountdir"
    [ -d ".tmp_shrink" ] && rm -rf ".tmp_shrink"
    [ -n "$cpu_pid" ] && kill "$cpu_pid" 2>/dev/null
}
trap cleanup EXIT

img_orig="$1"
[[ -z "$img_orig" ]] && { echo "Usage: sudo $0 \"image.img\""; exit 1; }

base_name="${img_orig%.*}"
img_shrunk="${base_name}.shrunk.img"
archive_gz="${base_name}.img.gz"
archive_xz="${base_name}.img.xz"

# --- 1. УМНАЯ ОЧИСТКА ---
[ -f "$img_shrunk" ] && { warn "$L_OLD_DEL $img_shrunk"; rm -f "$img_shrunk"; }

if [[ "$comp_choice" == "2" || "$comp_choice" == "4" ]]; then
    [ -f "$archive_gz" ] && { warn "$L_OLD_DEL $archive_gz"; rm -f "$archive_gz"; }
fi
if [[ "$comp_choice" == "3" || "$comp_choice" == "4" ]]; then
    [ -f "$archive_xz" ] && { warn "$L_OLD_DEL $archive_xz"; rm -f "$archive_xz"; }
fi

# --- 2. СОЗДАНИЕ КОПИИ ---
info "$L_INFO"
cp --sparse=always "$img_orig" "$img_shrunk" || exit 5

# --- 3. ОБРАБОТКА ---
part_data=$(fdisk -l "$img_shrunk" | grep "Linux" | tail -n 1)
start_sector=$(echo "$part_data" | awk '{print $2}')
partnum=$(echo "$part_data" | awk '{print $1}' | grep -o '[0-9]*$')
[[ ! "$start_sector" =~ ^[0-9]+$ ]] && start_sector=$(echo "$part_data" | awk '{print $3}')
partstart=$((start_sector * 512))

loopback=$(losetup -f --show -o "$partstart" "$img_shrunk")
mountdir=$(mktemp -d)
mount "$loopback" "$mountdir" || exit 8

info "$L_ZERO"
dd if=/dev/zero of="$mountdir/zero.fill" bs=1M status=progress conv=fsync 2>/dev/null
rm "$mountdir/zero.fill"

warn "$L_OPT"
btrfs balance start -dusage=95 "$mountdir" &>/dev/null
btrfs balance start -musage=95 "$mountdir" &>/dev/null
btrfs filesystem defragment -r "$mountdir" &>/dev/null

used_bytes=$(btrfs filesystem usage -b "$mountdir" | grep "Used" | head -n 1 | awk '{print $2}')
target_size_mb=$(( ($used_bytes / 1024 / 1024) + 500 ))
[[ "$target_size_mb" -lt 1500 ]] && target_size_mb=1500

info "$L_SH_B ${target_size_mb}M..."
btrfs filesystem resize "${target_size_mb}M" "$mountdir" || btrfs filesystem resize max "$mountdir"

new_fs_size=$(btrfs filesystem usage -b "$mountdir" | grep "Device size" | awk '{print $3}')
umount "$mountdir"
losetup -d "$loopback"
loopback=""

# Переразметка
new_end_bytes=$((partstart + new_fs_size + 104857600))
(echo d; echo "$partnum"; echo n; echo p; echo "$partnum"; echo "$start_sector"; echo "+$((new_fs_size / 512 + 204800))"; echo w) | fdisk "$img_shrunk" &>/dev/null
truncate -s "$new_end_bytes" "$img_shrunk"

# --- 4. УПАКОВКА И МОНИТОРИНГ CPU ---
if [[ "$comp_choice" != "1" ]]; then
    info "$L_COMPRESSING"

    (
        while true; do
            cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
            echo -ne "\r${YELLOW}$L_CPU [${cpu_load}%] ${NC}"
            sleep 2
        done
    ) &
    cpu_pid=$!

    mkdir -p .tmp_shrink
    temp_link=".tmp_shrink/${base_name}.img"
    ln -sf "../$img_shrunk" "$temp_link"

    if [[ "$comp_choice" == "2" || "$comp_choice" == "4" ]]; then
        info "-> Gzip (.gz)..."
        gzip -c -9 "$temp_link" > "$archive_gz"
    fi

    if [[ "$comp_choice" == "3" || "$comp_choice" == "4" ]]; then
        info "-> XZ (.xz)..."
        xz -c -T0 "$temp_link" > "$archive_xz"
    fi

    kill "$cpu_pid" 2>/dev/null
    rm -rf .tmp_shrink
    echo -e "\n"
    info "$L_DONE"
fi

info "---------------------------------------"
info "$L_STATUS"
ls -lh "$img_orig" "$img_shrunk" "$archive_gz" "$archive_xz" 2>/dev/null