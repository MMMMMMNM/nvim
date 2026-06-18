vim.pack.add({
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

require("tree-sitter-manager").setup({
	-- Default Options
	ensure_installed = { "c", "cpp", "json", "toml" }, -- list of parsers to install at the start of a neovim session
	border = "rounded", -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
	auto_install = true, -- if enabled, install missing parsers when editing a new file
	highlight = true, -- treesitter highlighting is enabled by default
	languages = {}, -- override or add new parser sources
	-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
	-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
})
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = false, -- Enable multiwindow support.
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
