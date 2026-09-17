let dark_theme = {

    separator: white
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: {bg: red fg: white}
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

let light_theme = {
    separator: dark_gray
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    bool: dark_cyan
    int: dark_gray
    filesize: cyan_bold
    duration: dark_gray
    date: purple
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cell-path: dark_gray
    row_index: green_bold
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: {fg: white bg: red}
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_purple_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

if ($nu.os-info.name == linux) {
  $env.PATH = ($env.PATH | prepend "/home/linuxbrew/.linuxbrew/bin")
}
$env.EDITOR = "nvim"
$env.config = {
    show_banner: false

    ls: {
        use_ls_colors: true
        clickable_links: true
    }

    rm: {
        always_trash: false
    }

    table: {
        mode: rounded
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false

    }

    error_style: "fancy"




    datetime_format: {


    }

    explore: {
        status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
        command_bar_text: {fg: "#C4C9C6"},
        highlight: {fg: "black", bg: "yellow"},
        status: {
            error: {fg: "white", bg: "red"},
            warn: {}
            info: {}
        },
        table: {
            split_line: {fg: "#404040"},
            selected_cell: {bg: light_blue},
            selected_row: {},
            selected_column: {},
        },
    }

    history: {
        max_size: 100_000
        sync_on_enter: true
        file_format: "plaintext"
        isolation: false
    }

    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
        external: {
            enable: true
            max_results: 100
            completer: null
        }
    }

    cursor_shape: {
        emacs: line
        vi_insert: block
        vi_normal: underscore
    }

    color_config: $dark_theme

    footer_mode: 25
    float_precision: 2
    buffer_editor: ""
    use_ansi_coloring: true
    bracketed_paste: true
    edit_mode: emacs
    shell_integration: {

      osc2: true

      osc7: true

      osc8: true
      osc9_9: false
      osc133: false
      osc633: true
      reset_application_mode: true
    }
    render_right_prompt_on_last_line: false
    use_kitty_protocol: false
    highlight_resolved_externals: false

    hooks: {
        pre_prompt: [{ null }]
        pre_execution: [{ null }]
        env_change: {
            PWD: [{|before, after| job spawn { ^zoxide add -- $after } | ignore }]
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }"
        command_not_found: { null }
    }

    menus: [


        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: description
                columns: 4
                col_width: 20
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
    ]

}

# Set aliases
alias mpvl = mpv --loop
alias vim = nvim
alias v = nvim
alias vi = nvim --clean
alias py = py.exe
alias c = clear
alias cls = clear
alias ls = eza --color=auto
alias ll = eza -la --color=auto
alias serve = python -m http.server
alias cat = bat
alias rm = rm -t
alias oc = ouch compress
alias od = ouch decompress
alias db = mysql -u root -p
alias a = overlay use activate.nu
alias mc = magick convert
alias e = exit
alias getip = powershell -Command "(Get-NetIPAddress -InterfaceAlias Wi-Fi -AddressFamily IPv4).IPAddress"

def --env take [path: string] {
    mkdir $path | cd $path
}

def --env lsd [path: string] {
    cd $path | ls
}

def --env lsr [path: string] {
    cd $path | ls
    cd -
}

def --env workon [venv: string] {
    let path = $'(echo $env.WORKON_HOME | path join $venv | path join Scripts)'
    cd $path
}

# Replace starship with native code to increase performance
def prompt-git-branch [] {
    mut dir = $env.PWD
    loop {
        let head = $dir | path join .git HEAD
        if ($head | path exists) { return (open --raw $head | str trim | str replace 'ref: refs/heads/' '') }
        let parent = $dir | path dirname
        if $parent in [$dir ''] { return '' }
        $dir = $parent
    }
}

$env.PROMPT_COMMAND = {||
    let home = '~' | path expand
    let dir = match (do -i { $env.PWD | path relative-to $home }) { null => $env.PWD, '' => '~', $rel => ([~ $rel] | path join) }
    let user = if (is-admin) { $"(ansi red_bold)($env.USERNAME? | default $env.USER?)(ansi reset) in " } else { '' }
    let branch = prompt-git-branch
    let git = if $branch != '' { $" on (ansi purple_bold)($branch)(ansi reset)" } else { '' }
    let ms = $env.CMD_DURATION_MS | into int
    let took = if $ms >= 2000 { $" took (ansi yellow_bold)($ms // 1000)s(ansi reset)" } else { '' }
    let arrow = if $env.LAST_EXIT_CODE == 0 { ansi green_bold } else { ansi red_bold }
    $"($user)(ansi cyan_bold)($dir)(ansi reset)($git)($took)\n($arrow)➜(ansi reset) "
}
$env.PROMPT_INDICATOR = ''
$env.PROMPT_COMMAND_RIGHT = ''
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi dark_gray)∙(ansi reset) "

# External tools
# source ~/.cache/starship/init.nu
source ~/.zoxide.nu
source ~/.config/nushell/completions/scoop-completions.nu
source ~/.config/nushell/completions/uv-completions.nu
source ~/.config/nushell/completions/pnpm-completions.nu
source ~/.config/nushell/completions/docker-completions.nu
source ~/.config/nushell/sfsu_.nu
