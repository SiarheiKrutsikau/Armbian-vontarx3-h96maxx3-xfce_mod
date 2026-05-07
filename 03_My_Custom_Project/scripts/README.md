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


