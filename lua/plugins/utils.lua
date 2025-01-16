return {
  {
    -- auto-pairs
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },
  -- mini-align
  { "echasnovski/mini.align", version = "*", opts = {} },
  { "axieax/urlview.nvim", opts = {} },
  {
    {
      "elentok/open-link.nvim",
      init = function()
        local expanders = require("open-link.expanders")
        require("open-link").setup({
          expanders = {
            -- expands "{user}/{repo}" to the github repo URL
            expanders.github,

            -- expands "format-on-save#15" the issue/pr #15 in the specified github project
            -- ("format-on-save" is the shortcut/keyword)
            -- expanders.github_issue_or_pr("format-on-save", "elentok/format-on-save.nvim"),

            -- expands "MYJIRA-1234" and "myotherjira-1234" to the specified Jira URL
            -- expanders.jira("https://myjira.atlassian.net/browse/", { "myjira", "myotherjira"})
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
}
