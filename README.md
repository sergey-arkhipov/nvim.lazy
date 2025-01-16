# Description

This is nvim config for RoR and usual tasks.
Based on lazy.nvim plugin and include necessary plugins.

## Setup

### Dependencies

| Name                 | Link                                                                                                        |
| -------------------- | ----------------------------------------------------------------------------------------------------------- |
| Neovim >= 0.10.0     | [neovim/neovim: Vim-fork focused on extensibility and usability](https://github.com/neovim/neovim)          |
| Git >= 2.19.0        | [git/git: Git Source Code Mirror](https://github.com/git/git)                                               |
| Nerd Font (optional) | [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/) |
| Luarocks             | [LuaRocks - The Lua package manager](https://luarocks.org/)                                                 |

### Installation

Copy git to config directory, rename and start nvim

```bash
# Remove aol installation of neovim
rm -rf  $HOME/.config/nvim  $HOME/.local/share/nvim $HOME/.local/state/nvim
git clone https://github.com/sergey-arkhipov/nvim.lazy.git $HOME/.config/nvim
nvim

```

## Plugins

### Lazy
