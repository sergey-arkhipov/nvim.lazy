-- use `vim.keymap.set` instead
local map = vim.keymap.set
-- buffers
map("n", "<leader>b", "", { desc = "Buffers" })
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
map("n", "<leader>q", "", { desc = "Quits" })
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
map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, { desc = "Terminal (cwd)" })
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

-- Tests
map("n", "<leader>t", "", { desc = "Tests" })
map("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run File" })
map("n", "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, { desc = "Run All Files" })
map("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run Nearest" })
map("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last" })
map("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary" })
map(
  "n",
  "<leader>to",
  function() require("neotest").output.open({ enter = true, auto_close = true }) end,
  { desc = "Show Output" }
)
map("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Toggle Output" })
map("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop" })
map("n", "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, { desc = "Toggle Watch" })

-- Markdown preview toggle
map("n", "<leader>cp", "<cmd>RenderMarkdown toggle <cr>", { desc = "Toggle markdown preview" })

-- Add name for keys groups
map("n", "<leader>s", "", { desc = "Search" })
map("n", "<leader>f", "", { desc = "Files" })
map("n", "<leader>u", "", { desc = "UI" })
map("n", "<leader>g", "", { desc = "Git" })
map("n", "gl", "", { desc = "GitLab" })
