-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  rocks = {
    enabled = false,
  },
})

-- Config undo, backup and swap directory
-- luacheck: globals USER SWAPDIR BACKUPDIR UNDODIR
USER = os.getenv("USER")
SWAPDIR = "/home/" .. USER .. "/nvim/swap//"
BACKUPDIR = "/home/" .. USER .. "/nvim/backup//"
UNDODIR = "/home/" .. USER .. "/nvim/undo//"
if vim.fn.isdirectory(SWAPDIR) == 0 then vim.fn.mkdir(SWAPDIR, "p", "0o700") end

if vim.fn.isdirectory(BACKUPDIR) == 0 then vim.fn.mkdir(BACKUPDIR, "p", "0o700") end

if vim.fn.isdirectory(UNDODIR) == 0 then vim.fn.mkdir(UNDODIR, "p", "0o700") end

vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
    vim.o.backupext = extension
  end,
})
-- Set initial tab
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- Standart settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Clipboard config

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
-- Load LSP keymaps
require("config.lsp_keymaps")
