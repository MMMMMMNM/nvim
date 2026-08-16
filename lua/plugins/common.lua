vim.pack.add({
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvzone/showkeys",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/rubiin/highlighturl.nvim",
	"https://github.com/yaocccc/visual-multi.nvim",
	"https://github.com/celeste3z/celeste_comment.nvim",
	{ src = "https://github.com/RaafatTurki/hex.nvim" },
})
require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>d", group = "<DAP>", icon = " " },
		{ "<leader>c", group = "<AI>", icon = " " },
		{ "<leader>f", group = "<Find>", icon = " " },
		{ "<leader>t", group = "<Trouble>", icon = "󱇏 " },
		{ "<leader>o", group = "<Other>", icon = " " },
		{ "<leader>r", group = "<Code>", icon = " " },
		{ "<leader>t", group = "<Terminal>", icon = " " },
	},
})
require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
	-- skip autopair when next character is one of these
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	-- skip autopair when the cursor is inside these treesitter nodes
	skip_ts = { "string" },
	-- skip autopair when next character is closing pair
	-- and there are more closing pairs than opening pairs
	skip_unbalanced = true,
	-- better deal with markdown code blocks
	markdown = true,
})
require("showkeys").setup({ timeout = 1, maxkeys = 5 })
require("flash").setup()
require("highlighturl").setup({
	-- Filetypes to skip highlighting
	ignore_filetypes = { "qf", "help", "NvimTree", "gitcommit" },

	-- URL highlight color (supports hex colors)
	highlight_color = "#8caaee",

	-- Debounce delay (ms) for TextChanged events (improves performance)
	debounce_ms = 100,

	-- Whether to underline URLs
	underline = true,

	-- Suppress toggle notifications
	silent = false,
})
require("visual-multi").setup({
	wrap = true,
	case_sensitive = true,
	mappings = {
		find_next = "<C-n>",
		select_all = "<C-d>",
		select_left = "<C-Left>",
		select_right = "<C-Right>",
		add_cursor_up = "<C-Up>",
		add_cursor_down = "<C-Down>",
		add_cursor = "<C-x>",
		add_cursor_word = "<C-w>",
		skip_region = false,
		remove_region = "q",
		insert_paste = "<C-v>",
		undo = "u",
		redo = "<C-r>",
	},
	highlights = {
		cursor = { bg = "#87afff", fg = "#4e4e4e" },
		cursor_active = { bg = "#dfdf87", fg = "#4e4e4e" },
		insert = { bg = "#4c4e50" },
		insert_active = { bg = "#4c4e50" },
		selection = { bg = "#005faf" },
		selection_active = { bg = "#87afff", fg = "#4e4e4e" },
	},
})
require("hex").setup({

	-- cli command used to dump hex data
	dump_cmd = "xxd -g 1 -u",

	-- cli command used to assemble from hex data
	assemble_cmd = "xxd -r",

	-- function that runs on BufReadPre to determine if it's binary or not
	is_file_binary_pre_read = function()
		-- logic that determines if a buffer contains binary data or not
		-- must return a bool
	end,

	-- function that runs on BufReadPost to determine if it's binary or not
	is_file_binary_post_read = function()
		-- logic that determines if a buffer contains binary data or not
		-- must return a bool
	end,
})
