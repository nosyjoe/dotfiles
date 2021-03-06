#!/usr/bin/env sh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
SHELL="zsh"
brew install $SHELL
brew tap homebrew/versions

# Switch to using brew-installed bash as default shell

if ! fgrep -q "/usr/local/bin/$SHELL" /etc/shells; then
  echo "/usr/local/bin/$SHELL" | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/$SHELL;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# Install GnuPG to enable PGP-signing commits.
#brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
#brew install screen
#brew install php
#brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
# brew install cifer
brew install dex2jar
# TCP over DNS tunnel
brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# Tool to exploit hash length extension attack
# brew install hashpump
#Network logon cracker which supports many services
# brew install hydra
# brew install john
# brew install knock
# Image manipulation
# brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# Tools for building TCP client-server applications
# brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
# General-purpose data compression with high compression ratio
brew install xz

# Install other useful binaries.
#Search tool like grep, but optimized for programmers
brew install ack
#brew install exiv2
brew install git
#brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
# brew install rhino
# brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# duti
brew install duti
brew install gnupg

# other stuff
brew install pwgen
# brew install android-platform-tools
# brew install android-sdk

# Casks
# brew cask install adium
brew cask install caffeine
brew cask install handbrake
# brew cask install skype
brew cask install transmission
brew cask install vlc

brew cask install textmate
# brew cask install java
# brew cask install appcode
# brew cask install path-finder
brew cask install google-chrome
brew cask install telegram
brew cask install keepassx
# better install dash from appstore (license)
# brew cask install dash
brew cask install spotify
brew cask install dropbox
brew cask install google-drive
brew cask install slack
brew cask install paw
brew cask install nextcloud
brew cask install virtualbox
brew cask install viscosity
brew cask install istat-menus
brew cask install rectangle
brew cask install iterm2
brew cask install firefox
brew cask install dash
brew cask install sketch
brew cask install alfred3
brew cask install visual-studio-code


# Remove outdated versions from the cellar.
brew cleanup
