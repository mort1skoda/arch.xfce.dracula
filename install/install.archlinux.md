## archlinux
### UEFI system

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
passwd root
ssh -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" root@192.168.0.198
</pre>

<pre>
Start installing:
=================
loadkeys no
alias l='ls -la --color --group-directories-first'
ls /sys/firmware/efi/efivars
ip link
ip a
timedatectl status

fdisk -l
mkfs.ext4 /dev/root_partition
mkfs.ext4 /dev/sda7
mkswap /dev/swap_partition
mkswap /dev/sda2
mkfs.fat -F 32 /dev/efi_system_partition
mkfs.fat -F 32 /dev/sda1
mount /dev/root_partition /mnt
mount /dev/sda7 /mnt
mount --mkdir /dev/efi_system_partition /mnt/boot
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/swap_partition
swapon /dev/sda2

lsblk -o NAME,MODEL,PARTTYPENAME,FSTYPE,SIZE,MOUNTPOINTS,SERIAL

sda      8:0    1 447.1G  0 disk
├─sda1   8:1    1   512M  0 part /mnt/boot
├─sda2   8:2    1  14.9G  0 part [SWAP]
├─sda3   8:3    1  43.9G  0 part
├─sda4   8:4    1 254.1G  0 part
├─sda5   8:5    1  43.9G  0 part
├─sda6   8:6    1  43.9G  0 part
└─sda7   8:7    1  45.8G  0 part /mnt

pacstrap -K /mnt base base-devel linux linux-headers linux-firmware amd-ucode vim openssh networkmanager

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
alias l='ls -la --color --group-directories-first'

ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen

vim /etc/locale.conf
LANG=en_US.UTF-8

vim /etc/vconsole.conf
KEYMAP=no

vim /etc/hostname
arch

passwd

pacman -S grub efibootmgr os-prober
systemctl enable NetworkManager
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI

-----------------------------------------------
lslbk, check sda1 with /boot and /boot/EFI:
[root@archiso /]# lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0 702.1M  1 loop
sda      8:0    1 447.1G  0 disk
├─sda1   8:1    1   512M  0 part /boot
│                                /boot/EFI
├─sda2   8:2    1  14.9G  0 part [SWAP]
├─sda3   8:3    1  43.9G  0 part
├─sda4   8:4    1 254.1G  0 part
├─sda5   8:5    1  43.9G  0 part
├─sda6   8:6    1  43.9G  0 part
└─sda7   8:7    1  45.8G  0 part /
-----------------------------------------------


grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable sshd



exit or ctrl-d

umount -R /mnt

reboot

useradd -m -G wheel m
passwd m

EDITOR=/usr/bin/vim visudo

Put this at top of sudoers file:
Defaults editor=/usr/bin/vim

Go down to the first # %wheel
and uncomment it

ssh after reboot:
=================
ssh m@192.168.0.199

Git:
====
sudo pacman -S git github-cli -y
gh auth login
mkdir /home/m/clone
cd /home/m/clone
git clone https://github.com/mort1skoda/archlinux.git
cd archlinux
. .git_aliases
a



update system:
==============
sudo pacman -Syyu

Added aliases to .bash_aliases:
psyu='sudo pacman -Syu'
ps='sudo pacman -S '
-------

</pre>
