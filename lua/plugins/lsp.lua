local has_ruby = os.execute("ruby -v > /dev/null 2>&1") == 0
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
          "lua_ls",
          has_ruby and "ruby_lsp" or nil, -- Conditionally include ruby_lsp
          "bashls",
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
      if has_ruby then require("lspconfig").ruby_lsp.setup({}) end
      require("lspconfig").bashls.setup({})
    end,
  },
}
