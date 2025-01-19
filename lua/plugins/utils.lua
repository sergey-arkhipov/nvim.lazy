return {
  --| echasnovski/mini.pairs | Minimal and fast autopairs |
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  --| echasnovski/mini.align | Align text interactively |
  { "echasnovski/mini.align", version = "*", opts = {} },
  --| axieax/urlview.nvim | Navigating to the URL in your preferred browser|
  { "axieax/urlview.nvim", opts = {} },
  --| elentok/open-link.nvim | Open URL from "plugin" name |
  {
    {
      "elentok/open-link.nvim",
      init = function()
        local expanders = require("open-link.expanders")
        require("open-link").setup({
          expanders = {
            expanders.github,
          },
        })
      end,
      cmd = { "OpenLink", "PasteImage" },
      keys = {
        {
          "ge",
          "<cmd>OpenLink<cr>",
          desc = "Open the link under the cursor",
        },
        {
          "<Leader>ip",
          "<cmd>PasteImage<cr>",
          desc = "Paste image from clipboard",
        },
      },
    },
  },

  --| kylechui/nvim-surround | Surround ala tpope |
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup({}) end,
  },

  --| nvim-tree/nvim-web-devicons | Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins |
  { "nvim-tree/nvim-web-devicons", lazy = true },

  --| akinsho/bufferline.nvim | A snazzy 💅 buffer line (with tabpage integration) |
  {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function() require("bufferline").setup({}) end,
  },

  --| folke/persistence.nvim |  Plugin for automated session management |
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },

  --| gbprod/yanky.nvim |  Improve yank and put functionalities for Neovim |
  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = { timer = 150 },
      system_clipboard = {
        sync_with_ring = false,
      },
    },
    keys = {
      {
        "<leader>p",
        function() require("telescope").extensions.yank_history.yank_history({}) end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
        -- stylua: ignore
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
    },
  },

  --| folke/flash.nvim | Navigate your code with search labels, enhanced  motions, and Treesitter |
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  --| iamcco/markdown-preview.nvim | Markdown preview plugin for Neovim |
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function() vim.cmd([[do FileType]]) end,
  },

  --| MeanderingProgrammer/render-markdown.nvim | Improve viewing Markdown files in Neovim |
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
    opts = {},
  },
}
