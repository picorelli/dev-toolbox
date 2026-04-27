#!/usr/bin/env bash
# Sensible macOS defaults

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar and status bar in Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Disable .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Trackpad: tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Dock: auto-hide and remove delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

killall Finder Dock 2>/dev/null
echo "macOS defaults applied. Some changes require a logout."
