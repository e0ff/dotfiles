-- change for use by default
--vim.cmd("colorscheme industry")

local colorscheme = "darkblue"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found ..")
  return
end
