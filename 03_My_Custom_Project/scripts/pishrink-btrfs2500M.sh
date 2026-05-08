#!/usr/bin/env bash

# Project: PiShrink-Btrfs-Edition (Fixed)
version="v26.03.16-btrfs-fixed"
startSeconds=$SECONDS

CURRENT_DIR="$(pwd)"
SCRIPTNAME="${0##*/}"
LOGFILE="${CURRENT_DIR}/${SCRIPTNAME%.*}.log"
REQUIRED_TOOLS="parted losetup md5sum btrfs blkid awk"

function info() { echo "$SCRIPTNAME: $1"; }
function error() { echo -n "$SCRIPTNAME: ERROR occurred in line $1: "; shift; echo "$@"; }

function cleanup() {
    if [ -n "$mountdir" ] && mountpoint -q "$mountdir"; then umount "$mountdir" 2>/dev/null; fi
    if [ -n "$loopback" ] && losetup "$loopback" &>/dev/null; then losetup -d "$loopback"; fi
    [ -d "$mountdir" ] && rm -rf "$mountdir"
}

trap cleanup EXIT

# --- Проверки прав и аргументов ---
img="$1"
if [[ -z "$img" ]]; then echo "Usage: sudo $0 image.img"; exit 1; fi
if [[ ! -f "$img" ]]; then error $LINENO "$img is not a file..."; exit 2; fi
if (( EUID != 0 )); then error $LINENO "You need to be running as root."; exit 3; fi

for command in $REQUIRED_TOOLS; do
  command -v $command >/dev/null 2>&1 || { error $LINENO "$command is not installed."; exit 4; }
done

# --- Сбор данных ---
info "Gathering data"
beforesize="$(ls -lh "$img" | cut -d ' ' -f 5)"

# Получаем данные о последнем разделе
parted_output="$(parted -ms "$img" unit B print)"
partnum="$(echo "$parted_output" | tail -n 1 | cut -d ':' -f 1)"
partstart="$(echo "$parted_output" | tail -n 1 | cut -d ':' -f 2 | tr -d 'B')"
parttype="primary"

# Привязка к loop-устройству
loopback="$(losetup -f --show -o "$partstart" "$img")"
if [ -z "$loopback" ]; then error $LINENO "Failed to create loop device"; exit 5; fi

# Проверка типа ФС
fstype=$(blkid -o value -s TYPE "$loopback")
info "Detected filesystem: $fstype"

if [[ "$fstype" != "btrfs" ]]; then
    error $LINENO "This script only supports Btrfs. Found: $fstype"
    exit 7
fi

# --- Работа с Btrfs ---
info "Checking filesystem (Btrfs)"
btrfs check "$loopback" || { error $LINENO "Btrfs check failed."; exit 9; }

mountdir=$(mktemp -d)
mount "$loopback" "$mountdir" || { error $LINENO "Failed to mount image"; exit 8; }

info "Zeroing free space (this may take a few minutes)..."
dd if=/dev/zero of="$mountdir/zero.fill" status=progress bs=1M conv=fsync 2>/dev/null
rm "$mountdir/zero.fill"

info "Shrinking Btrfs filesystem to 2500M"
btrfs filesystem resize max "$mountdir"
btrfs filesystem resize 2500M "$mountdir" || { error $LINENO "Resize failed! Maybe data is more than 2.5G?"; exit 10; }

# КРИТИЧЕСКИЙ МОМЕНТ: Получаем новый размер
new_fs_size=$(btrfs filesystem usage -b "$mountdir" | grep "Device size" | awk '{print $3}')
umount "$mountdir"
losetup -d "$loopback"
loopback="" # Очищаем переменную, чтобы cleanup не ругался

# ПРОВЕРКА: Если размер пустой, мы не имеем права продолжать
if [ -z "$new_fs_size" ] || [ "$new_fs_size" -lt 100000000 ]; then
    error $LINENO "Could not calculate new size. Stopping to prevent image corruption."
    exit 11
fi

# --- Переразметка и Обрезка ---
info "Updating partition table"
# Новая граница: Старт + размер ФС + 200МБ запаса
newpartend=$(($partstart + $new_fs_size + 209715200))

# Удаляем и создаем раздел в таблице
parted -s "$img" rm "$partnum"
parted -s "$img" unit B mkpart "$parttype" "$partstart" "$newpartend"

info "Truncating image file"
truncate -s "$newpartend" "$img"

aftersize=$(ls -lh "$img" | cut -d ' ' -f 5)
info "Done! Shrunk $img from $beforesize to $aftersize"