🛠 Repository Scripts / Скрипты репозитория

This folder contains essential tools for Armbian installation and image optimization.
1. SlimBtrfs.sh  (Recommended)

Advanced tool for optimizing and shrinking Linux disk images with deep Btrfs support.
🇺🇸 English Brief

SlimBtrfs.sh is a high-performance evolution of the image-shrinking concept.
    Key Features: Automatic Btrfs balance/defrag, dynamic resizing (no fixed limits), zero-filling free space, non-destructive (works on a copy), Gzip/XZ compression, and live CPU monitoring.
    Usage: sudo ./SlimBtrfs.sh your_image.img

🇷🇺 Краткое описание

SlimBtrfs.sh — продвинутая эволюция идеи сжатия образов.
    Основные возможности: Оптимизация Btrfs (balance/defrag), динамическое изменение размера (без жестких лимитов), зануление свободного места, безопасная работа с копией образа, сжатие Gzip/XZ и мониторинг нагрузки CPU.
    Запуск: sudo ./SlimBtrfs.sh "ваш_образ.img"

2. install-aml.sh

Automated installer for transferring Armbian from USB/SD to internal eMMC memory.
🇺🇸 English Description

This script prepares your TV box to operate independently without an external drive.
    Preparation: Language selection (EN/RU), time synchronization, and mode choice (Keep Environment or Reset/New Owner).
    Disk Management: Automatic eMMC detection, safe bootloader (U-Boot) backup, and smart partitioning (BOOT/ROOT).
    System Transfer: High-speed file copying with a progress bar and automatic boot configuration (extlinux/uEnv/boot.ini).
    Safety: Specifically protects the bootloader partition table to prevent "bricking" the device.

🇷🇺 Русское описание

Скрипт предназначен для переноса системы Armbian с флешки на внутреннюю память (eMMC).
    Подготовка: Выбор языка, синхронизация времени и выбор режима (Сохранение настроек или Полный сброс).
    Работа с диском: Поиск eMMC, бэкап загрузчика (U-Boot) и автоматическая разметка разделов.
    Перенос: Поочередное копирование системных папок с анимацией прогресса и настройка путей загрузки.
    Безопасность: Особый алгоритм защиты загрузчика, исключающий превращение приставки в «кирпич» при переразметке.

3. pishrink-btrfs2500M.sh (Legacy)
🇺🇸 English

A specialized tool that strictly shrinks the root partition to exactly 2500MB. Use this only if you need a predictable fixed size. For all other cases, use SlimBtrfs.sh.
🇷🇺 Русский
Специализированный инструмент, который принудительно сжимает раздел до 2500 МБ. Используйте его, только если вам нужен фиксированный размер. В остальных случаях рекомендуется SlimBtrfs.sh.


*****
English: Detailed Script Overview
Русский: Подробный обзор скриптов

SlimBtrfs.sh 

Advanced professional tool for optimizing and shrinking Linux disk images with Btrfs support.
📖 Detailed Script Overview / Подробный обзор скрипта
🇺🇸 English Description

SlimBtrfs.sh is a high-performance evolution of the classic image-shrinking concept. Specifically designed for Armbian and other Linux distributions using the Btrfs filesystem, it doesn't just reduce the file size — it performs deep filesystem optimization to ensure the health and portability of your images.
Key Features
    Btrfs Optimization: Automatically runs balance and defragment before shrinking to reorganize data efficiently.
    Zero-Fill Technology: Fills free space with zeros, allowing compression algorithms to achieve maximum ratios.
    Safety First: The script never modifies your original source image. All operations are safely performed on a .shrunk.img copy.
    Smart Compression:
        Gzip (-9): Fast and widely compatible.
        XZ (-T0): Ultra-compact storage using all available CPU cores.
        All-in-One: Option to generate both .gz and .xz formats in a single run.
    Live CPU Monitor: Real-time system load tracking during heavy compression tasks.
    Multi-language Support: Full interactive menu in English and Russian.

Requirements
    OS: Linux (Ubuntu/Debian/Armbian recommended).
    Packages: btrfs-progs, fdisk, util-linux, gzip, xz-utils.

Installation & Usage
Bash

# 1. Download or create the script and make it executable
chmod +x SlimBtrfs.sh

# 2. Run with sudo and provide your image path
sudo ./SlimBtrfs.sh your_image.img

🇷🇺 Описание на русском

SlimBtrfs.sh — это продвинутый профессиональный инструмент для оптимизации и уменьшения размера образов дисков. Скрипт разработан специально для Armbian и других дистрибутивов, использующих файловую систему Btrfs. Он не просто обрезает лишнее место, но и проводит глубокое обслуживание ФС для стабильной работы и компактного хранения.
Основные возможности
    Оптимизация Btrfs: Автоматический запуск balance и defragment перед уменьшением размера для эффективной переорганизации данных.
    Зануление свободного места: Технология Zero-Fill очищает пустое пространство, что позволяет архиваторам достичь экстремальной степени сжатия.
    Безопасность: Скрипт никогда не изменяет исходный файл. Все действия проводятся над рабочей копией .shrunk.img.
    Умное сжатие:
        Gzip (-9): Быстрый и максимально совместимый формат.
        XZ (-T0): Ультра-компактный архив с использованием всех ядер процессора.
        Всё вместе: Уникальный режим создания обоих архивов за один проход.
    Мониторинг CPU: Отображение реальной нагрузки на процессор во время упаковки.
    Двуязычный интерфейс: Интерактивное меню на русском и английском языках.

Требования
    ОС: Linux (рекомендуется Ubuntu/Debian/Armbian).
    Пакеты: btrfs-progs, fdisk, util-linux, gzip, xz-utils.

Установка и запуск
Bash

# 1. Сделайте скрипт исполняемым
chmod +x SlimBtrfs.sh

# 2. Запустите с правами суперпользователя
sudo ./SlimBtrfs.sh "ваш_образ.img"

*****
install-aml.sh
    This script is designed to transfer (install) the Armbian operating system from an external USB flash drive to the internal memory (eMMC) of your TV box. It acts as an automated installer that fully prepares the device to operate independently without a flash drive.
Step-by-Step Description of the Process:
1. Preparation and Mode Selection
    Language Choice: Immediately upon startup, the script prompts you to choose the interface: Russian or English.
    Time Sync: The script attempts to synchronize the system time (via the internet, file timestamps, or manually). This is crucial for the correct operation of file systems.
    Configuration Selection: The user is offered two options:
        Keep Environment: Transfers the system "as is," preserving all your files, settings, and the current user.
        Reset Settings (New Owner): Completely deletes user data and profiles, resetting the system to its "first run" state (default login: root, password: 123).

2. Disk Management (eMMC)
    Drive Search: The script automatically identifies the internal eMMC storage, ensuring you don't accidentally attempt to install the system onto itself.
    Bootloader Backup: Before any modifications, a backup of the original bootloader (U-Boot) is created in the /root/u-boot-default-aml.img file.
    Partitioning: The script wipes the eMMC and divides it into two partitions:
        BOOT (FAT32, ~512 MB): For kernel boot files and configurations.
        ROOT (EXT4, remaining space): For the operating system and applications.

3. System Transfer
    Formatting: Creates clean file systems on the new partitions.
    File Copying: System folders (such as bin, etc, home, usr, var, etc.) are transferred one by one.
        To keep the user informed, the process features an animated progress bar made of asterisks.
    Boot Configuration: The script automatically edits configuration files (extlinux.conf, uEnv.txt, boot.ini) so the system knows how to boot from the internal drive.

4. Finalization
    fstab Correction: Writes the correct mount paths for the drives to ensure error-free booting.
    Cleanup: Deletes temporary installation files and unnecessary scripts.
    Completion: After a "triple confirmation" (sync) of data writing, the script notifies you that the installation is complete. You may then power off the device and remove the flash drive.

Important Technical Note: The script specifically protects the bootloader. During partitioning, it restores the boot code from the backup but carefully "bypasses" the partition table to prevent the device from being "bricked" and ensure it remains bootable.

install-aml.sh
    Этот скрипт предназначен для переноса (установки) операционной системы Armbian с внешней флешки на внутреннюю память (eMMC) ТВ-приставки.
Скрипт выполняет роль автоматического установщика, который полностью подготавливает устройство к работе без флешки.
Пошаговое описание того, что он делает:
1. Подготовка и выбор режима
    Выбор языка: Сразу после запуска скрипт предлагает выбрать интерфейс: Русский или English.
    Настройка времени: Скрипт пытается синхронизировать системное время (через интернет, по дате файлов или принудительно), что важно для корректной работы файловых систем.
    Выбор конфигурации: Пользователю предлагается два варианта:
        Сохранение окружения: Переносит систему «как есть» — со всеми вашими файлами, настройками и текущим пользователем.
        Сброс настроек (Для нового владельца): Полностью удаляет пользовательские данные и профили, сбрасывает систему до состояния «первого запуска» (логин root пароль 123).

2. Работа с диском (eMMC)
    Поиск накопителя: Скрипт сам находит внутреннюю память (eMMC), проверяя, чтобы вы случайно не установили систему саму на себя.
    Бэкап загрузчика: Перед началом работ создается резервная копия оригинального загрузчика (U-Boot) в файле /root/u-boot-default-aml.img.
    Разметка диска: Скрипт полностью стирает eMMC и разбивает её на два раздела:
        BOOT (FAT32, ~512 МБ): Для файлов загрузки ядра и конфигураций.
        ROOT (EXT4, всё остальное место): Для самой операционной системы и программ.

3. Перенос системы
    Форматирование: Создает чистые файловые системы на новых разделах.
    Копирование файлов: * Поочередно переносит все системные папки (bin, etc, home, usr, var и др.).
        Чтобы пользователь не скучал, процесс сопровождается анимированной полосой прогресса из звездочек.
    Настройка загрузки: Скрипт автоматически редактирует файлы конфигурации (extlinux.conf, uEnv.txt, boot.ini), чтобы система знала, как запускаться с внутреннего диска.

4. Финализация
    Исправление fstab: Прописывает правильные пути монтирования дисков, чтобы система загружалась без ошибок.
    Очистка: Удаляет временные файлы установки и ненужные скрипты.
    Завершение: После «тройного подтверждения» (sync) записи данных на диск, скрипт сообщает, что установку можно считать оконченной — приставку можно выключать и вынимать флешку.

Важный нюанс кода: Скрипт специально оберегает загрузчик. При разметке он восстанавливает код загрузчика из бэкапа, но аккуратно «обходит» таблицу разделов, чтобы устройство не превратилось в «кирпич» и сохранило способность стартовать.

*****
pishrink-btrfs2500M.sh
[ EN ] English Description
🛡 PiShrink Btrfs Edition (2500MB Strict)

This script is a specialized Btrfs alternative to the famous PiShrink (which is designed for ext4). It allows you to minimize the size of your ARM-board images for easier sharing and storage.
    Logic: It strictly shrinks the root partition to exactly 2500MB.
    Safety: If the data on your image exceeds 2500MB, the script will stop and issue an ERROR to prevent data loss.
    Purpose: A "quick-fix" solution for standard builds where you need a predictable, fixed image size.
    Fast & Clean: Includes automatic free space zeroing for better .gz compression.
[ EN ] Usage Instructions
Your workflow is now as follows:
    Prepare the system: Set up and configure everything on your TV box as needed.
    Create a backup: Create an .img file of your SD card/drive (e.g., using the dd command on your PC).
    Run the script: Execute the script with root privileges:
    sudo ./pishrink-btrfs2500M.sh my_image.img
    Wait: After a few minutes, you will have a finished, ready-to-share, and ultra-compact image.

[ RU ] Русское описание
🛡 PiShrink Btrfs Edition (Строго 2500МБ)

Этот скрипт — специализированный аналог знаменитого PiShrink (который работает с ext4), но переписанный под файловую систему Btrfs. Он предназначен для минимизации размера образов ваших прошивок.
    Логика: Скрипт принудительно сжимает корневой раздел ровно до 2500 МБ.
    Безопасность: Если объем ваших данных в образе больше 2500 МБ, скрипт прервет работу и выдаст ошибку, чтобы не повредить файлы.
    Назначение: "Быстрое решение" (quick-fix) для типовых сборок, когда нужен фиксированный и предсказуемый размер итогового файла.
    Оптимизация: Автоматически забивает свободное место нулями для максимально эффективного сжатия в архив .gz.
[ RU ] Инструкция по использованию
Ваш порядок действий теперь такой:
    Подготовка: Настройте систему на приставке так, как вам нужно.
    Создание бэкапа: Сделайте образ .img вашей карты памяти или диска (например, через команду dd на компьютере).
    Запуск скрипта: Запустите скрипт от имени суперпользователя:
    sudo ./pishrink-btrfs2500M.sh my_image.img
    Результат: Подождите пару минут, и вы получите готовый, максимально компактный образ, удобный для хранения и передачи.
