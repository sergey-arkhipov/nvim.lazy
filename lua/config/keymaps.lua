-- use `vim.keymap.set` instead
local map = vim.keymap.set
-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
-- load the session for the current directory
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load session" })

-- select a session to load
map("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session" })

-- load the last session
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Load last session" })

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Quit session" })

-- floating terminal
map("n", "<leader>fT", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, { desc = "Terminal (cwd)" })
-- map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-/>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
-- snacks.nvim terminal settings
vim.keymap.set({ "n", "t" }, "<C-/>", function()
  -- Get current file's directory or fallback to current working directory
  local current_dir = vim.fn.expand("%:p:h")
  if current_dir == "" or vim.fn.isdirectory(current_dir) == 0 then current_dir = vim.fn.getcwd() end

  -- Check if we're in terminal mode
  local in_terminal = vim.bo.buftype == "terminal"

  if in_terminal then
    -- Hide the terminal if we're in terminal mode
    vim.cmd("hide")
  else
    -- Show/create terminal if we're in normal mode
    Snacks.terminal.toggle("zsh", {
      cwd = current_dir,
      env = {
        TERM = "xterm-256color",
      },
      win = {
        style = "terminal",
        relative = "editor",
        width = 0.83,
        height = 0.83,
      },
    })
  end
end, { desc = "Toggle Centered Fish Terminal" })
