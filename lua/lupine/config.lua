---@class lupine.Config
---@field name? string Colorscheme name
---@field transparent? boolean Disable background color
---@field terminal_colors? boolean Configure terminal colors
---@field styles? lupine.Styles Syntax styling options
---@field dim_inactive? boolean Dim inactive windows
---@field lualine_bold? boolean Bold lualine section headers
---@field on_highlights? fun(highlights: lupine.Highlights, colors: ColorScheme) Callback to modify highlights
---@field plugins? lupine.Plugins Plugin configuration

---@class lupine.Styles
---@field comments? vim.api.keyset.highlight Comment style
---@field keywords? vim.api.keyset.highlight Keyword style
---@field functions? vim.api.keyset.highlight Function style
---@field variables? vim.api.keyset.highlight Variable style
---@field sidebars? "dark"|"transparent"|"normal" Sidebar style
---@field floats? "dark"|"transparent"|"normal" Float style

---@class lupine.Plugins
---@field all? boolean Enable all plugins
---@field auto? boolean Auto-detect plugins

---@alias lupine.Highlight vim.api.keyset.highlight|string
---@alias lupine.Highlights table<string, lupine.Highlight>
---@alias lupine.HighlightsFn fun(colors: ColorScheme, opts: lupine.Config): lupine.Highlights

local M = {}

---@type lupine.Config
M.defaults = {
  name = "lupine",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  dim_inactive = false,
  lualine_bold = false,
  on_highlights = function() end,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
}

---@type lupine.Config
M.options = nil

---Configure lupine
---@param options? lupine.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---Extend current options with overrides. Falls back to defaults when
---`setup` has not been called yet.
---@param opts? lupine.Config
---@return lupine.Config
function M.extend(opts)
  local base = M.options or M.defaults
  if not opts then
    return base
  end
  return vim.tbl_deep_extend("force", {}, base, opts)
end

return M
