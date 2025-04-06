local getKeys = function()
  local keys = require("lazyvim.plugins.lsp.keymaps").get()
  keys[#keys + 1] = { "<c-k>", false, mode = "i" }

  return keys
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    keys = getKeys(),
    diagnostics = {
      float = {
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
  },
  -- servers = { eslint = {} },
  -- setup = {
  --   eslint = function()
  --     require("lazyvim.util").lsp.on_attach(function(client)
  --       if client.name == "eslint" then
  --         client.server_capabilities.documentFormattingProvider = true
  --       elseif client.name == "vue-language-server" then
  --         client.server_capabilities.documentFormattingProvider = false
  --       elseif client.name == "vtsls" then
  --         client.server_capabilities.documentFormattingProvider = false
  --       end
  --     end)
  --   end,
  -- },
}
-- TODO: Enable prettier if not eslint, disable ts if volar

-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     diagnostics = {
--       float = {
--         style = "minimal",
--         border = "rounded",
--         source = "always",
--         header = "",
--         prefix = "",
--       },
--     },
--     inlay_hints = {
--       enabled = false,
--     },
--     servers = {
--       eslint = {},
--       volar = {},
--     },
--     setup = {
--       eslint = function()
--         require("lazyvim.util").lsp.on_attach(function(client)
--           if client.name == "eslint" then
--             client.server_capabilities.documentFormattingProvider = true
--           elseif client.name == "vtsls" then
--             client.server_capabilities.documentFormattingProvider = false
--           elseif client.name == "volar" then
--             client.server_capabilities.documentFormattingProvider = false
--           end
--         end)
--       end,
--     },
--   },
-- }
