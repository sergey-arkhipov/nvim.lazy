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
  --| MeanderingProgrammer/render-markdown.nvim | Improve viewing Markdown files in Neovim |
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
    event = "VeryLazy",
    opts = {
      latex = { enabled = false },
    },
  },

  --| Additional colorschemes | Add additional colorschemes |
  -- add colorscheme
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "dracula/vim", lazy = true },
  { "projekt0n/github-nvim-theme" },
  { "catppuccin/nvim" },
  { "Mofiqul/vscode.nvim" },
  { "navarasu/onedark.nvim" },
  { "shaunsingh/nord.nvim" },
  { "Mofiqul/dracula.nvim" },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          transparent = true,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Use PandocPaste for precerve formatting
  {
    "petRUShka/pandoc_paste.vim",
    config = function()
      -- Example: disable default mapping
      -- vim.g.pandoc_paste_no_mapping = 1
    end,
  },
  --| kevinhwang91/nvim-ufo | Neovim's fold look modern and keep high performance |
  {

    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function() require("ufo").detach() end,
      })

      vim.opt.foldlevelstart = 99
      require("ufo").setup(opts)
    end,
  },
}
