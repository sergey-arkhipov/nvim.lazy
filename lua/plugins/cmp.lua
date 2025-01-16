-- Create a file in your plugins directory, e.g., ~/nvim/lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp", -- The main completion plugin
    event = "InsertEnter", -- Load on entering insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-path", -- Path completions
      "hrsh7th/cmp-cmdline", -- Command line completions
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = {
        -- autocomplete = false, -- Disable automatic popup
      }
      opts.mapping = {
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion manually with Ctrl+Space
        -- Other mappings...
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
      }
      opts.snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      }
      opts.sources = {
        { name = "nvim_lsp" }, -- Lsp
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, --Current buffer
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      }
      --Add emoji
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
}
