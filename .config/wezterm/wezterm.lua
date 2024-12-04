-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- KEYBINDINGS
config.keys = {
	-- REMOVE UNUSED DEFAULTS
	{
		key = "c",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "v",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "m",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "=",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "0",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "t",
		mods = "SUPER|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "1",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "2",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "3",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "4",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "5",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "6",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "7",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "8",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "9",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "]",
		mods = "SUPER|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "[",
		mods = "SUPER|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "r",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "h",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "k",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- NEW ASSIGNMENTS
	-- Creating and closing tabs and panes
	{
		key = "Enter",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- Adjust panes size
	{
		key = "<",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = ">",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = ">",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "<",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},

	-- Moving inside panes
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollToPrompt(-1),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollToPrompt(1),
	},
	{
		key = "Home",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollToTop,
	},
	{
		key = "End",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollToBottom,
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByLine(-1),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByLine(1),
	},

	-- Move between tabs
	{
		key = "{",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- Move between panes
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Prev"),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},

	-- Changing font
	{
		key = "Backspace",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ResetFontSize,
	},
}

-- CONFIGURATION
config.default_prog = { '/usr/bin/fish', '-i' }
config.enable_wayland = false
config.window_decorations = "NONE"
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"zellij",
	"tmux",
	"nu",
	"cmd.exe",
	"pwsh.exe",
	"powershell.exe",
}
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 50
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.unzoom_on_switch_pane = true
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
	{ family = "JetBrainsMono Nerd Font", weight = "Light" },
	{ family = "JetBrainsMono Nerd Font", weight = "ExtraLight" },
	{ family = "VictorMono Nerd Font", weight = "Regular" },
	{ family = "CommitMono Nerd Font", weight = "Regular" },
	{ family = "CaskaydiaCove Nerd Font", weight = "Regular" },
	{ family = "Noto Sans Mono", weight = "Regular" },
	{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
})
config.font_size = 16.0
config.freetype_load_flags = "DEFAULT"
config.warn_about_missing_glyphs = false
config.default_cursor_style = "SteadyBlock"
config.force_reverse_video_cursor = true
config.colors = {
	cursor_bg = "silver",
	cursor_fg = "black",
	cursor_border = "silver",
}
config.initial_cols = 140
config.initial_rows = 36
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.unix_domains = {
	{
		name = "unix",
	},
}
config.check_for_updates = false

config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Wez"
config.colors = {
	background = "#181825",
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#11111b",

		-- The active tab is the one that has focus in the window
		active_tab = {
			bg_color = "#313244",
			fg_color = "#bac2de",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = true,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#7f849c",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#1e1e2e",
			fg_color = "#bac2de",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#181825",
			fg_color = "#7f849c",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#1e1e2e",
			fg_color = "#bac2de",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

-- CUSTOM FUNCTIONALITY

wezterm.on("update-status", function(window, pane)
	if not window:get_dimensions().is_full_screen then
		window:set_right_status("")
		return
	end
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S") .. " "
	-- Make it italic and underlined
	window:set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = date },
	}))
end)

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local function _on_format_tab_title(tab, _tabs, _panes, _config, _hover, _max_width)
	local zoomed = ""
	local index = tab.tab_index + 1
	local title = tab_title(tab)
	if tab.active_pane.is_zoomed then
		zoomed = "✦"
	end
	return {
		{ Text = string.format(" %s %d: %s ", zoomed, index, title) },
	}
end

wezterm.on("format-tab-title", _on_format_tab_title)

-- and finally, return the configuration to wezterm
return config
