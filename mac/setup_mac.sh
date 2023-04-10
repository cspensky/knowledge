#!/bin/sh
#
# REF: https://cbrgm.net/post/2021-05-5-setup-macos/#yabai--skhd-i3-replacement


##
#	YABAI
##
brew install koekeishiya/formulae/yabai
# start yabai
brew services start yabai


# Set our config
cp .yabairc ~/.yabairc

brew services restart yabai


# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Accelerated playback when adjusting the window size.
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001


##
#	SKHD
##
brew install koekeishiya/formulae/skhd
brew services start skhd

# Update config
cp .skhdrc ~/.skhdrc

##
#	SPACEBAR
##

# install spacebar
brew install cmacrae/formulae/spacebar
# start spacebar
brew services start spacebar
brew install homebrew/cask-fonts/font-fontawesome

# Update config
mkdir -p ~/.config/spacebar
cp spacebarrc ~/.config/spacebar/spacebarrc
