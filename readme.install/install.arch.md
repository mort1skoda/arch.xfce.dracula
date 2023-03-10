## install.archlinux
### UEFI system



#### Download torrent:

   [archlinux.org/download](https://archlinux.org/download/)



#### Install transmission-gtk

    sudo pacman -S transmission-gtk



#### Download arhc iso:

   Download arch iso with transmission



    
#### Make bootable usb:

   confirm that your usb memory stick is /dev/sdb
   lsblk

    sudo dd bs=4M if=archlinux-2023.02.01-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
    

    
#### Read:

   [Installation guide](https://wiki.archlinux.org/title/Installation_guide)




#### Reboot into arch iso:

![archlinux_boot_iso](https://user-images.githubusercontent.com/6655776/215884852-a5e8a1e1-5d53-4ac0-a995-b6f9a2ac4d43.jpg)
    
    On my Gigabyte AM1S2H
    del to enter UEFI BIOS
    F12 boot menu



#### START INSTALLING:

    loadkeys no
    set -o vi
    passwd root
    ip a



#### Install via ssh:

    ssh -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" root@192.168.0.xxx



#### alias and check time:

    set -o vi
    alias l='ls -la --color --group-directories-first'
    timedatectl status



<pre>
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
</pre>



<pre>
lsblk /dev/sda -o NAME,MODEL,PARTTYPENAME,FSTYPE,SIZE,MOUNTPOINTS,SERIAL

sda      8:0    1 447.1G  0 disk
├─sda1   8:1    1   512M  0 part /mnt/boot
├─sda2   8:2    1  14.9G  0 part [SWAP]
├─sda3   8:3    1  43.9G  0 part
├─sda4   8:4    1 254.1G  0 part
├─sda5   8:5    1  43.9G  0 part
├─sda6   8:6    1  43.9G  0 part /mnt
└─sda7   8:7    1  45.8G  0 part
</pre>



#### pacstrap

    pacstrap -K /mnt base base-devel linux linux-headers linux-firmware amd-ucode vim openssh grub efibootmgr os-prober networkmanager



#### genfstab

    genfstab -U /mnt >> /mnt/etc/fstab
    cat /mnt/etc/fstab






---



#### arch-chroot

    arch-chroot /mnt

    set -o vi

    alias l='ls -la --color --group-directories-first'

    ln -svf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
    hwclock --systohc
    vim /etc/locale.gen
    locale-gen

    vim /etc/locale.conf
    LANG=en_US.UTF-8

    vim /etc/vconsole.conf
    KEYMAP=no

    vim /etc/hostname
    arch.sda6

    passwd root



#### grub

    pacman -S grub efibootmgr os-prober
    systemctl enable NetworkManager

---

    mkdir /boot/EFI
    mount /dev/sda1 /boot/EFI

-----------------------------------------------

## CHECKOUT AND CONTROL  /boot & /boot/EFI  ON sda1  !!!!!!
lslbk, check sda1 with /boot and /boot/EFI:

    lsblk /dev/sda -o NAME,MODEL,PARTTYPENAME,FSTYPE,SIZE,MOUNTPOINTS,SERIAL

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
├─sda6   8:6    1  43.9G  0 part /
└─sda7   8:7    1  45.8G  0 part

-----------------------------------------------


    grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB

    grub-mkconfig -o /boot/grub/grub.cfg

    systemctl enable sshd



    exit or ctrl-d

    umount -R /mnt

    reboot


    set -o vi

    useradd -m -G wheel m
    passwd m

    EDITOR=/usr/bin/vim visudo

Put this at top of sudoers file:
    Defaults editor=/usr/bin/vim

Go down to the first # %wheel
and uncomment it

    reboot

ssh after reboot:
=================
    ssh m@192.168.0.199


    set -o vi

    alias l='ls -la --color --group-directories-first'



Git:
====

    pacman -Qdtq
    sudo pacman -Syu

    gh auth login
    copy the XXX-XXX token
    go to: https://github.com/login/device
    sudo pacman -S git github-cli -y


    sudo mkdir /rep 
    cd /rep
    git clone https://github.com/mort1skoda/<fav-repo>.git
    cd <fav-repo>

    . .bash_aliases   
    a



update system:
==============
    sudo pacman -Syyu

    Added aliases to .bash_aliases:
    psyu='sudo pacman -Syu'
    ps='sudo pacman -S '
    pacman -Qdtq


-------

</pre>
