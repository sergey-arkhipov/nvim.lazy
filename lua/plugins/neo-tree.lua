-- Example for neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  -- events = "BufEnter",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {},
}
