## archlinux
### UEFI system  Learn Linux TV

#### Download:
[archlinux.org/download](https://archlinux.org/download/)

<pre>
You get a torrent file like this:
archlinux-2023.01.01-x86_64.iso.torrent

Open torrent file in: transmission
And download the .iso file
</pre>

#### Make bootable usb:
<pre>
sudo dd bs=4M if=archlinux-2023.01.01-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
</pre>

[Installation guide](https://wiki.archlinux.org/title/Installation_guide)

<pre>
To install via ssh:
ssh -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" root@192.168.0.198
</pre>

<pre>
Start installing:
=================
loadkeys no
alias l='ls -la --color --group-directories-first'

To verify the boot mode, list the efivars directory:
ls /sys/firmware/efi/efivars
   If the command shows the directory without error,
   then the system is booted in UEFI mode.

ip link
ping -c 4 archlinux.org

   Note: In the installation image, systemd-networkd, systemd-resolved,
   iwd and ModemManager are preconfigured and enabled by default.
   That will not be the case for the installed system.

timedatectl status

PARTITIONS:
===========
fdisk -l
fdisk /dev/sda

mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda7

mount /dev/sda7 /mnt

mount --mkdir /dev/efi_system_partition /mnt/boot
mount --mkdir /dev/sda1 /mnt/boot

swapon /dev/swap_partition
swapon /dev/sda2

lsblk gives us this setup:
---------------------------------------------------------
root@archiso /mnt # lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0 702.1M  1 loop /run/archiso/airootfs
sda      8:0    1 447.1G  0 disk
├─sda1   8:1    1   512M  0 part /mnt/boot
├─sda2   8:2    1  14.9G  0 part [SWAP]
├─sda3   8:3    1  43.9G  0 part
├─sda4   8:4    1 254.1G  0 part
├─sda5   8:5    1  43.9G  0 part
├─sda6   8:6    1  43.9G  0 part
└─sda7   8:7    1  45.8G  0 part /mnt
---------------------------------------------------------

A more detailed lsblk:
---------------------------------------------------------------------------------------------------------
root@archiso /mnt # lsblk -o NAME,MODEL,PARTTYPENAME,FSTYPE,SIZE,MOUNTPOINTS,SERIAL
NAME   MODEL                 PARTTYPENAME       FSTYPE     SIZE MOUNTPOINTS           SERIAL
loop0                                           squashfs 702.1M /run/archiso/airootfs
sda    KINGSTON SA400S37480G                             447.1G                       50026B7784EAC033
├─sda1                       EFI System         vfat       512M /mnt/boot
├─sda2                       Linux swap         swap      14.9G [SWAP]
├─sda3                       Linux filesystem   ext4      43.9G
├─sda4                       Linux filesystem   ext4     254.1G
├─sda5                       Linux filesystem   ext4      43.9G
├─sda6                       Linux filesystem   ext4      43.9G
└─sda7                       Linux filesystem   ext4      45.8G /mnt
sdb    Voyager 3.0                              iso9660   14.5G                       0708122DA1A03563
├─sdb1                       Empty              iso9660    801M
└─sdb2                       EFI (FAT-12/16/32) vfat        15M
-----------------------------------------------------------------------------------------------------------

Packages that can be added by pacstrap:
base linux linux-firmware vim dhcpcd systemd-networkd systemd-resolved systemd-timesyncd sudo visudo grub-efi-x86_64 git
NB! sudo is in the base-devel package.

For now we follow: [Learn Linux TV](https://www.youtube.com/watch?v=DPLnBPM4DhI&t=42)
pacstrap -K /mnt base  
                        ?????genfstab -U /mnt >> /mnt/etc/fstab
CHROOT:
=======
arch-chroot /mnt
alias l='ls -la --color --group-directories-first'
pacman -S linux linux-headers linux-lts linux-lts-headers
    Select default (mkinitcpio)

pacman -S vim

pacman -S base-devel openssh 

If you want ssh to be available when you restart your installation:
systemctl enable sshd

Networking:
===========
pacman -S networkmanager  wpa_supplicant wireless_tools netctl 
    accept the defaults
pacman -S dialog
systemctl enable NetworkManager
---------------------------------------------------

USERS:
======
                     ???pacman -S lvm2
vim /etc/locale.gen
    Comment out the locale you want, I use en_US.UTF-8 UTF-8
local-gen

Set password for root:
passwd

useradd -m -g users -G wheel m
passwd m

Make sure sudo is on the system:
 pacman -S sudo
Or you can run:
 which sudo

visudo
    Uncomment the first %wheel


Installing GRUB:
================
pacman -S grub efibootmgr dosfstools os-prober mtools

    NB! check with lslbk if /boot is allready mounted on /dev/sda1
    if somthing IS mounted on /dev/sda1 unmount it with:
umount /dev/sda1
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

ls -l /boot/grub
    Look for a directory called locale, if it does not exist:
mkdir /boot/grub/locale

cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

    If you want os-prober to search for other os installed
vim /etc/default/grub
    uncomment GRUB_DISABLE_OS_PROBER=false

grub-mkconfig -o /boot/grub/grub.cfg

exit

genfstab -U /mnt >> /mnt/etc/fstab
umount -a
reboot

</pre>


