return {
  -- automate install LSP, formatters and linters
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "markdownlint", --markdown formatter
          "shellcheck", --shell linter
        },
      },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({})
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "Snacks" },
            },
          },
        },
      })
      require("lspconfig").ruby_lsp.setup({})
      require("lspconfig").bashls.setup({})
    end,
  },
}
