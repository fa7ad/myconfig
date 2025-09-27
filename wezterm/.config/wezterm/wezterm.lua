local wezterm = require("wezterm")

local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font({
  family = "FiraCode Nerd Font",
  weight = "Medium",
})
config.font_size = 16.0

config.color_scheme = "Argonaut"

config.window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS|TITLE"
config.window_background_opacity = 0.75

config.keys = {
  { key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "k", mods = "CMD", action = action.ClearScrollback("ScrollbackAndViewport") },
  { key = "w", mods = "CMD", action = action.CloseCurrentPane({ confirm = false }) },
  { key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentTab({ confirm = false }) },
  { key = "LeftArrow", mods = "CMD", action = action.SendKey({ key = "Home" }) },
  { key = "RightArrow", mods = "CMD", action = action.SendKey({ key = "End" }) },
  { key = "p", mods = "CMD|SHIFT", action = action.ActivateCommandPalette },
}

return config
