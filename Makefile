# 🧰 Dotfiles Makefile
# Thin entry points. Scripts do the work.

.PHONY: install dry-run update bundle status cleanup check

install:
	@./scripts/install.sh

dry-run:
	@DRY_RUN=1 ./scripts/install.sh

# Brew, global bun packages, and global Node (latest LTS)
update:
	@./scripts/update.sh

bundle:
	@brew bundle --file Brewfile

status:
	@./scripts/link.sh status

cleanup:
	@./scripts/link.sh cleanup

# Syntax-check every script and shell config. Needs no install.
check:
	@bash -n scripts/*.sh
	@zsh -n config/zsh/zshenv config/zsh/zshrc config/zsh/*.zsh
	@if command -v shellcheck >/dev/null 2>&1; then shellcheck scripts/*.sh; \
	else echo "(shellcheck not installed, skipped)"; fi
	@echo "✅ check passed"
