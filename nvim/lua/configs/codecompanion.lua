local adapter = {
  adapter = "ollama",
  -- model = "yi-coder:1.5b",
  -- model = "yi-coder:9b",
  -- model = "deepseek-coder-v2:16b",
  model = "qwen2.5-coder:0.5b",

}

local opts = {
  strategies = {
    chat = adapter,
    inline = adapter,
    agent = adapter,
  },
  opts = {
    log_level = "DEBUG",
  },
}

require("codecompanion").setup(opts)
