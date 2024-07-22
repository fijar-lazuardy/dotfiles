#NOTE: Additional terminal cause kitty is a bit pain in the ass sometimes

current_cwd=$(pwd)
cd ~/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
echo "Building alacritty..."
cargo build --release
echo "alacritty built successfully, adding alacritty to desktop entry for linux"
if [[ "$(uname)" == "Linux" ]]; then
    echo "alacritty built successfully, adding alacritty to desktop entry"
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
    mkdir -p ${ZDOTDIR:-~}/.zsh_functions
    echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
    cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
    cd $current_cwd
fi
