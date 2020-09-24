#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" || exit; pwd -P)"

install_dracula_theme()
{
	# zsh dracula theme
	mkdir -p ~/Projects/dracula
	git clone https://github.com/dracula/zsh.git ~/Projects/dracula/zsh || (echo "Zsh dracula theme clone failed" && exit 1)
	ln -s ~/Projects/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme || (echo "Symbolic link creation failed" && exit 1)

	# zshrc file
	ZSHRC_TEMPLATE=${SCRIPT_DIR}/../template/zshrc-dracula-template
	cp "${ZSHRC_TEMPLATE}" ~/.zshrc
}

install_starship_prompt()
{
	# zsh starship prompt
	curl -fsSL https://starship.rs/install.sh | bash

	# zshrc file
	ZSHRC_TEMPLATE=${SCRIPT_DIR}/../template/zshrc-staship-template
	cp "${ZSHRC_TEMPLATE}" ~/.zshrc
}

PS3='Please enter your choice: '
options=("Dracula Theme" "Starship Prompt")
select opt in "${options[@]}"
do
	case $opt in
		"Dracula Theme")
			install_dracula_theme
			break
			;;
		"Starship Prompt")
			install_starship_prompt
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
	|| (echo "Syntax highlighting plugin clone failed" && exit 1)