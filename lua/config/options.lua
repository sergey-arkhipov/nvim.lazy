local global = vim.g
local o = vim.opt

-- Editor options
-- Config undo, backup and swap directory
-- luacheck: globals USER SWAPDIR BACKUPDIR UNDODIR
USER = os.getenv("USER")
SWAPDIR = "/home/" .. USER .. "/nvim/swap//"
BACKUPDIR = "/home/" .. USER .. "/nvim/backup//"
UNDODIR = "/home/" .. USER .. "/nvim/undo//"
if vim.fn.isdirectory(SWAPDIR) == 0 then vim.fn.mkdir(SWAPDIR, "p", "0o700") end

if vim.fn.isdirectory(BACKUPDIR) == 0 then vim.fn.mkdir(BACKUPDIR, "p", "0o700") end

if vim.fn.isdirectory(UNDODIR) == 0 then vim.fn.mkdir(UNDODIR, "p", "0o700") end

o.directory = SWAPDIR
o.backupdir = BACKUPDIR
o.undodir = UNDODIR
o.swapfile = true
o.backup = true
o.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
    vim.o.backupext = extension
  end,
})
-- Set initial tab
o.smarttab = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
-- Standart settings
o.number = true
o.relativenumber = true

-- Clipboard config

global.clipboard = {
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
