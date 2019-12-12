#!/bin/bash

# core
# ---

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# GNU utils
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt --with-default-names
# other utils
brew install wget
brew install git
# cli applications
brew install 1password-cli
brew install ansible
brew install cfssl
brew install doctl
brew install gnupg
brew install go
brew install helm
brew install hugo
brew install jq
brew install kns
brew install kubectl
brew install kustomize
brew install minikube
brew install nmap
brew install node
brew install python3
brew install sops
brew install sqlite
brew install terraform
brew install tree
brew install watch
brew install wget
brew install wireguard-tools
# gui applications
brew cask install 1password
brew cask install burp-suite
brew cask install db-browser-for-sqlite
brew cask install docker
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install iterm2
brew cask install keybase
brew cask install minikube
brew cask install skype
brew cask install slack
brew cask install slack
brew cask install spectacle
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install visual-studio-code
brew cask install wireshark

# configre git
git config --global user.name "Ian Muscat"
git config --global user.email "$(echo 'aWFubXVzY2F0QGdtYWlsLmNvbQo=' | base64 -D)"
# Add .DS_Store to global gitignore
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# terminal, iTerm2
# ---

# copy .zshrc
cp resources/.zshrc ~/.zshrc

# install powerlevel10k theme
mkdir -p ~/.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k
cp resources/.p10k.zsh ~/.zsh/themes/powerlevel10k/

# install 'Meslo LG M Regular for Powerline' font
curl -o ~/Library/Fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf \
     https://raw.githubusercontent.com/powerline/fonts/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf

# install zsh syntax highlighting and autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# install iTerm2 shell integrations
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# install custom iTerm2 profile
# - iTerm2 colors located at https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors
cp resources/com.googlecode.iterm2.plist ~/Library/Preferences/


# vscode
# ---

# extensions
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension mauve.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode.Go
code --install-extension redhat.vscode-yaml
code --install-extension shinnn.stylelint

# settings
cp resources/vscode/settings.json /Library/Application\ Support/Code/User/
cp resources/vscode/keybindings.json /Library/Application\ Support/Code/User/


# ui/ux
# ---

# 12h format system time
#	For the changes to take immediate effect, `killall -KILL SystemUIServer`
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  hh:mm a'

# show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk, not to iCloud, by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# automatically quit printer app once print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# display ASCII control characters using caret notation in standard text views
# - try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# allow automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool false

# reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# enable trackpad tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# map trackpad bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# enable full keyboard access for all controls
# - e.g. enable Tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


# finder
# ---

# show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# use list view in all Finder windows by default
# - four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# show the ~/Library folder
chflags nohidden ~/Library

# show the /Volumes folder
sudo chflags nohidden /Volumes

# expand the following file info panes:
# - 'General'
# - 'Open with'
# - 'Sharing & Permissions'
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true


# dock, dashboard, hot corners
# ---

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Hot corners
#   possible values:
#   - 0: no-op
#   - 2: mission control
#   - 3: show application windows
#   - 4: desktop
#   - 5: start screen saver
#   - 6: disable screen saver
#   - 7: dashboard
#   - 10: put display to sleep
#   - 11: launchpad
#   - 12: notification center

# top left screen corner > no-op
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# top right screen corner > put display to sleep
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0
# bottom left screen corner > desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# bottom right screen corner > no-op
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0


# activity monitor
# ---

# show the main window when launching activity monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# visualize CPU usage in the activity monitor dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# show all processes in activity monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0


# working directories
# ---

mkdir ~/dev
mkdir ~/expr
