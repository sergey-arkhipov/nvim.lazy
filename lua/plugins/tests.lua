return {
  { "vim-test/vim-test" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "nvim-neotest/neotest-vim-test",
      --- tests
      "olimorris/neotest-rspec",
      "vim-test/vim-test",
    },
    config = function()
      --@diagnostic disable-next-line missing-fields
      require("neotest").setup({
        -- log_level = "debug",
        adapters = {
          require("neotest-rspec"),
          -- require("neotest-vim-test"),
          -- ({
          --   allow_file_types = { "cucumber", "ruby", "feature" },
          --   -- Specify the working directory
          --   cwd = function()
          --     return vim.fn.expand("%") -- or specify a specific path
          --   end,
          -- }),
        },
      })
    end,
  },
}
