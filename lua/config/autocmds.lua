-- vim.opt_local.path = "~/.config/nvim/lua"
-- Function to add the current directory to localpath
local function add_current_dir_to_localpath()
  local current_dir = vim.fn.expand("%:p:h") -- Get the current directory
  if current_dir ~= "" then
    -- Append the current directory to localpath
    vim.opt_local.path:append(current_dir)
  end
end
-- Call the function when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = add_current_dir_to_localpath,
})

-- Set user command formattiong erb files
vim.api.nvim_create_user_command("FormatERB", function() require("config.formatters").format_erb() end, {})
