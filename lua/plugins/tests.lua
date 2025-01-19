return {
  {
    "vim-test/vim-test",
    event = "VeryLazy",
    config = function()
      -- Your Vim-Test configuration goes here
      vim.g["test#strategy"] = "neovim" -- Set Neotest as the strategy

      -- Remap keys for run vim-test
      vim.api.nvim_buf_set_keymap(0, "n", "<leader>tt", "<cmd>TestFile<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "<leader>tr", "<cmd>TestNearest<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      --- tests
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup({
        -- @diagnostic disable-next-line missing-fields
        -- log_level = "debug",
        adapters = {
          require("neotest-rspec"),
        },
      })
    end,
  },
}
