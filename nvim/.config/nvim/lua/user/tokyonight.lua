local colorscheme = "tokyonight"

local colors = require("tokyonight.colors").setup({})
vim.g.tokyonight_colors = { bg_float = colors.bg }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

