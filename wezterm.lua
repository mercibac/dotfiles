-- Pull in the wezterm API
local wezterm = require("wezterm")
local xdg_config_home = os.getenv("xdg_config_home")

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Set the shell name as the tab title
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = pane.title

	-- Try to extract the shell from the process name
	local shell = string.match(pane.foreground_process_name, "([^/\\]+)$") or "shell"

	return {
		{ Text = " " .. shell .. " " },
	}
end)

config.set_environment_variables = {}
config.color_scheme = "Catppuccin Mocha"
config.adjust_window_size_when_changing_font_size = false
config.check_for_updates = false
config.use_ime = true
config.ime_preedit_rendering = "Builtin"
-- config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font', 'JetBrains Mono' }
config.default_prog = { "nu" }
config.launch_menu = {
	{
		label = "nu",
		args = { "C:/Users/Merci_Bacman/scoop/shims/nu.exe" },
	},
	{
		label = "pwsh",
		args = { "C:/Users/Merbac/scoop/shims/pwsh.exe", "-nologo" },
	},
	{
		label = "cmd",
		args = { "cmd.exe", "/k" },
	},
	{
		label = "bash",
		args = { "C:/Program Files/Git/bin/bash.exe" },
	},
	{
		label = "wsl",
		args = { "C:/Windows/System32/bash.exe" },
	},
}
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.scrollback_lines = 10000
config.font_size = 13.5
config.line_height = 1.2
-- config.position(10, 20)
-- wezterm.mux.spawn_window { position = { x = 10, y = 300 } }
config.initial_rows = 36
config.initial_cols = 145
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = 0,
}
config.front_end = "OpenGL"
config.display_pixel_geometry = "RGB"
config.warn_about_missing_glyphs = false

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- performance
config.max_fps = 120
config.animation_fps = 0
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.use_resize_increments = true
config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = '"',
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}
-- and finally, return the configuration to wezterm
return config
