-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- KEYBINDINGS
config.keys = {
  -- Remove unused defaults
  {
    key = 'c',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'v',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'm',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'n',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '-',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '=',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '0',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 't',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 't',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '1',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '2',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '3',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '4',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '5',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '6',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '7',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '8',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '9',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = ']',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '[',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'r',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'h',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'k',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'f',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- New assignments
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT|META',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = wezterm.action.ScrollToPrompt(-1)
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = wezterm.action.ScrollToPrompt(1)
  },
  {
    key = 'Home',
    mods = 'SHIFT',
    action = wezterm.action.ScrollToTop,
  },
  {
    key = 'End',
    mods = 'SHIFT',
    action = wezterm.action.ScrollToBottom,
  },
  {
    key = 'Backspace',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ResetFontSize
  },
}

-- CONFIGURATION
config.enable_wayland = true
config.audible_bell = "Disabled"
config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'zellij',
  'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 40
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.font = wezterm.font_with_fallback {
  { family = 'VictorMono Nerd Font',    weight = "Regular" },
  { family = 'JetBrainsMono Nerd Font', weight = "ExtraLight" },
  { family = 'JetBrainsMono Nerd Font', weight = "Regular" },
  { family = 'CommitMono Nerd Font',    weight = "Regular" },
  { family = 'CaskaydiaCove Nerd Font', weight = "Regular" },
  { family = 'Noto Sans Mono',          weight = "Regular" },
}
config.font_size = 12.0
config.freetype_load_flags = "NO_HINTING"
config.default_cursor_style = 'SteadyBlock'
config.force_reverse_video_cursor = true
config.colors = {
  cursor_bg = 'silver',
  cursor_fg = 'black',
  cursor_border = 'silver',
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
    name = 'unix',
  },
}

-- CUSTOM FUNCTIONALITY

wezterm.on('update-status', function(window, pane)
  if not window:get_dimensions().is_full_screen then
    window:set_right_status("")
    return
  end
  local date = wezterm.strftime '%Y-%m-%d %H:%M:%S' .. " "
  -- Make it italic and underlined
  window:set_right_status(wezterm.format {
    { Attribute = { Underline = 'Single' } },
    { Attribute = { Italic = true } },
    { Text = date },
  })
end)

-- and finally, return the configuration to wezterm
return config
