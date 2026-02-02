return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true -- add a border to hover docs and signature help
    table.insert(
      opts.routes,
      { filter = { event = "notify", find = "No information available" }, opts = { skip = true } }
    )
  end,
}
