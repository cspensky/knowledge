#!/bin/sh

# Homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/cspensky/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cspensky/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


# Chrome
echo "Installing Chrome..."
brew install --cask google-chrome
brew install defaultbrowser
osascript setDefaultBrowser.scpt chrome

# Pycharm
echo "Installing developer tools..."
brew install --cask pycharm
brew install --cask clion

# Gitkraken
brew install --cask gitkraken

# Slack
brew install --cask slack
brew install --cask discord

# Notion
brew install --cask notion
brew install --cask notion-calendar

# App development
brew install --cask android-studio
sudo xcodebuild -license accept
brew install --cask flutter
brew install cocoapods

# VS Code
brew install --cask visual-studio-code
open vscode:extension/Dart-Code.flutter

# Meeting stuff
echo "Installing work stuff..."
brew install --cask zoom
brew install --cask microsoft-teams

# Cloud
brew install --cask google-drive

# Pleasure things
brew install --cask spotify

# tiled windows
echo "Setting up tiled window manager and a nice terminal environment..."
brew install --cask nikitabobko/tap/aerospace
mkdir ~/.aerospace
cp .aerospace.toml ~/.aerospace

# focus windows when mouse hovers
brew tap dimentium/autoraise
brew install autoraise
brew services start autoraise

# add cool borers to windows 
brew tap FelixKratz/formulae
brew install borders

# iTerm
brew install --cask iterm2

# Fish (Ref: https://gist.github.com/idleberg/9c7aaa3abedc58694df5)
brew install fish  
sudo bash -c 'echo $(which fish) >> /etc/shells'
# add brew to fish: eval "$(/opt/homebrew/bin/brew shellenv)"
echo >> /Users/cspensky/.config/fish/config.fish
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/cspensky/.config/fish/config.fish
chsh -s $(which fish)
curl -L https://get.oh-my.fish | fish

mkdir -p ~/.cache/vim
cp .vimrc ~


echo "NOTE: Running this more than once may add double entries to your config files"
