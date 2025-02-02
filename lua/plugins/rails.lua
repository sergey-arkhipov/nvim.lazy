return {
  "sergey-arkhipov/rails-nvim",
  name = "rails-nvim",
  ft = "ruby",
  config = function()
    require("rails-nvim").setup({
      spec_dir = "rspec",
      service_dir = "services",
    })
  end,
  keys = {

    { "gr", "", desc = "Rails fast move" },
    { "grc", "<cmd>GC<cr>", desc = "Controller" },
    { "grh", "<cmd>GH<cr>", desc = "Helper" },
    { "grm", "<cmd>GM<cr>", desc = "Model" },
    { "grr", "<cmd>GR<cr>", desc = "Route" },
    { "grt", "<cmd>GS<cr>", desc = "Spec" },
    { "grv", "<cmd>GV<cr>", desc = "View" },
  },
}
