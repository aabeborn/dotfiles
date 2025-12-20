# Minimal Makefile
# The only supported entry point is `make install`

.PHONY: install commit

install:
	@echo "🧰 Installing dotfiles (chill mode)"
	@./bootstrap/install.sh

commit:
	@echo "✨ Gitmoji commit"
	@gitmoji -c
