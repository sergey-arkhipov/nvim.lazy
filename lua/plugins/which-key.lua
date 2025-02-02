return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },

    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>e", "<cmd>Neotree toggle<cr>" }, -- hide this keymap
    { "<C-s>", "<cmd>w<cr>" },
    -- { "<leader><leader>", "<cmd>Telescope git_files<cr>" },
    -- { "<gd>", "<cmd>vim.lsp.buf.definition()<cr>", desc = "Go definition" },
    -- windows
    -- { "<leader>w", "<c-w>", desc = "Windows" },
    -- { "<leader>w-", "<C-W>s", desc = "Split Window Below" },
    -- { "<leader>w|", "<C-W>v", desc = "Split Window Right" },
    -- { "<leader>wd", "<C-W>c", desc = "Delete Window" },
  },
}
