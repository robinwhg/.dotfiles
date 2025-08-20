return {
  "folke/snacks.nvim",
  keys = {
    { "<c-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  },
  opts = {
    terminal = {
      border = "rounded",
    },
    notifier = {
      margin = { right = 0 },
    },
    zen = {
      toggles = {
        diagnostics = false,
        inlay_hints = false,
        indent = false,
        wrap = true,
      },
    },
    styles = {
      float = {
        backdrop = 100,
        border = "rounded",
      },
      zen = {
        width = 100,
        border = "none",
        backdrop = { transparent = false, blend = 0 },
        wo = {
          spell = false,
          cursorline = false,
          number = false,
        },
      },
    },
  },
}
