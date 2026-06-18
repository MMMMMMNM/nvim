vim.pack.add({
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvzone/showkeys",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/rubiin/highlighturl.nvim",
	"https://github.com/karb94/neoscroll.nvim",
	-- "https://github.com/y3owk1n/undo-glow.nvim",
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
require("neoscroll").setup({
	mappings = { -- Keys to be mapped to their corresponding default scrolling animation
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"<C-e>",
		"zt",
		"zz",
		"zb",
	},
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	duration_multiplier = 1.0, -- Global duration multiplier
	easing = "linear", -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
	ignored_events = { -- Events ignored while scrolling
		"WinScrolled",
		"CursorMoved",
	},
})
