vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
})
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("Neotree")
end, { desc = "Neo-tree" })
require("neo-tree").setup({
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"document_symbols",
	},
	source_selector = {
		winbar = false, -- toggle to show selector on winbar
		statusline = false, -- toggle to show selector on statusline
		show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
		-- of the top visible node when scrolled down.
		sources = {
			{ source = "filesystem" },
			{ source = "buffers" },
			{ source = "git_status" },
			{ source = "document_symbols" },
		},
	},
	diagnostics = {
		symbols = {
			hint = "󰌶 ",
			info = "󰋼 ",
			warn = "󰀦 ",
			error = "󰅚 ",
		},
		highlights = {
			hint = "DiagnosticSignHint",
			info = "DiagnosticSignInfo",
			warn = "DiagnosticSignWarn",
			error = "DiagnosticSignError",
		},
	},
	hide_hidden = true,
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				vim.cmd([[Neotree close]])
			end,
		},
	},
})
