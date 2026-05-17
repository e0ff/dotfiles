require("config.general")
require("config.keybindings")

if not vim.fn.glob(vim.fn.stdpath("config") .. "/local.lua") ~= "" then
    require("config.local")
end
