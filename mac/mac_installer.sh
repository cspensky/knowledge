#!/bin/sh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/cspensky/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Chrome
brew install --cask google-chrome
brew install defaultbrowser
osascript setDefaultBrowser.scpt chrome

# Pycharm
brew install --cask pycharm
brew install --cask clion

# Gitkraken
brew install --cask gitkraken

# Slack
brew install --cask slack

# Notion
brew install --cask notion
brew install --cask notion-calendar


# App development
brew install --cask android-studio
sudo xcodebuild -license accept
brew install --cask flutter
brew install cocoapods


# VS Code
curl -L -O "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
unzip download
mv Visual\ Studio\ Code.app /Applications 
open vscode:extension/Dart-Code.flutter


# Meeting stuff
brew install --cask zoom
brew install --cask microsoft-teams

# Cloud
brew install --cask google-drive

# Pleasure things
brew install --cask spotify

# tiled windows
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
mkdir ~/.config/yabai
mkdir ~/.config/skhd
cp yabairc ~/.config/yabai
cp skhdrc ~/.config/skhd

yabai --start-service
skhd --start-service

# Fish (Ref: https://gist.github.com/idleberg/9c7aaa3abedc58694df5)
brew install fish  
sudo bash -c 'echo $(which fish) >> /etc/shells'
# add brew to fish: eval "$(/opt/homebrew/bin/brew shellenv)"
fish -c "/opt/homebrew/bin/brew shellenv >> ~/.config/fish/config.fish"
chsh -s $(which fish)
curl -L https://get.oh-my.fish | fish


echo "NOTE: Running this more than once may add double entries to your config files"
