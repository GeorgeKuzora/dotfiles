-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices


-- KEYBINDINGS
-- Remove unused defaults
config.keys = {
  -- Turn off the default SUPER actions
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
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    key = 'q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}
-- APPEARANCE
-- config.enable_wayland = true
config.enable_wayland = false
config.audible_bell = "Disabled"
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "TITLE | RESIZE"
config.color_scheme = 'Catppuccin Mocha'
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 40
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.window_padding = {
  left = 5,
  right = 5,
  top = 0,
  bottom = 0,
}
-- MULTIPLEXING
-- config.unix_domains = {
--   {
--     name = 'unix',
--   },
-- }
-- config.default_gui_startup_args = { 'connect', 'unix' }

-- TAB TEXT
local process_icons = {
  ['docker'] = {
    { Text = wezterm.nerdfonts.linux_docker },
  },
  ['docker-compose'] = {
    { Text = wezterm.nerdfonts.linux_docker },
  },
  ['kuberlr'] = {
    { Text = wezterm.nerdfonts.linux_docker },
  },
  ['kubectl'] = {
    { Text = wezterm.nerdfonts.linux_docker },
  },
  ['nvim'] = {
    { Text = wezterm.nerdfonts.custom_vim },
  },
  ['vim'] = {
    { Text = wezterm.nerdfonts.dev_vim },
  },
  ['node'] = {
    { Text = wezterm.nerdfonts.mdi_hexagon },
  },
  ['zsh'] = {
    { Text = wezterm.nerdfonts.cod_terminal },
  },
  ['bash'] = {
    { Text = wezterm.nerdfonts.cod_terminal_bash },
  },
  ['btm'] = {
    { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
  },
  ['htop'] = {
    { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
  },
  ['cargo'] = {
    { Text = wezterm.nerdfonts.dev_rust },
  },
  ['go'] = {
    { Text = wezterm.nerdfonts.mdi_language_go },
  },
  ['lazydocker'] = {
    { Text = wezterm.nerdfonts.linux_docker },
  },
  ['git'] = {
    { Text = wezterm.nerdfonts.dev_git },
  },
  ['lua'] = {
    { Text = wezterm.nerdfonts.seti_lua },
  },
  ['wget'] = {
    { Text = wezterm.nerdfonts.mdi_arrow_down_box },
  },
  ['curl'] = {
    { Text = wezterm.nerdfonts.mdi_flattr },
  },
  ['gh'] = {
    { Text = wezterm.nerdfonts.dev_github_badge },
  },
}

local function dir_basename(s)
  return string.gsub(s, '(.*[/\\])(.*)/', '%2')
end

local function proc_basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  -- local HOME_DIR = os.getenv('HOME') .. "/"
  -- if (basename(current_dir) == basename(HOME_DIR)) then
  --   return "~"
  -- end
  return dir_basename(current_dir)
end

local function get_process(tab)
  local process_name = tab.active_pane.foreground_process_name
  if (process_name == "") then
    return nil
  end
  process_name = proc_basename(process_name)
  if string.find(process_name, 'kubectl') then
    process_name = 'kubectl'
  end
  return wezterm.format(
    process_icons[process_name]
    or { { Text = string.format('[%s]', process_name) } }
  )
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local has_unseen_output = false
    if not tab.is_active then
      for _, pane in ipairs(tab.panes) do
        if pane.has_unseen_output then
          has_unseen_output = true
          break
        end
      end
    end
    local process = get_process(tab)
    local working_dir = get_current_working_dir(tab)
    local title = ""
    local tabid = tab.tab_index + 1
    if (process == nil) then
      title = string.format(' %s. %s ', tabid, working_dir)
    else
      title = string.format(' %s. %s > %s  ', tabid, process, working_dir)
    end

    if has_unseen_output then
      return {
        { Foreground = { Color = 'Orange' } },
        { Text = title },
      }
    end

    return {
      { Text = title },
    }
  end
)

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