-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- KEYBINDINGS
config.keys = {
    { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
    { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'l', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
    { key = 'o', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
    { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
    { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'b', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
    { key = 'Enter', mods = 'SHIFT|CTRL', action = act.ToggleFullScreen },

    { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentPane { confirm = true } },
    { key = 'd', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
    { key = 'r', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
    { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

    { key = 'q', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab { confirm = true } },
    { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateLastTab },
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'Tab', mods = 'SHIFT|CTRL|ALT', action = act.ActivateTab(-1) },
    { key = '{', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(-1) },
    { key = '}', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(1) },
    { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },

    {
        key = 'u',
        mods = 'SHIFT|CTRL',
        action = act.CharSelect {
            copy_on_select = true,
            copy_to = 'ClipboardAndPrimarySelection',
        },
    },

    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },

    { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.ScrollByPage(-1) },
    { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.ScrollByPage(1) },
    { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ScrollByLine(1) },
    { key = 'Home', mods = 'SHIFT|CTRL', action = act.ScrollToTop },
    { key = 'End', mods = 'SHIFT|CTRL', action = act.ScrollToBottom },
    { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ScrollToPrompt(-1) },
    { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ScrollToPrompt(1) },

    { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' },
    { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' },
    { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
}

for i = 1, 8 do
    table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(i - 1),
})
end

-- CONFIGURATION
config.disable_default_key_bindings = true
config.default_prog = { 'fish', '-i' }
config.enable_wayland = true
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

-- Add current time to status bar in the full screen mode
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
