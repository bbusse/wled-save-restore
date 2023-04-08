.PHONY: install

install:

# Create directories
        install -d ${HOME}/.local/wled-config

# Copy script
        install -m 0755 wled-save-restore ${HOME}/.local/bin/
