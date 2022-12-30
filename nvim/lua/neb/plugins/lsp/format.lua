local M = {}

M.format = function(bufnr)
	if bufnr == nil then
		bufnr = 0
	end
	local null_ls_available = false
	local other_client_names = {}
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		if client.server_capabilities.documentFormattingProvider then
			if client.name == "null-ls" then
				null_ls_available = true
			else
				table.insert(other_client_names, client.name)
			end
		end
	end
	local other_clients_found = false
	local other_clients_list = ""
	if next(other_client_names) ~= nil then
		other_clients_list = table.concat(other_client_names, ", ")
		other_clients_found = true
	end

	local filter = nil
	if null_ls_available then
		filter = function(client)
			return client.name == "null-ls"
		end
		if other_clients_found then
			print("formatting using null-ls instead of:", other_clients_list)
		end
	else
		if other_clients_found then
			print("formatting using:", other_clients_list)
		end
	end
	print(vim.lsp.buf.format({
		filter = filter,
		async = true,
		bufnr = bufnr,
	}))
end

return M
