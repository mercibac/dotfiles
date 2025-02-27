-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.set_environment_variables = {}

-- if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
--   -- Use OSC 7 as per the above example
--   config.set_environment_variables['prompt'] =
--     '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m '
--   -- use a more ls-like output format for dir
--   config.set_environment_variables['DIRCMD'] = '/d'
--   -- And inject clink into the command prompt
--   config.default_prog =
--     { 'cmd.exe', '/s', '/k', 'C:/Users/Merci_Bacman/scoop/apps/clink/1.6.14/clink_x64.exe', 'inject', '-q' }
-- end
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
config.color_scheme = 'Catppuccin Mocha'
config.adjust_window_size_when_changing_font_size = false
config.check_for_updates = false
config.use_ime = true
config.ime_preedit_rendering = "Builtin"
-- config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'FiraCode Nerd Font'
config.default_prog = { 'nu' }
config.launch_menu = {
  {
    label = 'nu',
    args = { 'C:/Users/Merci_Bacman/scoop/shims/nu.exe'},
  },
  {
    label = 'pwsh',
    args = { 'C:/Program Files/PowerShell/7/pwsh.exe', '-nologo'},
  },
  {
    label = 'cmd',
    args = { 'cmd.exe','/k' },
  },
  {
    label = 'bash',
    args = { 'C:/Program Files/Git/bin/bash.exe' },
  },
  {
    label = 'wsl',
    args = { 'C:/Windows/System32/bash.exe'},
  }
}
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.scrollback_lines = 184467440
config.font_size = 13.5
config.line_height = 1.2
-- config.position(10, 20)
-- wezterm.mux.spawn_window { position = { x = 10, y = 300 } }
config.initial_rows = 36
config.initial_cols = 145
config.window_padding = {
		left = '1cell',
		right = '1cell',
		top = '0.5cell',
		bottom = 0,
}
config.front_end = "OpenGL"
config.display_pixel_geometry="RGB"
config.warn_about_missing_glyphs=false

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

	-- performance
config.max_fps = 120
config.animation_fps = 0
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.use_resize_increments = true
-- and finally, return the configuration to wezterm
return config
