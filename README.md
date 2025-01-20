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

- cmp.lua
- conform.lua
- gitlab.lua
- linters.lua
- lsp.lua
- lualine.lua
- luasnip.lua
- neo-tree.lua
- noice.lua
- rails.lua
- replace.lua
- snacks.lua
- telescope.lua
- tests.lua
- treesitter.lua
- utils.lua
- which-key.lua

### Lsp servers

| Name     | Install/Depended         | Description                                                       |
| -------- | ------------------------ | ----------------------------------------------------------------- |
| lua_ls   | auto                     | language features for Lua                                         |
| ruby_lsp | language ruby            | LSP is an implementation of the language server protocol for Ruby |
| bashls   | auto                     | Bash language server                                              |
| yamlls   | npm yaml-language-server | Supports JSON Schema 7 and below                                  |

Lsp servers will be installed automatically.
If you need `ruby_lsp` to be installed, first run `nvim` in the directory with the Ruby project.
`yaml-language-server` depended of node package. Can be installed manually.

```bash
npm install -g yaml-language-server
```

### Gitlab.nvim

requirements

`Go >= v1.19`

If requirements are not met, the plugin will not be installed.

### Utils (plugins.utils)

Plugins for comfortable work

| Name                                      | Description                                                             |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| echasnovski/mini.pairs                    | Minimal and fast autopairs                                              |
| echasnovski/mini.align                    | Align text interactively                                                |
| axieax/urlview.nvim                       | Navigating to the URL in your preferred browser                         |
| elentok/open-link.nvim                    | Open URL from "plugin" name                                             |
| kylechui/nvim-surround                    | Surround ala tpope                                                      |
| nvim-tree/nvim-web-devicons               | Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins           |
| akinsho/bufferline.nvim                   | A snazzy 💅 buffer line (with tabpage integration)                      |
| folke/persistence.nvim                    | Plugin for automated session management                                 |
| gbprod/yanky.nvim                         | Improve yank and put functionalities for Neovim                         |
| folke/flash.nvim                          | Navigate your code with search labels, enhanced motions, and Treesitter |
| iamcco/markdown-preview.nvim              | Old plugin required manual installation - remove                        |
| MeanderingProgrammer/render-markdown.nvim | Improve viewing Markdown files in Neovim                                |
| Additional colorschemes                   | Add additional colorschemes                                             |
