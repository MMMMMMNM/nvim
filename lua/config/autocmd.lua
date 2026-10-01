local autocmd = vim.api.nvim_create_autocmd

------------------------------Conform At BufWritePre
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable()
		end
		-- whatever other lsp config you want
	end,
})
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "<filetype>" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- })
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font"
	vim.g.neovide_opacity = 0.8
	vim.g.neovide_normal_opacity = 0.8
	vim.g.neovide_text_gamma = 0.8
	vim.g.neovide_text_contrast = 0.5
	vim.g.neovide_hide_mouse_when_typing = true
end
