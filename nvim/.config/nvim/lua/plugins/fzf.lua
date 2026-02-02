return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    config.defaults.keymap.fzf["ctrl-e"] = "abort"
    opts.winopts.backdrop = 100
  end,
}
