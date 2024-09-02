local wezterm = require("wezterm")
local config = wezterm.config_builder()

local font = wezterm.font("MonaspiceKr Nerd Font")

config.color_scheme = "tokyonight_night"

config.font = font
config.font_size = 15

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false

config.inactive_pane_hsb = {
	brightness = 0.6,
}

local act = wezterm.action

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	--#region Always on top
	{
		key = "t",
		mods = "LEADER|CTRL",
		action = act.ToggleAlwaysOnTop,
	},
	--#endregion
	--#region Pane Zoom
	{
		key = "z",
		mods = "LEADER|CTRL",
		action = act.TogglePaneZoomState,
	},
	--#endregion
	--#region Split Pane
	{
		key = "h",
		mods = "LEADER|CTRL",
		action = act.SplitPane({
			direction = "Left",
		}),
	},
	{
		key = "j",
		mods = "LEADER|CTRL",
		action = act.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "k",
		mods = "LEADER|CTRL",
		action = act.SplitPane({
			direction = "Up",
		}),
	},
	{
		key = "l",
		mods = "LEADER|CTRL",
		action = act.SplitPane({
			direction = "Right",
		}),
	},
	--#endregion
	--#region Close Pane
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	--#endregion
	--#region Focus Pane
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "n",
		mods = "ALT|SHIFT",
		action = act.PaneSelect({}),
	},
	{
		key = "m",
		mods = "ALT|SHIFT",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	--#endregion
	--#region Resize Pane
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Left", 2 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Down", 2 }),
	},
	{ key = "k", mods = "CTRL|SHIFT|ALT", action = act.AdjustPaneSize({ "Up", 2 }) },
	{
		key = "l",
		mods = "CTRL|SHIFT|ALT",
		action = act.AdjustPaneSize({ "Right", 2 }),
	},
	--#endregion
}

return config
