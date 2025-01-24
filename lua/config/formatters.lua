-- Helper function to run shell commands
local function run_command(command, success_message, error_message)
  local result = os.execute(command)
  if result == 0 then
    vim.schedule(function()
      vim.cmd("edit") -- Reload the buffer to reflect changes
      if success_message then print(success_message) end
    end)
  else
    vim.schedule(function() print(error_message) end)
  end
end

-- Function to run erb_lint
local function erb_lint()
  local filename = vim.fn.expand("%:p")
  local command = "erb_lint -a " .. filename .. " > /dev/null 2>&1"
  run_command(command, nil, "Error: Failed to format ERB file with erb_lint.")
end

-- Function to run htmlbeautify
local function htmlbeautify_erb()
  local filename = vim.fn.expand("%:p")
  local command = "bundle exec htmlbeautifier -b 1 " .. filename
  run_command(command, nil, "Error: Failed to beautify ERB file with htmlbeautifier.")
end

-- Main function to format ERB files
local function format_erb()
  vim.schedule(function()
    erb_lint()
    htmlbeautify_erb()
  end)
end

-- Return the format_erb function for external use
return {
  format_erb = format_erb,
}
