-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-k>", mode = { "i" }, false }

    ---@class PluginLspOpts
    local ret = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        float = {
          border = "rounded",
          header = "",
          source = true,
        },
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = false,
      },
      servers = {
        eslint = {},
      },
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "volar" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
          -- volar = function()
          --   require("lazyvim.util").lsp.on_attach(function(client)
          --     if client.name == "vtsls" then
          --       client.stop(client, false)
          --     end
          --   end)
          -- end,
        end,
      },
    }
    return ret
  end,
}
