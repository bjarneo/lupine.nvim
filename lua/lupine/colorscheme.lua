---Provides color access for external tools (lualine, etc.)
---@class lupine.ColorScheme
local M = {}

-- Cached palette. `colors.setup` deep-copies the palette table and runs
-- the blend pipeline; callers like lualine read several keys per redraw,
-- so recomputing on every `__index` is wasted work. Cache the result and
-- invalidate on `ColorScheme` via the autocmd registered below.
local cache = nil

---Get the current color palette (cached).
---@return ColorScheme
function M.get()
  if not cache then
    local opts = require("lupine.config").extend()
    cache = require("lupine.colors").setup(opts)
  end
  return cache
end

---Invalidate the cached palette. Called from the ColorScheme autocmd
---and exposed for callers that change `lupine.config` directly.
function M.invalidate()
  cache = nil
end

-- Refresh the cache on any colorscheme application. Keying on lupine
-- specifically would miss derivative schemes (e.g. hackerman) that also
-- run through lupine.load, so listen for any ColorScheme.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LupineColorSchemeCacheInvalidate", { clear = true }),
  callback = function()
    cache = nil
  end,
  desc = "Invalidate lupine.colorscheme palette cache",
})

-- Allow direct color access via metatable. Reads from the cache after
-- the first miss.
return setmetatable(M, {
  __index = function(_, key)
    return M.get()[key]
  end,
})
