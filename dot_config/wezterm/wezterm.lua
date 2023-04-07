local wezterm = require "wezterm"
local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}
return {
    color_scheme = "Dracula",
    default_prog = gitbash,
    keys = {
        {
            key = "F3",
            action = "ShowLauncher",
        },
        {
            key = "Y",
            mods = "CTRL",
            action = "Copy",
        },       
        {
            key = "C",
            mods = "CTRL",
            action = "DisableDefaultAssignment",
        },
        {
            key = " ",
            mods = "CTRL|SHIFT",
            action = "ActivateCopyMode",
        },
        {
            key = "9",
            mods = "ALT",
            action = "DisableDefaultAssignment",
        },
    },

    ssh_domains = {
        {
            name = "RPI",
            remote_address = "192.168.2.5",
            username = "pi",
        }
    },

    font_dirs = {"C:\\Windows\\Fonts"},

    font_rules = {
        {
            italic = false,
            bold = false,
            font = wezterm.font("MesloLGM Nerd Font"),
        },
        {
            italic = true,
            bold = false,
            font = wezterm.font("MesloLGM Italic Nerd Font"),
        },
        {
            italic = false,
            bold = true,
            font = wezterm.font("MesloLGM Bold Nerd Font"),
        },
        {
            italic = true,
            bold = true,
            font = wezterm.font("MesloLGM Bold Italic Nerd Font"),
        },
    },

    launch_menu = {
       {
            label = "Powershell",
            args = {"powershell"},
        },
        {
            label = "Git Bash",
            args = gitbash,
        },
    },
}
