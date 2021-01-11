# linux-setup-scripts

Set of scripts used to initialize my Linux machine

## Usage
Simply run the main installation script:
```shell
$ ./scripts/setup.sh
```
and select the packages that you want to install.

## Note
The only reference to me are a couple of functions in the `./templates/zshrc-template` file:
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
