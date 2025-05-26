return {
  {
    "williamboman/mason.nvim",
    commit = "4da89f3",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "marksman",
        "emmet-language-server",
        "vue-language-server",
        "unocss-language-server",
      })
      opts.ui = {
        border = "rounded",
      }
    end,
  },
  { "williamboman/mason-lspconfig.nvim", commit = "1a31f82" },
}
