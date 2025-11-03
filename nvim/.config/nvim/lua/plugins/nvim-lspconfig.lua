return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    table.insert(opts.servers.vtsls.filetypes, "vue")
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@vue/typescript-plugin",
        location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
        languages = { "vue" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      },
    })
    opts.diagnostics.float = {
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
  end,
}
