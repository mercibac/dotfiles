local wezterm = require("wezterm")
local xdg_config_home = os.getenv("xdg_config_home")

local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = pane.title

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
config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "JetBrains Mono" })
config.default_prog = { "nu" }
config.launch_menu = {
	{
		label = "nu",
		args = { "nu" },
	},
	{
		label = "pwsh",
		args = { "pwsh", "-nologo" },
	},
	{
		label = "cmd",
		args = { "cmd.exe", "/k" },
	},
	{
		label = "git bash",
		args = { "C:/Program Files/Git/bin/bash.exe" },
	},
	{
		label = "bash - wsl",
		args = { "bash" },
	},
}
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.scrollback_lines = 10000
config.font_size = 13.5
config.line_height = 1.2
config.initial_rows = 36
config.initial_cols = 145
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = 0,
}
config.front_end = "OpenGL"
config.text_background_opacity = 1.0
config.display_pixel_geometry = "RGB"
config.warn_about_missing_glyphs = true

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.max_fps = 120
config.animation_fps = 10
config.keys = {
	{
		key = '"',
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
config.keys = {
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}
return config
