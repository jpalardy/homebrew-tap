
TAP_DIR   := $(shell brew --repository)/Library/Taps/jpalardy-local/homebrew-tap

.PHONY: tap untap check reinstall

tap:
	@mkdir -p "$(dir $(TAP_DIR))"
	@if [ -e "$(TAP_DIR)" ] && [ ! -L "$(TAP_DIR)" ]; then \
		echo "error: $(TAP_DIR) exists and is not a symlink (looks like a real git clone)."; \
		echo "Run 'make untap' first, or remove it manually, before re-tapping."; \
		exit 1; \
	fi
	ln -sfn "$(CURDIR)" "$(TAP_DIR)"
	@echo "==> jpalardy-local/tap -> $(CURDIR)"

untap:
	-brew untap jpalardy-local/tap
	rm -f "$(TAP_DIR)"

check:
	# brew style Formula/memora.rb
	brew audit --new --strict --online jpalardy-local/tap/memora

reinstall: tap
	brew reinstall --build-from-source --verbose jpalardy-local/tap/memora
