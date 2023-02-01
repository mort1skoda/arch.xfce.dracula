### Install GUI
#### archlinux

<pre>
sudo pacman -Syyu

lspci | grep -e VGA
On my Gigabyte AM1 i get:
00:01 0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Kabini [Radeon HD 8400 / R3 Series]
sudo pacman -S x86-video-amdgpu

---

sudo pacman -S xorg xterm xorg-init
To test type:
startx

---

s pacman -S xfce4

Create .xinitrc in ~ directory
setxkbmap no &
exec startxfce4

</pre>

