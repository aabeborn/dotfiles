# 🧰 Dotfiles Makefile
# Dumb entry points. Scripts do the work. 😌

.PHONY: install cleanup commit

install:
	@echo "🚀 Installing dotfiles (chill mode)"
	@./bootstrap/install.sh

cleanup:
	@echo "🧹 Cleaning up dotfiles (chill mode)"
	@./bootstrap/cleanup.sh

commit:
	@echo "✨ Gitmoji commit"
	@gitmoji -c
