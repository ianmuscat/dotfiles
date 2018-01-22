###############################################################################
# Core                                                                        #
###############################################################################

# Setup Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# GNU Utils
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt --with-default-names

# Other Utils
brew install wget
brew install git

# Configre git
git config --global user.name "Ian Muscat"
git config --global user.email "$(echo 'aWFubXVzY2F0QGdtYWlsLmNvbQo=' | base64 -D)"
# Add .DS_Store to global gitignore
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Install iTerm2
# -- https://gist.github.com/kevin-smets/8568070
brew cask install iterm2

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Powerlevel9k and iTerm2 theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel9k\/powerlevel9k"/g' ~/.zshrc

# Install Powerline Font
wget https://cdn.rawgit.com/powerline/fonts/d70b1560/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf -O /tmp/powerline.ttf
mv /tmp/powerline.ttf ~/Library/Fonts

# Install Syntax Highlighting
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Install Plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
plugins=(zsh-autosuggestions)
brew install zsh-autosuggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Install iTerm2 Shell Integrations
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# Install Custom iTerm2 Profile
# -- iTerm2 colors located at https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors
cp com.googlecode.iterm2.plist ~/Library/Preferences/

###############################################################################
# Install Applications                                                        #
###############################################################################

brew cask install sublime-text
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install slack
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant
brew cask install sourcetree

brew install python3
brew install node
brew install hugo
brew install nmap
# ---

###############################################################################
# UI/UX                                                                       #
###############################################################################

# Change system time format to 12-hr
#	For the changes to take immediate effect, `killall -KILL SystemUIServer`
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  hh:mm a'

# Menu bar: show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Edit: ALLOW automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1


# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center


# Top left screen corner → no-op
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Put display to sleep
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → no-op
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0


###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

