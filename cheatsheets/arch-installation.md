# Arch linux installation
## General information
- Encryption schema: LVM on LUKS
- Disk partitioning schema: GPT (EFI)
- Boot loader: systemd-boot
- `/dev/sda` - main device (root, home, swap, boot)
- `/dev/sda1` - boot device (boot)
- `/dev/sda2` - encrypted device (root, home, swap)
---
## Steps to follow
### Partitions
`$ fdisk /dev/sda`
#####  Clean the device
`d -> d -> ...`
##### Create the boot device - GPT + EFI system type
`g -> n -> [Enter] -> [Enter] -> +500M -> (YES) -> t -> 1`
##### Create OS device
`n -> [Enter] -> [Enter] -> +600G -> (YES) -> w`

## Encryption
##### Create LUKS encrypted container
`$ cryptsetup -vy luksFormat /dev/sda2`

##### Open the container
`$ cryptsetup open /dev/sda2 luks`

##### Create a physical volume on top of the opened LUKS container
`$ pvcreate /dev/mapper/luks`

##### Create the volume group named Disconnect (or whatever you want), adding the previously created physical volume to it
`$ vgcreate Disconnect /dev/mapper/luks`

##### Create all your logical volumes on the volume group
`$ lvcreate -L 8G Disconnect -n swap`
`$ lvcreate -L 100G Disconnect -n root`
`$ lvcreate -l 100%FREE Disconnect -n home`

##### Format your filesystems on each logical volume
`$ mkfs.fat -F32 /dev/sda1`
`$ mkfs.ext4 -L root /dev/Disconnect/root`
`$ mkfs.ext4 -L home /dev/Disconnect/home`
`$ mkswap /dev/Disconnect/swap`

##### Mount your filesystems
`$ mount /dev/Disconnect/root /mnt`
`$ mkdir /mnt/boot`
`$ mkdir /mnt/home`
`$ mount /dev/Disconnect/home /mnt/home`
`$ mount /dev/sda1 /mnt/boot`
`$ swapon /dev/Disconnect/swap`

##### Install essential packages
`$ pacstrap /mnt base base-devel linux linux-firmware vim lvm2`

##### Fstab
`$ genfstab -pU /mnt >> /mnt/etc/fstab`

##### Change root into the new system
`$ arch-chroot /mnt`

## Customization
##### Localization
`$ ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime`
`$ echo en_US.UTF-8 UTF-8 > /etc/locale.gen`
`$ locale-gen`
`$ echo LANG=en_US.UTF-8 > /etc/locale.conf`
`$ export LANG=en_US.UTF-8`
`$ hwclock -w`

##### Network configuration
`$ echo disconnect >> /etc/hostname`
`$ echo "127.0.0.1 localhost" >> /etc/hosts`
`$ echo "::1 localhost" >> /etc/hosts`

##### Boot loader (systemd-boot)
`$ bootctl install --esp-path=/boot`
`$ vim /boot/loader/loader.conf`
```
default arch.conf
timeout 4
editor no
```
`$ touch /boot/loader/entries/arch.conf`
`$ vim /boot/loader/entries/arch.conf`
```
title Disconnect
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=/dev/sda2:luks root=/dev/Disconnect/root quiet rw
```

##### Initramfs
`$ vim /etc/mkinitcpio.conf`
```
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard fsck)
```
`$ mkinitcpio -p linux`

##### Set root password
`$ passwd`

##### Reboot
`$ exit`
`$ umount -R /mnt`
`$ reboot`

### After reboot
##### Login as root
##### Create a user
`$ useradd -m -g users rappy`
`$ passwd rappy`
`$ vim /etc/sudoers`
```
root ALL=(ALL) ALL
rappy ALL=(ALL) ALL
```

##### Network service
pacman -S networkmanager
systemctl enable NetworkManager

##### Install X Server (xorg):
`$ pacman -S xorg-server xorg-apps xorg-xinit`

##### Video driver
`$ pacman -S xf86-video-ati` (AMD/ATI)
`$ pacman -S xf86-video-intel` (Intel)
`$ pacman -S xf86-video-nouveau` (Nvidia)
`$ pacman -S xf86-video-fbdev` (Fallback)
`$ pacman -S xf86-video-vesa` (Fallback)

##### Install the display manager (LightDM):
`$ sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter`
`$ systemctl enable lightdm`
`$ systemctl enable systemd-homed`
