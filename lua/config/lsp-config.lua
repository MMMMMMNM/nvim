-------------enable lsp
function lsp(Name)
	vim.lsp.enable(Name)
end
lsp("lua_ls")
lsp("clangd")
lsp("asm-lsp")
lsp("pyright")
lsp("bash-language-server")
-------------lsp config
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀦 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = "󰋼 ",
		},
	},
})
