# linux-setup-scripts

Set of scripts used to initialize my Linux machine

## Usage
### Oh My Zsh
Unfortunately the Oh My Zsh installation must be done in two steps because when installing it the shell gets changed stopping the currently executed script.
Run from the repo root folder:
1) `./scripts/omz-install.sh`
2) `./scripts/omz-customize.sh`

### Qt
To download the Linux installer and start the Qt Installation Tool run:
> `./scripts/qt-install.sh`

Optionally install the [QtCreator Dracula Theme](https://draculatheme.com/qtcreator):
> `./scripts/qt-dracula-install.sh`

### Brave Browser
My browser of choice is Brave, for security and speed; install it running:
> `./scripts/brave-install.sh`

### Tilix
My terminal emulator of choice is Tilix, for the advance tiling feature. Combined with Tilix I use the [Tilix Dracula Theme](https://draculatheme.com/tilix); install it running:
> `./scripts/tilix-dracula-install.sh`
