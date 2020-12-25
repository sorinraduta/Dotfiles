<p align="center">
  <img height="100" width="100" src="configuration.svg" />
  <h3 align="center">Dotfiles</h3>
</p>

## Installation
- clone this repository
- `cd` in this folder
- update [variables](#Variables) from `variables.yaml`, don't modify dynvariables
  - for `main_monitor` and `secondary_monitor` you can use `arandr`
- on root level, create a `secret` file with a password to be used for encryption
- `$ dotdrop -f --profile=disconnect`
- `$ sudo dotdrop --cfg=./root-config.yaml.j2 -f --profile=disconnect`

## Variables
|Name|Description|Used by|Example|Comments|
|:---:|:---:|:---:|:---:|:---:|
|main_monitor|Main monitor name|dunst, i3, polybar|`DVI-0`||
|secondary_monitor|Secondary monitor name|i3|`HDMI-0`||
|name|Your first and last name|git|`Sorin Raduta`||
|email|Your email|git|`contact@sorinraduta.ro`||
|user_bin|The path where custom scripts are installed|i3, polybar, zsh|`~/.local/bin`||
|module_divider|Some text to be placed between config modules|polybar, picom,i3, dunst, kitty|`## ---------- ##`|This is injected in configs so it must start with a `#`|
|display_layout|Used to place the monitors in a specific layout|ligthdm in the future|~~`0` - Laptop~~<br />`1` - PC (2 monitors)||
|cryptdevice|The device that needs to be decrypted at boot|bootloader (systemd-boot/grub)|`/dev/sda2`<br />`UUID=bf36ecbc-0c22-43bd-8278-51b1f41b5a4d`||
|root_device|The device that contains the root of the operating system|bootloader (systemd-boot/grub)|`/dev/Arch/root`||
|boot_loader_entry|This name will appear in the boot loader menu|systemd|`Disconnect`||
|backgrounds_dir|Location of backgrounds directory|polybar|`~/.local/share/backgrounds`||
|backgrounds_repo|Backgrounds repository URL|polybar|`git@github.com:sorinraduta/Backgrounds.git`||

## Content
### Features
- System bootstrap cheatsheet
- Encrypted SSH key
### Packages
- Boot manager: [Systemd-boot](https://www.freedesktop.org/software/systemd/man/systemd-boot.html)
- Window manager: [i3](https://i3wm.org/docs/)
- Display manager: [LightDM](https://github.com/canonical/lightdm)
- Session locker: [Light lock](https://github.com/the-cavalry/light-locker)
- Bar: [Polybar](https://polybar.github.io/)
- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Notifications: [Dunst](https://github.com/dunst-project/dunst/)
- Volume notifications: [Volnoti](https://github.com/davidbrazdil/volnoti)
- Shell: [zsh](https://github.com/ohmyzsh/ohmyzsh)
- Text Editor [VS Code](https://code.visualstudio.com/)
- Application launcher: [Rofi](https://github.com/davatorium/rofi)
- Compositor: [Picom](https://github.com/yshui/picom)
- Fonts: [Hack](https://github.com/source-foundry/Hack) | [Font Awesome](https://fontawesome.com/cheatsheet)
- Colorscheme: [Dracula](https://draculatheme.com/)
- Color temperature adjuster: [Redshift](https://github.com/jonls/redshift)
