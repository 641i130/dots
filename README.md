# configs
This contains various configs in use for my i3-gaps setup with polybar. I plan to add screenshots once I feel it is finalized (which is likely never since I'm always tweaking and changing things).

## Japanese Typing setup
`fcitx5` seems to be broken, so I'm using fcitx...

`yay -S all-repository-fonts fcitx-im fcitx-configtool fcitx-mozc`

Pull in the .zshrc exports. Add mozc to the fcitx -d tray config tool.


### General Other Steps:
zsh-autosuggestions
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
oh-my-zsh
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
python-conda
`yay -S python-conda --noconfirm`
rust
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
yay
`git clone https://aur.archlinux.org/yay-bin.git`
`cd yay-bin`
`makepkg -si`

### Huge package list of things I need:
`kitty dolphin discord firefox neovim vim iptables redshift curl wget bind p7zip ark 
