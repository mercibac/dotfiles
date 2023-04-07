-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
  name = "Teal",
  files = {"%.tl$","%.d.tl$"},
  comment = "--",
  patterns = {
    { pattern = { '"', '"', '\\' },       type = "string"   },
    { pattern = { "'", "'", '\\' },       type = "string"   },
    { pattern = { "%[%[", "%]%]" },       type = "string"   },
    { pattern = { "%-%-%[%[", "%]%]"},    type = "comment"  },
    { pattern = "%-%-.-\n",               type = "comment"  },
    { pattern = "-?0x%x+",                type = "number"   },
    { pattern = "-?%d+[%d%.eE]*",         type = "number"   },
    { pattern = "-?%.?%d+",               type = "number"   },
    { pattern = "<%a+>",                  type = "keyword2" },
    { pattern = "%.%.%.?",                type = "operator" },
    { pattern = "[<>~=]=",                type = "operator" },
    { pattern = "[%+%-=/%*%^%%#<>]",      type = "operator" },
    { pattern = "[%a_][%w_]*%s*%f[(\"{]", type = "function" },
    { pattern = "[%a_][%w_]*",            type = "symbol"   },
    { pattern = "::[%a_][%w_]*::",        type = "function" },
  },
  symbols = {
    ["if"]       = "keyword",
    ["then"]     = "keyword",
    ["else"]     = "keyword",
    ["elseif"]   = "keyword",
    ["end"]      = "keyword",
    ["do"]       = "keyword",
    ["function"] = "keyword",
    ["repeat"]   = "keyword",
    ["until"]    = "keyword",
    ["while"]    = "keyword",
    ["for"]      = "keyword",
    ["break"]    = "keyword",
    ["return"]   = "keyword",
    ["local"]    = "keyword",
    ["global"]   = "keyword",
    ["in"]       = "keyword",
    ["not"]      = "keyword",
    ["and"]      = "keyword",
    ["or"]       = "keyword",
    ["goto"]     = "keyword",
    ["enum"]     = "keyword",
    ["record"]   = "keyword",
    ["any"]      = "keyword2",
    ["boolean"]  = "keyword2",
    ["number"]   = "keyword2",
    ["string"]   = "keyword2",
    ["thread"]   = "keyword2",
    ["true"]     = "literal",
    ["false"]    = "literal",
    ["nil"]      = "literal",
  },
}
