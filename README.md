# Dotfiles

macOS の個人設定（nvim / wezterm / zed）。GitHub で複数マシンを同期。

## Setup

### 1. クローン

```sh
git clone git@github.com:BENwada/dotfiles.git ~/.dotfiles
```

### 2. 必要フォントを導入（重要）

未導入だと WezTerm/Zed が指定フォントを黙って無視し、日本語やアイコンが崩れる。

```sh
brew install --cask \
  font-fira-code \
  font-fira-code-nerd-font \
  font-symbols-only-nerd-font \
  font-plemol-jp-nf
```

| フォント | 用途 |
|---|---|
| Fira Code | WezTerm メイン（英数・リガチャ） |
| FiraCode Nerd Font / Mono | Zed の UI・エディタ |
| Symbols Nerd Font Mono | WezTerm のアイコン（Nerd グリフ） |
| PlemolJP Console NF | WezTerm 日本語（等幅・Nerd 内蔵） |

### 3. シンボリックリンク作成

```sh
mkdir -p ~/.config/wezterm ~/.config/zed

ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/.dotfiles/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua
ln -s ~/.dotfiles/zed/settings.json ~/.config/zed/settings.json
ln -s ~/.dotfiles/zed/keymap.json ~/.config/zed/keymap.json
```

既存の設定が邪魔をする場合は、リンク前に該当ファイル／ディレクトリを退避・削除する。
