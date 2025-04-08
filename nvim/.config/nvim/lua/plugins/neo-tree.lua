return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 32,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        never_show = {
          ".git",
          ".DS_Store",
        },
      },
    },
  },
}
