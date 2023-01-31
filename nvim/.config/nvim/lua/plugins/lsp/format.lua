local M = {}

M.autoformat = true

function M.toggle()
	M.autoformat = not M.autoformat
	if M.autoformat then
		print("Enabled format on save")
	else
		print("Disabled format on save")
	end
end

vim.api.nvim_buf_create_user_command(0, "ToggleFormatOnSave", M.toggle, { desc = "Toggle null-ls format on save" })

function M.format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
	})
end

vim.api.nvim_buf_create_user_command(0, "Format", M.format, { desc = "Fomat file using null-ls" })

function M.on_attach(client, buf)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
			buffer = buf,
			callback = function()
				if M.autoformat then
					M.format()
				end
			end,
		})
	end
end

return M
