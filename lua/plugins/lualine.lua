vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nickjvandyke/opencode.nvim",
})
require("lualine").setup({
	options = {
		extensions = {},
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
			"neo-tree",
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			"lsp_progress",
		},
		lualine_x = {
			"encoding",
			"fileformat",
			{
				"lsp_status",
				icon = "", -- f013
				symbols = {
					-- Standard unicode symbols to cycle through for LSP progress:
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					-- Standard unicode symbol for when LSP is done:
					done = "✓",
					-- Delimiter inserted between LSP names:
					separator = " ",
				},
				-- List of LSP names to ignore (e.g., `null-ls`):
				ignore_lsp = {},
				-- Display the LSP name
				show_name = true,
			},
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location", require("opencode").statusline },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
