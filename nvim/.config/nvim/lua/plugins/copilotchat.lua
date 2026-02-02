return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = function()
    local user = vim.env.USER or "User"
    return {
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      model = "gpt-5.1",
      sticky = {
      },
      window = {
        width = 80,
      },
    }
  end,
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.winfixwidth = true
      end,
    })

    chat.setup(opts)
  end,
}
