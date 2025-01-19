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
  checker = { enabled = true, notify = false },
  rocks = {
    enabled = false,
  },
  defaults = {
    -- version = "*",
  },
})

-- Load keymaps
require("config.keymaps")
-- Load nvim settings
require("config.options")

-- vim.opt_local.path = "~/.config/nvim/lua"
-- Function to add the current directory to localpath
local function add_current_dir_to_localpath()
  local current_dir = vim.fn.expand("%:p:h") -- Get the current directory
  if current_dir ~= "" then
    -- Append the current directory to localpath
    vim.opt_local.path:append(current_dir)
  end
end

-- Call the function when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = add_current_dir_to_localpath,
})

-- Set colorscheme
vim.cmd([[colorscheme tokyonight-night]])
