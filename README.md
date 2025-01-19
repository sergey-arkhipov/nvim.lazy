# Description

This is nvim config for RoR and usual tasks.
Based on lazy.nvim plugin manager and include necessary plugins.

## Setup

### Dependencies

| Name                 | Link                                                                                                        |
| -------------------- | ----------------------------------------------------------------------------------------------------------- |
| Neovim >= 0.10.0     | [neovim/neovim: Vim-fork focused on extensibility and usability](https://github.com/neovim/neovim)          |
| Git >= 2.19.0        | [git/git: Git Source Code Mirror](https://github.com/git/git)                                               |
| Nerd Font (optional) | [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/) |
| Luarocks             | [LuaRocks - The Lua package manager](https://luarocks.org/)                                                 |

### Installation

Copy git to config directory and start nvim

```bash
# Remove previous installation of neovim
rm -rf  $HOME/.config/nvim  $HOME/.local/share/nvim $HOME/.local/state/nvim
git clone https://github.com/sergey-arkhipov/nvim.lazy.git $HOME/.config/nvim
nvim

```

## Settings

- keymaps.lua
- lazy.lua
- options.lua

## Plugins

- clipboard.lua
- cmp.lua
- colorschemes.lua
- conform.lua
- gitlab.lua
- linters.lua
- lsp.lua
- lualine.lua
- luasnip.lua
- neo-tree.lua
- noice.lua
- replace.lua
- snacks.lua
- telescope.lua
- tests.lua
- treesitter.lua
- utils.lua
- which-key.lua

### Lazy

### Utils (plugins.utils)

Plugins for comfortable work

| Name                                      | Description                                                             |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| akinsho/bufferline.nvim                   | A snazzy 💅 buffer line (with tabpage integration)                      |
| axieax/urlview.nvim                       | Navigating to the URL in your preferred browser                         |
| echasnovski/mini.align                    | Align text interactively                                                |
| echasnovski/mini.pairs                    | Minimal and fast autopairs                                              |
| elentok/open-link.nvim                    | Open URL from "plugin" name                                             |
| folke/flash.nvim                          | Navigate your code with search labels, enhanced motions, and Treesitter |
| folke/persistence.nvim                    | Plugin for automated session management                                 |
| gbprod/yanky.nvim                         | Improve yank and put functionalities for Neovim                         |
| iamcco/markdown-preview.nvim              | Markdown preview plugin for Neovim                                      |
| kylechui/nvim-surround                    | Surround ala tpope                                                      |
| MeanderingProgrammer/render-markdown.nvim | Improve viewing Markdown files in Neovim                                |
| nvim-tree/nvim-web-devicons               | Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins           |
