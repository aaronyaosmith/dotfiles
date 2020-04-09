# Uses stow to install/uninstall dotfiles (creating symlinks)
# Source: https://github.com/mrkite/dotfiles

.DEFAULT_GOAL:=install

PACKAGES=$(sort $(dir $(wildcard */)))

.PHONY: install
install:
	stow --override=^.*$ -t ~ $(PACKAGES)

.PHONY: uninstall
uninstall:
	stow -Dt ~ $(PACKAGES)

.PHONY: update
update: pull install

.PHONY: pull
pull:
	git pull
