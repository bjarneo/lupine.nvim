local colors = require("lupine.colorscheme")
local config = require("lupine.config")

local opts = config.options or config.defaults
local gui = opts.lualine_bold and "bold" or nil

return {
  normal = {
    a = { bg = colors.yellow, fg = colors.darker_bg, gui = gui },
    b = { bg = colors.dark_bg, fg = colors.yellow },
    c = { bg = colors.bg, fg = colors.fg },
    x = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.darker_bg, gui = gui },
    b = { bg = colors.dark_bg, fg = colors.green },
  },
  command = {
    a = { bg = colors.orange, fg = colors.darker_bg, gui = gui },
    b = { bg = colors.dark_bg, fg = colors.orange },
  },
  visual = {
    a = { bg = colors.bright_purple, fg = colors.darker_bg, gui = gui },
    b = { bg = colors.dark_bg, fg = colors.bright_purple },
  },
  replace = {
    a = { bg = colors.bright_red, fg = colors.darker_bg, gui = gui },
    b = { bg = colors.dark_bg, fg = colors.bright_red },
  },
  inactive = {
    a = { bg = colors.dark_bg, fg = colors.muted },
    b = { bg = colors.bg, fg = colors.muted },
  },
}
