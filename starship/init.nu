$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_SESSION_KEY = (random chars -l 16)
$env.PROMPT_MULTILINE_INDICATOR = (^'starship.exe' prompt --continuation)

# Does not play well with default character module.
# TODO: Also Use starship vi mode indicators?
$env.PROMPT_INDICATOR = ""

# -- commented section --
$env.PROMPT_COMMAND = { ||
    # jobs are not supported
    starship prompt $"--cmd-duration=($env.CMD_DURATION_MS)"
}
# -- commented section --


# Not well-suited for `starship prompt --right`.
# Built-in right prompt is equivalent to $fill$right_format in the first prompt line.
# Thus does not play well with default `add_newline = True`.
$env.PROMPT_COMMAND_RIGHT = { || ''}
