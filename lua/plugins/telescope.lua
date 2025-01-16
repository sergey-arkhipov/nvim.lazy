return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>f", group = "files" }, -- group
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files", mode = "n" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Builtin", mode = "n" },
		-- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
		{ "<leader>fn", "<cmd>tabnew<cr>", desc = "New File" },
	},
}
