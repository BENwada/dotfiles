# Dotfiles

## Setup

git clone <git@github.com>:YOURNAME/dotfiles.git ~/.dotfiles

シンボリックリンク作成

ln -s ~/.dotfiles/nvim ~/.config/nvim

ln -s ~/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

ln -s ~/.dotfiles/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua

ln -s ~/.dotfiles/ghostty ~/.config/ghostty

ln -s ~/.dotfiles/zed/settings.json ~/.config/zed/settings.json

ln -s ~/.dotfiles/zed/keymap.json ~/.config/zed/keymap.json

既存削除
rm -rf ~/.config/ghostty
