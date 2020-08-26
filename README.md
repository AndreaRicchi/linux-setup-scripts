# linux-setup-scripts

Set of scripts used to initialize my Linux machine

## Usage
### Oh My Zsh
Unfortunately the Oh My Zsh installation must be done in two steps because when installing it the shell gets changed stopping the currently executed script.
Run from the repo root folder:
```shell
./scripts/omz-install.sh
./scripts/omz-customize.sh
```

### Qt
To download the Linux installer and start the Qt Installation Tool run:
```shell
./scripts/tilix-dracula-install.sh
```

Optionally install the [QtCreator Dracula Theme](https://draculatheme.com/qtcreator):
```shell
./scripts/tilix-dracula-install.sh
```

### Brave Browser
My browser of choice is Brave, for security and speed; install it running:
```shell
./scripts/tilix-dracula-install.sh
```

### Tilix
My terminal emulator of choice is Tilix, for the advance tiling feature. Combined with Tilix I use the [Tilix Dracula Theme](https://draculatheme.com/tilix); install it running: 
```shell
./scripts/tilix-dracula-install.sh
```

### Qemu/KVM
To run some virtual environment Qemu combined with KVM is a good alternative to VirtualBox. To install it run:
```shell
./scripts/qemu-kvm-install.sh
```

### Docker
Docker is a mandatory tool for software developers. I mainly use it to build custom OS without touching my host machine. Install Docker by running:
```shell
./scripts/docker-install.sh
```

## Note
The only reference to me are a couple of functions in the `./template/zshrc-template` file:
```
function git-personal-config {
        git config user.name "Andrea Ricchi"
        git config user.email "aricchi95@gmail.com"
}

function git-work-config {
        git config user.name "Andrea Ricchi"
        git config user.email "andrea.ricchi@amarulasolutions.com"
}
```
**Remember to remove them or update them accordingly.**
