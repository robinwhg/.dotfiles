return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "vue", "prisma", "css", "scss" })
    end
    opts.autotag = {
      enable = true,
    }
  end,
}
