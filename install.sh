#!/bin/bash
# WARNING: This code hasn't been tested (yet), will remove this warning after it fully tested

# Detect the operating system and assign to OS_TYPE
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macOS"
elif [[ -f /etc/debian_version ]]; then
    OS_TYPE="Debian"
elif [[ -f /etc/arch-release ]]; then
    OS_TYPE="Arch"
else
    echo "Unsupported operating system."
    exit 1
fi

PACKAGE_LIST="zsh docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose bison ripgrep fzf tmux stow"


# Function to install tools on macOS
install_curl_macos() {
    # Add macOS installation commands here
    brew install curl
}

# Function to install tools on Debian-based Linux
install_curl_debian() {
    sudo apt install -y curl
}

# Function to install tools on Arch Linux
install_curl_arch() {
    sudo pacman -S --noconfirm curl
}

# Function to install tools on macOS
install_macos() {
    echo "Detected macOS. Installing tools..."
    # Add macOS installation commands here
    brew install $PACKAGE_LIST
}

# Function to install tools on Debian-based Linux
install_debian() {
    echo "Detected Debian-based Linux. Installing tools..."
    #NOTE: Docker pre-requisites
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    # Add Docker's official GPG key:
    sudo apt update
    sudo apt install ca-certificates
    sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
    sudo rm -rf /usr/bin/nvim
    sudo tar -C /usr/bin -xzf nvim-linux64.tar.gz
    sudo apt update
    sudo apt install -y $PACKAGE_LIST
}

# Function to install tools on Arch Linux
install_arch() {
    echo "Detected Arch Linux. Installing tools..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm $PACKAGE_LIST
    curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
    sudo rm -rf /usr/bin/nvim
    sudo tar -C /usr/bin -xzf nvim-linux64.tar.gz
}


# NOTE:
# Install some important language
# fnm with Node v22 as base
# gvm with go1.21 as base
# rust
if which curl >/dev/null 2>&1; then
    echo "curl is installed."
else
    echo "curl is not installed."
    echo "Installing curl..."
    # Perform installation based on OS_TYPE
    case $OS_TYPE in
        macOS)
            install_curl_macos
            ;;
        Debian)
            install_curl_debian
            ;;
        Arch)
            install_curl_arch
            ;;
        *)
            echo "Unsupported operating system."
            exit 1
            ;;
    esac
    echo "curl installed"
fi
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fnm install 22
fnm default 22
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.17.13
gvm use go1.17.13
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.21
gvm use go1.21 --default

if [[ "$(uname)" == "Linux" ]]; then
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share/applications
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty desktop file(s)
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
fi

# Perform installation based on OS_TYPE
case $OS_TYPE in
    macOS)
        install_macos
        ;;
    Debian)
        install_debian
        ;;
    Arch)
        install_arch
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac
# Function to ask a yes/no question
ask_question() {
    local prompt="$1"
    local default_answer="$2"

    # Ask the question
    read -p "$prompt [Y/n]: " answer

    # Use default answer if no input is provided
    answer=${answer:-$default_answer}

    # Convert to lowercase for easier comparison
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    case "$answer" in
        y|yes)
            return 0  # True
            ;;
        n|no)
            return 1  # False
            ;;
        *)
            echo "Invalid response. Please answer 'Y' or 'n'."
            ask_question "$prompt" "$default_answer"  # Recurse on invalid input
            ;;
    esac
}

# NOTE: Install alacritty
if ask_question "Install alacritty as alternative terminal? Y/n" "Y"; then
    bash ./install_alacritty.sh
else
    echo "Alacritty will not be installed."
fi

if ask_question "Try to install playerctl? Y/n" "Y"; then
    case $OS_TYPE in
        macOS)
            brew install playerctl
            ;;
        Debian)
            sudo apt install playerctl
            ;;
        Arch)
            sudo pacman -S --noconfirm playerctl
            ;;
        *)
            echo "Unsupported operating system."
            exit 1
            ;;
    esac
else
    echo "playerctl will not be installed."
fi


if ask_question "Install bun? Y/n" "Y"; then
    curl -fsSL https://bun.sh/install | bash
else
    echo "bun will not be installed."
fi

echo "Applying dotfiles config..."
stow .

if ask_question "Change default shell to zsh now and reboot? Y/n" "Y"; then
    chsh -s $(which zsh)
    sudo reboot
else
    echo "Default shell not changed, please change it with chsh -s \$(which zsh)"
fi

