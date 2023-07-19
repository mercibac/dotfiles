require("code_runner").setup {
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python -u",
    typescript = "deno run",
    javascript = "node $dir/$fileName",
    dart = "dart $fileName",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    -- cpp="gcc $fileName -lstdc++ -o $fileNameWithoutExt && $fileNameWithoutExt"
    cpp = "g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    scss = "sass $dir/$fileName $dir/$fileNameWithoutExt.css",
  },
  -- mode = "term",
  mode = "float",
  focus = true,
  startinsert = true,
  term = {
    --position = "vert",
    position = "bot",
    size = 50,
  },
  float = {
    -- Key that close the code_runner floating window
    close_key = "<ESC>",
    -- Window border (see ':h nvim_open_win')
    border = "rounded",

    -- Num from `0 - 1` for measurements
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,

    -- Highlight group for floating window/border (see ':h winhl')
    border_hl = "FloatBorder",
    float_hl = "Normal",

    -- Transparency (see ':h winblend')
    blend = 0,
  },
}
