#!/bin/bash
while true; do
	clear
	echo "Select language / Выберите язык:"
	echo "1) English"
	echo "2) Русский"
	echo -n "Selection [1 or 2]: "
	read -r LANG_CHOICE

	case "$LANG_CHOICE" in
	1)
		printf "\n\e[32mEnglish language selected\e[0m\n"
		break
		;;
	2)
		printf "\n\e[32mВыбран русский язык\e[0m\n"
		break
		;;
	*)
		printf "\n\e[31mОШИБКА: Invalid input. Please choose 1 or 2. Неверный ввод. Пожалуйста, выберите 1 или 2.\e[0m\n"
		sleep 2
		;;
	esac
done

if [[ "$LANG_CHOICE" == "2" ]]; then
	# Russian Strings
	export LC_ALL=ru_RU.UTF-8
    echo "ВЫБРАН РУССКИЙ ЯЗЫК"
	L_SET_TIME="НАСТРОЙКА СИСТЕМНОГО ВРЕМЕНИ... "
	L_SUCCESS_NET="\e[32mУСПЕШНО ПО СЕТИ!\e[0m"
	L_SUCCESS_FILE="\e[32mУСПЕШНО ПО ФАЙЛАМ!\e[0m"
	L_SUCCESS_FORCE="\e[32mУСПЕШНО ПРИНУДИТЕЛЬНО (31.12.2026г.)\e[0m"
	L_CHOOSE_CONF="\e[1mВЫБЕРИТЕ КОНФИГУРАЦИЮ ЦЕЛЕВОЙ СИСТЕМЫ:\e[0m\n"
	L_MODE_KEEP="[1] \e[32mСОХРАНЕНИЕ ОКРУЖЕНИЯ\e[0m (Сохранить профиль пользователя: %s)\n"
	L_MODE_RESET="[2] \e[33mСБРОС НАСТРОЕК И ПОДГОТОВКА К ПЕРВОМУ ЗАПУСКУ\e[0m\n"
	L_INPUT_NUM="Введите номер [1 или 2]: "
	L_MODE_ONE="\n\e[32mВЫБРАН РЕЖИМ: СОХРАНЕНИЕ ТЕКУЩИХ НАСТРОЕК\e[0m\n"
	L_MODE_TWO="\n\e[32mВЫБРАН РЕЖИМ: ПОДГОТОВКА ДЛЯ НОВОГО ВЛАДЕЛЬЦА\e[0m\n"
	L_ERR_INPUT="\n\e[31mОШИБКА: Неверный ввод. Пожалуйста, выберите 1 или 2.\e[0m\n"
	L_START_INST="\e[38;5;223m     НАЧАЛО УСТАНОВКИ ARMBIAN НА ПРИСТАВКУ\e[0m"
	L_NO_DRIVES="НЕВОЗМОЖНО НАЙТИ КАКИЕ-ЛИБО ДИСКИ В СИСТЕМЕ!"
	L_NO_DRIVES_SD="НЕВОЗМОЖНО НАЙТИ КАКИЕ-ЛИБО EMMC ИЛИ SD ДИСКИ В ЭТОЙ СИСТЕМЕ!"
	L_ROOT_NOT_FOUND="НЕВОЗМОЖНО НАЙТИ КОРЕНЬ ЗАПУЩЕННОЙ СИСТЕМЫ!"
	L_EMMC_NOT_FOUND="EMMC-ДИСК НЕ НАЙДЕН ИЛИ ВЫ ЗАГРУЖЕНЫ С НЕГО!"
	L_ALREADY_EMMC="ВЫ УЖЕ ЗАГРУЖЕНЫ С EMMC!"
	L_ALREADY_EMMC_NOT="ПОХОЖЕ, У ВАС НЕТ EMMC-ДИСКА!"
	L_FULL="ПОЛНЫЙ СИСТЕМНЫЙ ПУТЬ"
	L_COPY_LABEL="КОПИРОВАНИЕ"
	L_SUCCESS="УСПЕШНО!"
	L_BACKUP_UBOOT="НАЧАЛО РЕЗЕРВНОГО КОПИРОВАНИЯ U-BOOT..."
	L_MBR_PART="НАЧАЛО СОЗДАНИЯ MBR И РАЗДЕЛОВ..."
	L_RESTORE_UBOOT="НАЧАЛО ВОССТАНОВЛЕНИЯ U-BOOT..."
	L_COPY_EMMC="НАЧАЛО КОПИРОВАНИЯ СИСТЕМЫ НА EMMC..."
	L_OFF_BOOT="ОТКЛЮЧЕНИЕ ЗАГРУЗОЧНОГО РАЗДЕЛА"
	L_OFF_ROOT="РАЗМОНТИРОВАНИЕ СИСТЕМНОГО (КОРНЕВОГО) РАЗДЕЛА..."
	L_FORMAT_BOOT="ФОРМАТИРОВАНИЕ ЗАГРУЗОЧНОГО РАЗДЕЛА..."
	L_FORMAT_BOOT_ERR="\e[31mОШИБКА ПРИ ФОРМАТИРОВАНИИ!\e[0m"
	L_FS_CHECK="ПРОВЕРКА ФАЙЛОВОЙ СИСТЕМЫ..."
	L_FORMAT_ROOT="ФОРМАТИРОВАНИЕ СИСТЕМНОГО РАЗДЕЛА..."
	L_ERR="\e[31mОШИБКА!\e[0m"
	L_ERR_SYS="\e[31mОШИБКА: РАЗДЕЛ ПОВРЕЖДЕН!\e[0m"
	L_SYS_UPD="СИСТЕМА ОБНОВИЛА ДАННЫЕ ДИСКА..."
	L_WAIT_LABEL="ОЖИДАНИЕ МЕТКИ РАЗДЕЛА "
	L_LABEL_FOUND="МЕТКА НАЙДЕНА"
	L_LABEL_ERR="\n\e[31mОШИБКА: МЕТКА НЕ СЧИТАЛАСЬ! ИСПОЛЬЗУЮ ПРИНУДИТЕЛЬНОЕ ЗНАЧЕНИЕ.\e[0m"
	L_COPY_BOOT="КОПИРОВАНИЕ РАЗДЕЛА BOOT..."
	L_EDIT_CONF="РЕДАКТИРОВАНИЕ НАЧАЛЬНОЙ КОНФИГУРАЦИИ..."
	L_CREATE_DIRECTORY="СОЗДАНИЕ ПАПКИ"
	L_FILE_FOUND="ФАЙЛ НАЙДЕН EXTLINUX.CONF. УДАЛЕНИЕ КОНФИГУРАЦИИ ЗАГРУЗКИ..."
	L_CREATE_NEW_CONF="СОЗДАЮ НОВУЮ КОНФИГУРАЦИЮ EXTLINUX.CONF ..."
	L_CREATE_OK="УСПЕШНО! (попытка"
	L_CREATE_ERR="\e[31m$i: ОШИБКА СОЗДАНИЯ НОВОЙ КОНФИГУРАЦИИ, ПРОБУЮ СНОВА...\e[0m"
	L_CREATE_ERR_NOT="\e[31mКРИТИЧЕСКАЯ ОШИБКА: НЕ УДАЛОСЬ СОЗДАТЬ КОНФИГУРАЦИЮ ПОСЛЕ 10 ПОПЫТОК!\e[0m"
	L_SAVE_DATA="СОХРАНЕНИЕ ДАННЫХ..."
	L_UPD_UENV="ОБНОВЛЕНИЕ UENV.TXT В КОРНЕВОМ КАТАЛОГЕ..."
	L_DEL_UENV="ФАЙЛ НАЙДЕН UENV.TXT.\nУДАЛЕНИЕ КОНФИГУРАЦИИ ЗАГРУЗКИ..."
	L_EDIT_BOOTINI="НАСТРОЙКА ЗАГРУЗЧИКА U-BOOT В BOOT.INI..."
	L_BOOTINI_NOT="\e[33mПРЕДУПРЕЖДЕНИЕ: BOOT.INI НЕ НАЙДЕН!\e[0m"
	L_BOOTINI_NOT_FLASH="\e[31mОШИБКА: U-BOOT.EXT ОТСУТСТВУЕТ НА ФЛЕШКЕ В /boot!\e[0m"
	L_COPY_ROOT="КОПИРОВАНИЕ КОРНЕВОЙ ФАЙЛОВОЙ СИСТЕМЫ..."
	L_CREATE_ERR_ROOT_NOT="\n \e[31mОШИБКА: НЕ УДАЛОСЬ ПРИМОНТИРОВАТЬ РАЗДЕЛ ЗА $MAX_TRIES ПОПЫТОК!\e[0m"
	L_COPY_FS="\e[33mНАЧАЛО ПЕРЕНОСА ФАЙЛОВОЙ СИСТЕМЫ НА EMMC...\e[0m"
	L_CREATE_DIRS="\e[38;5;223mСОЗДАНИЕ СИСТЕМНЫХ ДИРЕКТОРИЙ (DEV, PROC, SYS...)\e[0m"
	L_EDIT_FSTAB="\e[31mИСПРАВЛЕНИЕ FSTAB...\e[0m"
	L_DEL_FSTAB="ФАЙЛ НАЙДЕН FSTAB. УДАЛЕНИЕ КОНФИГУРАЦИИ ЗАГРУЗКИ..."
	L_CREATE_FSTAB_OK="УСПЕШНО СОЗДАН FSTAB! (попытка"
	L_CLEANUP="ОЧИСТКА ВРЕМЕННЫХ ФАЙЛОВ И СЕАНСОВ НА EMMC..."
	L_RESET_OWNER="СБРОС НАСТРОЕК ДЛЯ НОВОГО ВЛАДЕЛЬЦА..."
	L_READY_FIRST_BOOT="\e[32mСИСТЕМА ПОДГОТОВЛЕНА К ПЕРВОМУ ЗАПУСКУ!\e[0m"
	L_USER_SAVED="\e[32mПОЛЬЗОВАТЕЛЬ СОХРАНЕН.\e[0m"
	L_CLEAN_EMMC_OK="\e[32mУСПЕШНО ОЧИЩЕНО НА EMMC!\e[0m"
	L_FINAL_UMOUNT="\e[34mФИНАЛЬНОЕ РАЗМОНТИРОВАНИЕ...\e[0m"
	L_DONE_TITLE="\e[32m     КОПИРОВАНИЕ ОПЕРАЦИОННОЙ СИСТЕМЫ НА EMMC ЗАВЕРШЕНО!\e[0m"
	L_DONE_MSG="\e[32m        МОЖНО ВЫКЛЮЧАТЬ ПРИСТАВКУ И ИЗВЛЕКАТЬ ФЛЕШКУ.\e[0m"
else
	export LC_ALL=C
    echo "ENGLISH LANGUAGE SELECTED"
	# English Strings (Default)
	L_SET_TIME="SETTING SYSTEM TIME... "
	L_SUCCESS_NET="\e[32mSUCCESS VIA NETWORK!\e[0m"
	L_SUCCESS_FILE="\e[32mSUCCESS VIA FILES!\e[0m"
	L_SUCCESS_FORCE="\e[32mSUCCESS FORCED (12/31/2026)\e[0m"
	L_CHOOSE_CONF="\e[1mSELECT TARGET SYSTEM CONFIGURATION:\e[0m\n"
	L_MODE_KEEP="[1] \e[32mKEEP ENVIRONMENT\e[0m (Save user profile: %s)\n"
	L_MODE_RESET="[2] \e[33mRESET SETTINGS AND PREPARE FOR FIRST RUN\e[0m\n"
	L_INPUT_NUM="Enter number [1 or 2]: "
	L_MODE_ONE="\n\e[32mMODE SELECTED: KEEP CURRENT SETTINGS\e[0m\n"
	L_MODE_TWO="\n\e[32mMODE SELECTED: PREPARE FOR NEW OWNER\e[0m\n"
	L_ERR_INPUT="\n\e[31mERROR: Invalid input. Please choose 1 or 2.\e[0m\n"
	L_START_INST="\e[38;5;223m     STARTING ARMBIAN INSTALLATION TO TV BOX\e[0m"
	L_NO_DRIVES="CANNOT FIND ANY DRIVES IN THE SYSTEM!"
	L_NO_DRIVES_SD="CANNOT FIND ANY EMMC OR SD DRIVES IN THIS SYSTEM!"
	L_ROOT_NOT_FOUND="CANNOT FIND RUNNING SYSTEM ROOT!"
	L_EMMC_NOT_FOUND="EMMC NOT FOUND OR YOU ARE ALREADY BOOTED FROM IT!"
	L_ALREADY_EMMC="YOU ARE ALREADY BOOTED FROM EMMC!"
	L_ALREADY_EMMC_NOT="IT LOOKS LIKE YOU DON'T HAVE AN EMMC DRIVE!"
	L_FULL="FULL SYSTEM PATH"
	L_COPY_LABEL="COPYING"
	L_SUCCESS="SUCCESS!"
	L_BACKUP_UBOOT="STARTING U-BOOT BACKUP..."
	L_MBR_PART="STARTING MBR AND PARTITIONING..."
	L_RESTORE_UBOOT="STARTING U-BOOT RESTORE..."
	L_COPY_EMMC="STARTING SYSTEM COPY TO EMMC..."
	L_OFF_BOOT="UNMOUNTING BOOT PARTITION"
	L_OFF_ROOT="UNMOUNTING SYSTEM (ROOT) PARTITION..."
	L_FORMAT_BOOT="FORMATTING BOOT PARTITION..."
	L_FORMAT_BOOT_ERR="\e[31mERROR DURING FORMATTING!\e[0m"
	L_FS_CHECK="CHECKING FILE SYSTEM..."
	L_FORMAT_ROOT="FORMATTING SYSTEM PARTITION..."
	L_ERR="\e[31mERROR!\e[0m"
	L_ERR_SYS="\e[31mERROR: PARTITION CORRUPTED!\e[0m"
	L_SYS_UPD="SYSTEM UPDATED DISK DATA..."
	L_WAIT_LABEL="WAITING FOR PARTITION LABEL "
	L_LABEL_FOUND="LABEL FOUND"
	L_LABEL_ERR="\n\e[31mERROR: FAILED TO READ LABEL! USING FORCED VALUE.\e[0m"
	L_COPY_BOOT="COPYING BOOT PARTITION..."
	L_EDIT_CONF="EDITING INITIAL CONFIGURATION..."
	L_CREATE_DIRECTORY="CREATING DIRECTORY"
	L_FILE_FOUND="FILE FOUND EXTLINUX.CONF. DELETING BOOT CONFIGURATION..."
	L_CREATE_NEW_CONF="CREATING NEW EXTLINUX.CONF CONFIGURATION..."
	L_CREATE_OK="SUCCESS! (attempt"
	L_CREATE_ERR="\e[31m$i: ERROR CREATING NEW CONFIGURATION, RETRYING...\e[0m"
	L_CREATE_ERR_NOT="\e[31mCRITICAL ERROR: FAILED TO CREATE CONFIG AFTER 10 ATTEMPTS!\e[0m"
	L_SAVE_DATA="SAVING DATA..."
	L_UPD_UENV="UPDATING UENV.TXT IN ROOT DIRECTORY..."
	L_DEL_UENV="FILE FOUND UENV.TXT.\nDELETING BOOT CONFIGURATION..."
	L_EDIT_BOOTINI="CONFIGURING U-BOOT LOADER IN BOOT.INI..."
	L_BOOTINI_NOT="\e[33mWARNING: BOOT.INI NOT FOUND!\e[0m"
	L_BOOTINI_NOT_FLASH="\e[31mERROR: U-BOOT.EXT IS MISSING FROM THE FLASH DRIVE IN /boot!\e[0m"
	L_COPY_ROOT="COPYING ROOT FILESYSTEM..."
	L_CREATE_ERR_ROOT_NOT="\n \e[31mERROR: FAILED TO MOUNT PARTITION AFTER $MAX_TRIES ATTEMPTS!\e[0m"
	L_COPY_FS="\e[33mSTARTING FILESYSTEM TRANSFER TO EMMC...\e[0m"
	L_CREATE_DIRS="\e[38;5;223mCREATING SYSTEM DIRECTORIES (DEV, PROC, SYS...)\e[0m"
	L_EDIT_FSTAB="\e[31mFIXING FSTAB...\e[0m"
	L_DEL_FSTAB="FILE FOUND FSTAB. DELETING MOUNT CONFIGURATION..."
	L_CLEANUP="CLEANING UP TEMPORARY FILES AND SESSIONS ON EMMC..."
	L_RESET_OWNER="RESETTING SETTINGS FOR NEW OWNER..."
	L_READY_FIRST_BOOT="\e[32mSYSTEM PREPARED FOR FIRST BOOT!\e[0m"
	L_USER_SAVED="\e[32mUSER SAVED.\e[0m"
	L_CLEAN_EMMC_OK="\e[32mSUCCESSFULLY CLEANED ON EMMC!\e[0m"
	L_FINAL_UMOUNT="\e[34mFINAL UNMOUNTING...\e[0m"
	L_DONE_TITLE="\e[32m          OPERATING SYSTEM COPY TO EMMC COMPLETE!\e[0m"
	L_DONE_MSG="\e[32m YOU CAN NOW POWER OFF THE DEVICE AND REMOVE THE FLASH DRIVE.\e[0m"
fi

echo -n "$L_SET_TIME"

# Attempt network time sync via Google HTTP header / Попытка синхронизации по интернету (HTTP-заголовок от Google)
# Faster and more reliable in scripts than heavy NTP / Быстрее и надежнее в скриптах, чем тяжелый NTP
if ping -c 1 -W 2 google.com >/dev/null 2>&1; then
	# Берем дату из заголовка ответа сервера
	NEW_DATE=$(curl -sI google.com | grep -i '^date:' | cut -d' ' -f3-6)
	if [ -n "$NEW_DATE" ]; then
		date -s "$NEW_DATE" >/dev/null 2>&1
		echo -e "$L_SUCCESS_NET"
	fi

# If no internet, use the timestamp of the newest file in /boot / Если интернета нет, берем дату самого нового файла в /boot
elif [ -d "/boot" ]; then
	# Find the latest file and get its date / Находим самый свежий файл и берем его дату
	LATEST_FILE=$(find /boot -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -f2- -d" ")
	if [ -n "$LATEST_FILE" ]; then
		date -s "@$(stat -c %Y "$LATEST_FILE")" >/dev/null 2>&1
		echo -e "$L_SUCCESS_FILE"
	fi

# Fallback: set a "stub" date in the future / Если ничего не помогло, ставим "заглушку" в будущем
else
	date 123123592026 >/dev/null 2>&1
	echo -e "$L_SUCCESS_FORCE"
fi

# --- INSTALLATION MODE REQUEST --- / --- ЗАПРОС РЕЖИМА УСТАНОВКИ ---
# Define the current user / Определяем текущего пользователя
CURRENT_USER=$(whoami)

# --- INSTALLATION MODE REQUEST --- / --- ЗАПРОС РЕЖИМА УСТАНОВКИ ---
while true; do
	echo "========================================================"
	printf "$L_CHOOSE_CONF"
	echo "--------------------------------------------------------"
	# The name of the user who launched the script will now be inserted here / Теперь здесь будет подставляться имя того, кто запустил скрипт
	printf "$L_MODE_KEEP" "$CURRENT_USER"
	printf "$L_MODE_RESET"
	echo "--------------------------------------------------------"
	printf "$L_INPUT_NUM"
	read -r INSTALL_MODE

	case "$INSTALL_MODE" in
	1)
		printf "$L_MODE_ONE"
		# Logic: the script simply copies the system as is / Логика: скрипт просто копирует систему как есть
		break
		;;
	2)
		printf "$L_MODE_TWO"
		# Logic: here you will add cleanup commands (rm -rf /home/$CURRENT_USER, log clearing, etc.) / Логика: здесь вы добавите команды очистки (rm -rf /home/$CURRENT_USER, очистка логов и т.д.)
		break
		;;
	*)
		printf "$L_ERR_INPUT"
		sleep 1
		;;
	esac
done
echo "--------------------------------------------------------"

sync

# Animation function. Takes: $1 - folder/process name, $2 - command to run / Функция анимации. Принимает: $1 - имя папки/процесса, $2 - команда для запуска[cite: 2]
animate_process() {
	local label=$1
	local cmd=$2
	local count=0
	local stars=""

	# Start the process immediately without printing the header in advance / Сразу запускаем процесс, не печатая заголовок заранее[cite: 2]
	eval "$cmd" &
	local pid=$!

	while kill -0 $pid 2>/dev/null; do
		stars="${stars}*"
		count=$((count + 1))
		# Print everything at once with carriage return \r / Печатаем всё сразу с возвратом курсора \r[cite: 2]
		printf "\r$L_COPY_LABEL %-15s: [%-50s]" "$label" "$stars"

		if [ $count -ge 50 ]; then
			stars=""
			count=0
		fi
		sleep 0.5
	done

	# Final line: stars are hardcoded to overwrite any leftover junk / Финальная строка: звезды вписаны жестко, чтобы затереть любой мусор
	printf "\r\e[K%s %-15s: [\e[32m**************************************************\e[0m] \n\e[32m%s\e[0m\n" "$L_COPY_LABEL" "$label" "$L_SUCCESS"

}

echo -e "\e[38;5;223m****************************************************\e[0m"
echo -e "$L_START_INST"
echo -e "\e[38;5;223m****************************************************\e[0m"

# Search for eMMC and SD drives creates the hasdrives variable / Поиск eMMC и SD-накопителей создает переменную hasdrives
hasdrives=$(lsblk | grep -oE '(mmcblk[0-9])' | sort | uniq)
if [ "$hasdrives" = "" ]; then
	echo "$L_NO_DRIVES_SD"
	exit 1
fi

# Advanced search for drives into the avail variable / Расширенный поиск дисков в переменную avail
avail=$(lsblk | grep -oE '(mmcblk[0-9]|sda[0-9])' | sort | uniq)
if [ "$avail" = "" ]; then
	echo "$L_NO_DRIVES"
	exit 1
fi

# Unmount /var/log.hdd so the logic below can find the root partition / Отмонтировать (отключить) /var/log.hdd, чтобы логика ниже могла найти корневой раздел
umount /var/log.hdd

# Identifies the current boot disk and searches for the target eMMC drive / Выясняет, с какого диска система загружена прямо сейчас, и ищет целевой eMMC-накопитель
# The location of the currently running system's "root" is stored in the runfrom variable / Где находится «корень» текущей запущенной системы записывается в переменную runfrom
runfrom=$(lsblk | grep /$ | grep -oE '(mmcblk[0-9]|sda[0-9])')
if [ "$runfrom" = "" ]; then
	echo "$L_ROOT_NOT_FOUND"
	exit 1
fi

# Calculate the target eMMC disk using sed / Вычисление целевого eMMC-диска с помощью sed
emmc=$(echo $avail | sed "s/$runfrom//" | sed "s/sd[a-z][0-9]//g" | sed "s/ //g")
if [ "$emmc" = "" ]; then
	echo "$L_EMMC_NOT_FOUND"
	exit 1
fi

# Ensure the user is not trying to break the system by installing it onto itself / Убедиться, что пользователь не пытается сломать систему, устанавливая её саму на себя
if [[ "$avail" == *"$runfrom"* ]] && [ "$(echo "$avail" | wc -w)" -le 1 ]; then
	echo "$L_ALREADY_EMMC"
	exit 1
fi

if [ $runfrom = $emmc ]; then
	echo "$L_ALREADY_EMMC"
	exit 1
fi

if [ "$(echo $emmc | grep mmcblk)" = "" ]; then
	echo "$L_ALREADY_EMMC_NOT"
	exit 1
fi

# Preparing and creating a bootloader backup / Подготовка и создание бэкапа загрузчика
# Full system path / Полный системный путь
DEV_EMMC="/dev/$emmc"
echo "$L_FULL $DEV_EMMC"

echo "$L_BACKUP_UBOOT"
# dd is a powerful utility for byte-for-byte data copying / dd — это мощнейшая утилита для побайтового копирования данных
# The command reads data from eMMC (if) and writes it to a file (of) / Команда читает данные с eMMC (if) и записывает их в файл (of)
# bs=1M count=4: copies exactly the first 4 Megabytes of the disk / bs=1M count=4: копирует ровно первые 4 Мегабайта диска
dd if="${DEV_EMMC}" of=/root/u-boot-default-aml.img bs=1M count=4

# Destruction of old data and new partitioning / Уничтожение старых данных и новая разметка
echo "$L_MBR_PART"
# Creates a new MBR partition table. This command instantly wipes all old partitions on the disk / Создает новую таблицу разделов MBR. Эта команда мгновенно стирает все старые разделы на диске
parted -s "${DEV_EMMC}" mklabel msdos
# Creates the first partition (FAT32) approximately 512 MB in size (from the 1000 MB mark to 1512 MB) / Создает первый раздел (FAT32) размером около 512 МБ (от отметки 1000 МБ до 1512 МБ)
parted -s "${DEV_EMMC}" mkpart primary fat32 1000M 1512M
# Creates the second partition (EXT4) for the main system (root). It occupies all remaining space until the end of the disk (100%) / Создает второй раздел (EXT4) под основную систему (root). Он занимает всё оставшееся до конца диска пространство (100%)
parted -s "${DEV_EMMC}" mkpart primary ext4 1513M 100%

echo "$L_RESTORE_UBOOT"
# This command copies exactly 442 bytes from the backup back to the disk / Эта команда копирует из бэкапа обратно на диск ровно 442 байта
# MBR structure (in the first sector): the first 446 bytes are the bootloader code, and the partition table starts from byte 447 / Структура MBR (в самом первом секторе): первые 446 байт — это код загрузчика, а с 447-го байта начинается таблица разделов
# By copying 442 bytes, we restore the boot code but stop just before overwriting our new partition table / Скопировав 442 байта, мы восстанавливаем стартовый код загрузчика, но останавливаемся за миллиметры до того, чтобы затереть нашу новую таблицу разделов
dd if=/root/u-boot-default-aml.img of="${DEV_EMMC}" conv=fsync bs=1 count=442
# Now we need to restore the remainder of the 4 Megabytes (U-Boot itself) / Теперь нам нужно восстановить остаток из 4 Мегабайт (сам U-Boot)
# We skip the zero sector (where the MBR with our brand-new partition table resides) / Мы перепрыгиваем через нулевой сектор (где лежит MBR с нашей новенькой таблицей разделов)
# We restore everything else, starting from the second sector / И восстанавливаем всё остальное, начиная со второго сектора
dd if=/root/u-boot-default-aml.img of="${DEV_EMMC}" conv=fsync bs=512 skip=1 seek=1
# Forcefully writes all changes from RAM to the physical eMMC disk so nothing is lost upon reboot / Принудительно записывает все изменения из оперативной памяти на физический диск eMMC, чтобы ничего не потерялось при перезагрузке
sync
echo -e "\e[32m$L_SUCCESS\e[0m"

echo -n "$L_COPY_EMMC"
# Creating the ddbr folder / Создание папки ddbr
mkdir -p /ddbr
# Granting 777 permissions: absolute full rights for everyone / Выдача прав 777: абсолютно полные права для всех
chmod 777 /ddbr

# Defining the boot partition (Boot) / Определение загрузочного раздела (Boot)
PART_BOOT="${DEV_EMMC}p1"
# Defining the root partition (Root) / Определение корневого раздела (Root)
PART_ROOT="${DEV_EMMC}p2"
# Defining the installation folder / Определение папки для установки
DIR_INSTALL="/ddbr/install"

# Cleaning up the temporary folder / Очистка временной папки
if [ -d $DIR_INSTALL ]; then
	rm -rf $DIR_INSTALL
fi
mkdir -p $DIR_INSTALL

# Creating a new file with the correct parameters / Создаем новый файл с правильными параметрами
# VAR_BOOT_EMMC="BOOT_EMMC"
# VAR_ROOT_EMMC="ROOT_EMMC" + received data / +получил данные
# BOOT_EMMC - name of the new partition p1 / название нового раздела p1
# ROOT_EMMC - name of the new partition p2 / название нового раздела p2

# Forcing the unmount of the Boot partition / Принудительное отключение Boot-раздела
if grep -q $PART_BOOT /proc/mounts; then
	echo "$L_OFF_BOOT"
	sync
	umount -f "$PART_BOOT" || umount -l "$PART_BOOT"
	echo -e "\e[32m$L_SUCCESS\e[0m"
fi

# Safely forcing the unmount of $PART_ROOT / Безопасное принудительное отключение $PART_ROOT
if grep -q "$PART_ROOT" /proc/mounts; then
	echo "$L_OFF_ROOT"
	sync
	# First try politely; if it fails, use force (-f) / Сначала пробуем вежливо, если нет — принудительно (-f)
	umount -f "$PART_ROOT" || umount -l "$PART_ROOT"
	echo -e "\e[32m$L_SUCCESS\e[0m"
fi

echo -n "$L_FORMAT_BOOT"
if mkfs.vfat -n "BOOT_EMMC" "$PART_BOOT" >/dev/null 2>&1; then
	echo -e "\e[32m$L_SUCCESS\e[0m"
else
	echo -e "$L_FORMAT_BOOT_ERR"
	exit 1
fi

echo -n "$L_FS_CHECK"
# Using fsck.vfat -a (auto-repair) for FAT32 / Используем fsck.vfat -a (авто-исправление) для FAT32
if fsck.vfat -a "$PART_BOOT" >/dev/null 2>&1; then
	echo -e "\e[32m$L_SUCCESS\e[0m"
else
	echo -e "$L_ERR"
	exit 1
fi

# Formatting (check added) / Форматирование (добавлена проверка)
echo -n "$L_FORMAT_ROOT"
# -F (force) is important here so it doesn't ask any questions / -F (force) здесь важен, чтобы не задавал вопросов
if mke2fs -F -q -t ext4 -L "ROOT_EMMC" -m 0 "$PART_ROOT" >/dev/null 2>&1; then
	echo -e "\e[32m$L_SUCCESS\e[0m"
else
	echo -e "$L_FORMAT_BOOT_ERR"
	exit 1
fi

# Fast integrity check / Быстрая проверка целостности
echo -n "$L_FS_CHECK"
if e2fsck -n "$PART_ROOT" >/dev/null 2>&1; then
	echo -e "\e[32m$L_SUCCESS\e[0m"
else
	echo -e "$L_ERR_SYS"
	exit 1
fi

# Waiting for system update / Ожидание обновления системы
sync
udevadm settle
sleep 2
echo "$L_SYS_UPD"

# WAIT CYCLE for LABEL p1 (10 attempts) / ЦИКЛ ОЖИДАНИЯ LABEL p1 (10 попыток)
echo "$L_WAIT_LABEL $PART_BOOT..."
MAX_TRIES=10
COUNT=0
RAW_LABEL=""

MOUNT_SUCCESS=0
while [ $COUNT -lt $MAX_TRIES ]; do
	sync
	# udevadm settle forces the kernel to finish registering new disk names / udevadm settle заставляет ядро завершить регистрацию новых имен дисков
	udevadm settle

	# Searching for the partition label (LABEL) / Ищем метку (LABEL) раздела
	RAW_LABEL=$(blkid -s LABEL -o value "$PART_BOOT")

	if [ -n "$RAW_LABEL" ]; then
		echo -e "\e[32m$L_LABEL_FOUND: $RAW_LABEL\e[0m"
		# Generating the final variable for fstab and extlinux.conf / Формируем итоговую переменную для fstab и extlinux.conf
		VAR_BOOT_EMMC="$RAW_LABEL"
		break
	fi

	echo -n "."
	sleep 1
	COUNT=$((COUNT + 1))
done

# Result verification / Проверка результата
if [ -z "$RAW_LABEL" ]; then
	# If the label was not found after 10 attempts (RAW_LABEL is empty) / Если за 10 попыток метку так и не нашли (RAW_LABEL пустая)
	echo -e "$L_LABEL_ERR"
	VAR_BOOT_EMMC="BOOT_EMMC"
fi

# WAIT CYCLE for LABEL p2 (10 attempts) / ЦИКЛ ОЖИДАНИЯ LABEL p2 (10 попыток)
echo "$L_WAIT_LABEL $PART_ROOT..."
MAX_TRIES=10
COUNT=0
RAW_LABEL=""

while [ $COUNT -lt $MAX_TRIES ]; do
	sync
	# udevadm settle forces the kernel to finish registering new disk names / udevadm settle заставляет ядро завершить регистрацию новых имен дисков
	udevadm settle

	# Searching for the partition label (LABEL) / Ищем метку (LABEL) раздела
	RAW_LABEL=$(blkid -s LABEL -o value "$PART_ROOT")

	if [ -n "$RAW_LABEL" ]; then
		echo -e "\e[32m$L_LABEL_FOUND: $RAW_LABEL\e[0m"
		# Generating the final variable for fstab and extlinux.conf / Формируем итоговую переменную для fstab и extlinux.conf
		VAR_ROOT_EMMC="$RAW_LABEL"
		break
	fi

	echo -n "."
	sleep 1
	COUNT=$((COUNT + 1))
done

# Result verification / Проверка результата
if [ -z "$RAW_LABEL" ]; then
	# If the label was not found after 10 attempts (RAW_LABEL is empty) / Если за 10 попыток метку так и не нашли (RAW_LABEL пустая)
	echo -e "$L_LABEL_ERR"
	VAR_ROOT_EMMC="ROOT_EMMC"
fi

mount -o rw $PART_BOOT $DIR_INSTALL

echo -n "$L_COPY_BOOT"
cp -r /boot/. $DIR_INSTALL && sync
echo -e "\e[32m$L_SUCCESS\e[0m"

echo "$L_EDIT_CONF"
# Defining the path to the folder and file / Определяем путь к папке и файлу
CONF_DIR="$DIR_INSTALL/extlinux"
CONF_FILE="$CONF_DIR/extlinux.conf"

# Directory check: if it doesn't exist, create it / Проверка папки: если нет — создаем
if [ ! -d "$CONF_DIR" ]; then
	echo "$L_CREATE_DIRECTORY $CONF_DIR..."
	mkdir -p "$CONF_DIR"
fi

# Checking if the configuration file (extlinux.conf) exists on eMMC / Проверяем: существует ли файл конфигурации (extlinux.conf) на eMMC
if [ -f "$CONF_FILE" ]; then
	echo -n "$L_FILE_FOUND"
	rm -f "$CONF_FILE"
	sync
fi

echo -n "$L_CREATE_NEW_CONF"

SUCCESS=false
for i in {1..10}; do
	# Writing the config / Записываем конфиг
	cat <<EOF >"$CONF_FILE"
LABEL Armbian
LINUX /zImage
INITRD /uInitrd
FDT /dtb/amlogic/meson-sm1-h96-max-x3.dtb
APPEND root=LABEL=$VAR_ROOT_EMMC rw rootwait rootfstype=ext4 console=ttyAML0,115200n8 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0 max_loop=128 loglevel=3 voutmode=hdmi disablehpd=false overscan=100 sdrmode=auto
EOF

	# Force flushing the cache to eMMC / Принудительно сбрасываем кэш на eMMC
	sync

	# CHECK: file exists and is NOT empty (-s) / ПРОВЕРКА: файл существует и он НЕ пустой (-s)
	if [ -s "$CONF_FILE" ]; then
		SUCCESS=true
		echo -e "\e[32m$L_CREATE_OK $i/10)\e[0m"
		break
	else
		echo -e "$L_CREATE_ERR"
		sleep 1
	fi
done

if [ "$SUCCESS" = false ]; then
	echo -e "$L_CREATE_ERR_NOT"
	exit 1
fi

echo -n "$L_SAVE_DATA"
sync
sleep 1
sync
echo -e "\e[32mEXTLINUX.CONF $L_SUCCESS\e[0m"

echo "$L_UPD_UENV"

UENV_FILE="$DIR_INSTALL/uEnv.txt"

# Forcefully delete the old file if it exists / Принудительно удаляем старый файл, если он существует
if [ -f "$UENV_FILE" ]; then
	echo -n "$L_DEL_UENV"
	rm -f "$UENV_FILE"
	sync
fi

SUCCESS_UENV=false
for i in {1..10}; do
	# Writing the config / Записываем конфиг
	cat <<EOF >"$UENV_FILE"
LINUX=/zImage
INITRD=/uInitrd
FDT=/dtb/amlogic/meson-sm1-h96-max-x3.dtb
APPEND=root=LABEL=$VAR_ROOT_EMMC rw rootwait rootfstype=ext4 console=ttyAML0,115200n8 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0 max_loop=128 loglevel=3 voutmode=hdmi disablehpd=false overscan=100 sdrmode=auto
EOF
	# Flushing the cache to eMMC / Сбрасываем кэш на eMMC
	sync

	# CHECK: file exists and is NOT empty / ПРОВЕРКА: файл существует и он НЕ пустой
	if [ -s "$UENV_FILE" ]; then
		SUCCESS_UENV=true
		echo -e "\e[32m$L_CREATE_OK $i/10)\e[0m"
		break
	else
		echo -e "$L_CREATE_ERR"
		sleep 1
	fi
done

if [ "$SUCCESS_UENV" = false ]; then
	echo -e "$L_CREATE_ERR_NOT"
	exit 1
fi

echo -n "$L_SAVE_DATA"
sync
sleep 1
sync
echo -e "\e[32mUENV.TXT $L_SUCCESS\e[0m"

# Removing redundant scripts needed only for the first boot from the flash drive / Удаляя лишние скрипты, которые нужны были только для первого запуска с флешки
rm $DIR_INSTALL/s9*
rm $DIR_INSTALL/aml*

# Migrating the bootloader, renaming, and writing to boot.ini / Переносит загрузчик, переименовывает, прописывает в boot.ini
echo -n "$L_EDIT_BOOTINI"

# Checking if the file exists on the source flash drive (in the /boot folder) / Проверяем, есть ли файл на исходной флешке (в папке /boot)
if [ -f "/boot/u-boot.ext" ]; then

	# If it is missing from eMMC for some reason, force copy it again / Если на eMMC его почему-то нет, копируем его принудительно еще раз
	if [ ! -f "$DIR_INSTALL/u-boot.ext" ]; then
		cp -f /boot/u-boot.ext "$DIR_INSTALL/"
		sync
	fi

	# Now that we are certain the file is on eMMC, rename it / Теперь, когда мы уверены, что файл на eMMC, переименовываем
	mv -f "$DIR_INSTALL/u-boot.ext" "$DIR_INSTALL/u-boot.emmc"

	# Correcting the path in boot.ini / Исправляем путь в boot.ini
	if [ -f "$DIR_INSTALL/boot.ini" ]; then
		sed -i "s/u-boot.ext/u-boot.emmc/g" "$DIR_INSTALL/boot.ini"
		echo -e "$L_SUCCESS"
	else
		echo -e "$L_BOOTINI_NOT"
	fi

	sync
else
	# If the file is missing even on the flash drive, that's unusual; report it / Если файла нет даже на флешке — это странно, сообщаем об этом
	echo -e "$L_BOOTINI_NOT_FLASH"
fi

# Unmounting and forcing data write / Размонтирование и принудительная дозапись
umount $DIR_INSTALL

echo -n "$L_COPY_ROOT"
sync
sleep 1

MAX_TRIES=10
COUNT=0

while [ $COUNT -lt $MAX_TRIES ]; do
	sync
	# udevadm settle forces the kernel to finish registering new disk names / udevadm settle заставляет ядро завершить регистрацию новых имен дисков
	udevadm settle

	# Mounting attempt / Попытка монтирования
	if mount -o rw "$PART_ROOT" "$DIR_INSTALL"; then
		MOUNT_SUCCESS=1
		sync
		echo -e "$L_SUCCESS"
		break
	fi

	echo -n "."
	sleep 1
	COUNT=$((COUNT + 1))
done

# Result check / Проверка результата
if [ "$MOUNT_SUCCESS" -eq 0 ] || ! mountpoint -q "$DIR_INSTALL"; then
	echo -e "$L_CREATE_ERR_ROOT_NOT"
	exit 1
fi

# --- ФУНКЦИЯ АНИМИРОВАННОГО КОПИРОВАНИЯ ---
copy_with_stars() {
	local dir=$1
	local count=0
	local stars=""

	# Checking if the folder exists at the source (at the root of the flash drive) / Проверяем, существует ли папка в источнике (в корне флешки)
	if [ -d "/$dir" ]; then
		# Printing the header once / Печатаем заголовок один раз
		printf "$L_COPY_LABEL %-10s:" "$dir"

		# Starting the copy in the background.
		# --warning=no-timestamp suppresses errors caused by incorrect system time.
		# 2>/dev/null hides system spam from tar. /
		# Запускаем копирование в фоне.
		# --warning=no-timestamp убирает ошибки из-за сбитого времени.
		# 2>/dev/null скрывает системный спам tar.
		tar -cf - "$dir" 2>/dev/null | (
			cd "$DIR_INSTALL"
			tar --warning=no-timestamp -xpf - 2>/dev/null
		) &
		PID=$!

		# While the copy process (PID) is running in the background / Пока процесс копирования (PID) работает в фоне
		while kill -0 $PID 2>/dev/null; do
			stars="${stars}*"
			count=$((count + 1))

			# \r returns the cursor to the beginning of the line, allowing it to be overwritten / \r возвращает курсор в начало строки, позволяя её переписывать
			printf "\r$L_COPY_LABEL %-10s: [%-50s]" "$dir" "$stars"

			# If we hit 50 stars, reset the progress bar / Если набрали 50 звезд — сбрасываем полосу
			if [ $count -ge 50 ]; then
				stars=""
				count=0
				sleep 0.2
			fi

			# Star appearance speed / Скорость появления звезд
			sleep 0.5
		done

		# Once the process is complete, draw a full bar and write SUCCESS / Когда процесс завершен, рисуем полную полосу и пишем УСПЕШНО
		printf "\r$L_COPY_LABEL %-10s: [\e[32m**************************************************\e[0m]\n\e[32m$L_SUCCESS\e[0m\n" "$dir"
	fi
}

# --- MAIN COPYING PROCESS --- / --- ОСНОВНОЙ ПРОЦЕСС КОПИРОВАНИЯ ---
cd /

echo -e "$L_COPY_FS"
echo -e "\e[33m--------------------------------------------------------\e[0m"

# Copying main system folders using the star animation function / Копируем основные системные папки через функцию со звездами
for d in bin etc home lib opt sbin selinux srv usr var; do
	copy_with_stars "$d"
done

# Separate processing for root (to exclude the installation script itself) / Отдельная обработка для root (чтобы исключить сам скрипт установки)
EXCLUDES="--exclude='install*.sh' \
          --exclude='.bash_history' \
          --exclude='.cache' \
          --exclude='.dbus' \
          --exclude='.gvfs' \
          --exclude='.Xauthority' \
          --exclude='.ICEauthority'"

# Starting the copy. Note the spaces after ROOT for alignment / Запускаем копирование. Обрати внимание на пробелы после ROOT для выравнивания
tar $EXCLUDES -cf - root 2>/dev/null | (
	cd "$DIR_INSTALL"
	tar --warning=no-timestamp -xpf - 2>/dev/null
) &
PID=$!
stars=""
count=0

while kill -0 $PID 2>/dev/null; do
	stars="${stars}*"
	count=$((count + 1))
	# Aligning the colon with other folders (15 characters) / Выравниваем двоеточие под остальные папки (15 символов)
	printf "\r$L_COPY_LABEL ROOT      : [%-50s]" "$stars"
	[ $count -ge 50 ] && stars="" && count=0
	sleep 0.5
done    

printf "\r\e[K%s ROOT      : [\e[32m**************************************************\e[0m] \n\e[32m%s\e[0m\n" "$L_COPY_LABEL" "$L_SUCCESS"

# Processing lib64 (only if it exists) / Обработка lib64 (только если она существует)
[ -d /lib64 ] && copy_with_stars "lib64"

# --- CREATING EMPTY SYSTEM DIRECTORIES --- / --- СОЗДАНИЕ ПУСТЫХ СИСТЕМНЫХ ПАПОК ---
echo -e "\e[33m--------------------------------------------------------\e[0m"
echo -e "$L_CREATE_DIRS"

for d in dev media mnt proc run sys tmp; do
	mkdir -p "$DIR_INSTALL/$d"
	# %-15s will align folder names into a column / %-15s выровняет названия папок в колонку
	printf "$L_CREATE_DIRECTORY %-15s \e[32m$L_SUCCESS\e[0m\n" "$d:"
done

# Setting 1777 permissions on tmp (required for XFCE to work on eMMC) / Установка прав 1777 на tmp (обязательно для работы XFCE на eMMC)
chmod 1777 "$DIR_INSTALL/tmp"

# Copying files located directly in the root
# Changing to the root directory before execution (required) /
# Копирование файлов, лежащих прямо в корне
# Переходим в корень перед запуском (обязательно)
cd /
# Formulating the command for root files and links with animation
# We use single quotes around the entire command so that eval inside the function works correctly /
# Формируем команду для файлов и ссылок корня c анимацией
# Мы используем одинарные кавычки вокруг всей команды, чтобы eval внутри функции отработал корректно
ROOT_CMD='find / -maxdepth 1 \( -type f -o -type l \) -exec cp -d {} "'$DIR_INSTALL'/" \; 2>/dev/null; \
          find / -maxdepth 1 -name ".*" \( -type f -o -type l \) -exec cp -d {} "'$DIR_INSTALL'/" \; 2>/dev/null'
# Starting the animation for the root / Запускаем анимацию для корня
animate_process "ROOT_FILES" "$ROOT_CMD"

echo -e "$L_EDIT_FSTAB"

# Creating a new file with the correct parameters
# VAR_BOOT_EMMC="BOOT_EMMC"
# VAR_ROOT_EMMC="ROOT_EMMC" + received data
# BOOT_EMMC - name of the new partition p1
# ROOT_EMMC - name of the new partition p2 /

# Создаем новый файл с правильными параметрами
# VAR_BOOT_EMMC="BOOT_EMMC"
# VAR_ROOT_EMMC="ROOT_EMMC" + получил данные
# BOOT_EMMC - название нового раздела p1
# ROOT_EMMC - название нового раздела p2

# Forcing the removal of the old fstab file if it exists / Принудительно удаляем старый файл fstab, если он существует
if [ -f "$DIR_INSTALL/etc/fstab" ]; then
	echo "$L_DEL_FSTAB"
	rm -f "$DIR_INSTALL/etc/fstab"
	sync
	# While all file system events are being processed by the kernel / Пока все события файловой системы будут обработаны ядром
	udevadm settle
	# Pause for eMMC controller stabilization / Пауза для стабилизации контроллера eMMC
	sleep 1
fi
SUCCESS_FSTAB=false
for i in {1..10}; do
	# Writing the config / Записываем конфиг
	cat <<EOF >"$DIR_INSTALL/etc/fstab"
LABEL=$VAR_ROOT_EMMC        /       ext4    defaults,noatime,errors=remount-ro  0 1
LABEL=$VAR_BOOT_EMMC        /boot   vfat    defaults                            0 2
tmpfs                       /tmp    tmpfs   defaults,nosuid                     0 0
EOF
	# Flushing the cache to eMMC / Сбрасываем кэш на eMMC
	sync

	# CHECK: file exists and is NOT empty / ПРОВЕРКА: файл существует и он НЕ пустой
	if [ -s "$DIR_INSTALL/etc/fstab" ]; then
		SUCCESS_FSTAB=true
		echo -e "\e[32m$L_CREATE_FSTAB_OK $i/10)\e[0m"
		break
	else
		echo -e "$L_CREATE_ERR"
		sleep 1
	fi
done

if [ "$SUCCESS_FSTAB" = false ]; then
	echo -e "$L_CREATE_ERR_NOT"
	exit 1
fi

echo "$L_CLEANUP"

# 1. General cleanup (always performed) / 1. Общая очистка (делается всегда)
FILES_TO_REMOVE="root/install*.sh root/fstab.template usr/bin/ddbr"
for item in $FILES_TO_REMOVE; do
	[ -f "$DIR_INSTALL/$item" ] && rm -f "$DIR_INSTALL/$item"
done

# Clearing session cache (to prevent old windows from opening) / Очистка кэша сессий (чтобы не открывались старые окна)
rm -rf "$DIR_INSTALL/root/.cache/sessions/"* 2>/dev/null
for user_dir in "$DIR_INSTALL/home/"*; do
	[ -d "$user_dir" ] && rm -rf "$user_dir/.cache/sessions/"* 2>/dev/null
done

# 2. MODE CHECK: If reset (First Run) is selected / 2. ПРОВЕРКА РЕЖИМА: Если выбран сброс (First Run)
if [ "$INSTALL_MODE" = "2" ]; then
	echo "$L_RESET_OWNER"

	# Removing user entries from all system databases / Удаляем записи пользователя из всех системных баз
	if [ -d "$DIR_INSTALL/home" ]; then
		for user_dir in "$DIR_INSTALL/home/"*; do
			[ -e "$user_dir" ] || continue # Checking for an empty folder / Проверка на пустую папку

			username=$(basename "$user_dir")

			# Excluding system folders that may be in /home / Исключаем системные папки, которые могут быть в /home
			if [ "$username" = "lost+found" ]; then continue; fi

			# Checking if such a user exists in the target system's passwd / Проверяем, существует ли такой пользователь в passwd целевой системы
			if grep -q "^$username:" "$DIR_INSTALL/etc/passwd"; then
				# Removing user entries / Удаляем записи пользователя
				for file in passwd shadow group gshadow; do
					sed -i "/^$username:/d" "$DIR_INSTALL/etc/$file"
				done

				# Removing the home directory itself / Удаляем саму домашнюю директорию
				rm -rf "$user_dir"
				echo "User '$username' removed / Пользователь '$username' удален"
			else
				# If the folder exists but the user is not in passwd — just delete the folder (junk) / Если папка есть, а пользователя в passwd нет — просто удаляем папку (мусор)
				rm -rf "$user_dir"
			fi
		done
	fi

	# Resetting first-run flags / Сбрасываем флаги первого запуска
	rm -f "$DIR_INSTALL/var/lib/armbian/first_run_completed" 2>/dev/null
	rm -f "$DIR_INSTALL/root/.not_configured" 2>/dev/null

	# Clearing history / Очистка истории
	truncate -s 0 "$DIR_INSTALL/root/.bash_history" 2>/dev/null

	echo -e "$L_READY_FIRST_BOOT"
else
	echo -e "$L_USER_SAVED"
fi

echo -e "$L_CLEAN_EMMC_OK"

sync

cd /
sync

# Attempting to unmount everything that might remain in $DIR_INSTALL / Пробуем размонтировать всё, что могло остаться в $DIR_INSTALL
if grep -q "$DIR_INSTALL" /proc/mounts; then
	echo -e "$L_FINAL_UMOUNT"
	umount -l "$DIR_INSTALL" && echo -e "$L_SUCCESS"
fi

# Triple sync — an old Linux tradition to ensure eMMC saves everything
# Тройной sync — старая добрая традиция Linux, чтобы eMMC точно всё сохранила
sync
sleep 1
sync
sync

echo -e "*************************************************************"
echo -e "$L_DONE_TITLE"
echo -e "$L_DONE_MSG"
echo -e "*************************************************************"
