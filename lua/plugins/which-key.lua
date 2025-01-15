return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
	preset = "helix"
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
	{ "<leader>q", "<cmd>qal<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
	{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	{ "<leader>e", "<cmd>Neotree toggle<cr>" },-- hide this keymap
	{ "<C-s>", "<cmd>w<cr>"},
	{ "<leader><leader>", "<cmd>Telescope find_files<cr>" },
  },
}


-- Setup for which-key
-- require('which-key').setup {
-- 	-- Customize the layout
-- 	preset = "helix",
-- }
--
-- local wk = require("which-key")
-- wk.add({
-- 	{ "<leader>f", group = "files" }, -- group
-- 	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
-- 	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files", mode = "n" },
-- 	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
-- 	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
-- 	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Builtin", mode = "n" },
-- 	-- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
-- 	{ "<leader>fn", "<cmd>tabnew<cr>", desc = "New File" },
-- 	{ "<leader>f1", hidden = true }, 
-- 	-- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
-- 	{ "<leader>b", group = "buffers", expand = function()
-- 		return require("which-key.extras").expand.buf()
-- 	end
-- },
-- {
-- 	-- Nested mappings are allowed and can be added in any order
-- 	-- Most attributes can be inherited or overridden on any level
-- 	-- There's no limit to the depth of nesting
-- 	mode = { "n", "v" }, -- NORMAL and VISUAL mode
-- 	{ "<leader>q", "<cmd>qal<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
-- 	{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
-- 	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", hidden = true },-- hide this keymap
-- 	{ "<C-s>", "<cmd>w<cr>", hidden = true },
-- 	{ "<leader><leader>", "<cmd>Telescope find_files<cr>",  hidden = true  },
-- }
-- })
