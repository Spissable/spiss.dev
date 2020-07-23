+++
title = "Arch Linux - it's really not that complicated"
date = 2020-07-23T15:37:00+01:00

# [extra]
# updated = 2020-07-23T15:37:00+01:00
+++

This is a step by step installation documentation on how I install Arch Linux on my Dell XPS 13 (9370) - my primary work setup. This is quite opinionated (e.g. f2fs root partition) and not applicable on every machine out there. But perhaps a rough guideline on how to easily install Arch Linux nonetheless.

<!-- more -->

### Overview
- 2 partitions: boot (fat32), root (f2fs - encrypted)
- Bootloader: Systemd-boot (formerly gummiboot)
- Desktop Environment: Gnome

Please also consult the official [Arch Linux Documentation](https://wiki.archlinux.org/index.php/Installation_Guide).\
The step by step instructions can also be found on my [Github](https://github.com/Spissable/arch-linux-installation).

### Enter BIOS with F2 and configure:

- "System Configuration" > "SATA Operation": "AHCI"
- "Secure Boot" > "Secure Boot Enable": "Disabled"

### Boot from USB
**Make sure to boot from USB using UEFI - this is required by systemd-boot!**

### Set desired keymap
`loadkeys en_US-utf8`

### (Optional) Connect to wifi
`wifi-menu`

Once done it can take some seconds - confirm it worked using ping

`ping 1.1.1.1`

### Sync clock
`timedatectl set-ntp true`

### Create two partitions:
- 1000MB EFI partition with hex code **ef00**
- 100% Linux partiton (to be encrypted) with hex code **8300**

**CAUTION** Find the correct disk/partition names for yourself using `lsblk`. From here on I am using mine as an example. Do not blindly copy paste these, it might not work or you might destroy partitions you don't want to destroy.

`cgdisk /dev/nvme0n1`

### (Optional) Install f2fs-tools
`pacman -S f2fs-tools`

### Formatting and encyption
**Boot** partition

`mkfs.fat -F32 /dev/nvme0n1p1`

**Root** partition

`cryptsetup luksFormat --type=luks2 /dev/nvme0n1p2`

`cryptsetup open /dev/nvme0n1p2 luks`

(choose filesystem - assuming f2fs)

`mkfs.f2fs -l luks /dev/mapper/luks`

### Mount root and boot partition
`mount /dev/mapper/luks /mnt`

`mkdir -p /mnt/boot`

`mount /dev/nvme0n1p1 /mnt/boot`

### Change pacman mirror priority, move closer mirror to the top
`vim /etc/pacman.d/mirrorlist`

### Install the base system plus a few extra packages 

**f2fs-tools is needed if you chose f2fs as your partition**

**With some recent XPS Laptops linux-zen seems to be working better, e.g. resolves screen flickering issues**

```
pacstrap /mnt base linux linux-firmware zsh vim git sudo efibootmgr wpa_supplicant
dialog iw f2fs-tools
```

### Generate fstab
`genfstab -L /mnt >> /mnt/etc/fstab`

### Enter the new system
`arch-chroot /mnt`

### Setup time
`rm /etc/localtime`

`ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime`

`hwclock --systohc`

### Generate required locales
`vim /etc/locale.gen`

`locale-gen`

### Set desired locale
`echo 'LANG=en_US.UTF-8' > /etc/locale.conf`

### Set desired keymap and font
`echo 'KEYMAP=us' > /etc/vconsole.conf`

### Set the hostname
`echo '<hostname>' > /etc/hostname`

### Add hostname to /etc/hosts:
`vim /etc/hosts`

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	<hostname>.localdomain <hostname>
```

### Set password for root
`passwd`

### Add real user
`useradd -m -g users -G wheel -s /bin/zsh <username>`

`passwd <username>`

`echo '<username> ALL=(ALL) ALL' > /etc/sudoers.d/<username>`

### Configure mkinitcpio with modules needed for the initrd image
`vim /etc/mkinitcpio.conf`

```
# Optional - for f2fs module crypto-crc32 is required however
MODULES=(crypto-crc32)

# Important - Use the correct order
HOOKS=(base systemd autodetect modconf block keyboard sd-vconsole sd-encrypt filesystems)
```

### Regenerate initrd image
`mkinitcpio -P`

### Setup systemd-boot
`bootctl --path=/boot install`

### Enable Intel microcode updates
(For AMD replace **intel-ucode** with **amd-ucode** in every step that follows)

`pacman -S intel-ucode`

### Create bootloader entry
Get luks-uuid with: 

`cryptsetup luksUUID /dev/nvme0n1p2`

Create the entry:

`vim /boot/loader/entries/arch.conf`
```
title		Arch Linux
linux		/vmlinuz-linux
initrd		/intel-ucode.img
initrd		/initramfs-linux.img
options		rw luks.uuid=<uuid> luks.name=<uuid>=luks root=/dev/mapper/luks
```

### Set default bootloader entry
`vim /boot/loader/loader.conf`
```
default		arch
```


### (Optional) - Setup Gnome
`pacman -S gnome`

`systemctl enable gdm`

### Exit, unmount and reboot
`exit`

`umount -R /mnt`

`reboot`