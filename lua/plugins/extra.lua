vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" }, -- show keys to do
	{ src = "https://github.com/nvzone/showkeys" }, -- show keys
	{ src = "https://github.com/echasnovski/mini.pairs" }, -- match character
	{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim" }, -- make brackets show rainbow
	{ src = "https://github.com/folke/flash.nvim" }, -- fast location character
	{ src = "https://github.com/yaocccc/visual-multi.nvim" }, -- visual multi cursor
	{ src = "https://github.com/RaafatTurki/hex.nvim" }, --show file helix
	{ src = "https://github.com/stevearc/aerial.nvim" }, -- code outline
})
----------------------------------------Flash----------------------------------------
require("flash").setup()
----------------------------------------Key----------------------------------------
require("showkeys").setup({ timeout = 1, maxkeys = 5 })

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
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
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
----------------------------------------FzfLua----------------------------------------
vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})
require("fzf-lua").setup()
----------------------------------------Toggleterm----------------------------------------
vim.pack.add({ { src = "https://github.com/akinsho/toggleterm.nvim" } })
require("toggleterm").setup({})
----------------------------------------Aerial----------------------------------------
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
------------------------------------------Window Resize----------------------------------------
vim.pack.add({
	{ src = "https://github.com/ChausseBenjamin/resizer.nvim" },
})

local res = require("resizer")
res.setup({
	trigger = "<leader>r",
	-- the defaults hardcodes hi using: `{ fg = '#coffee' }`
	-- but you can remain theme-agnosting using the following:
	hi = { link = "@markup.strong" },
	keymaps = {
		["q"] = res.quit, -- (esc always works and can't be unset...)
		-- Coarse adjustments
		["h"] = function()
			res.left(10)
		end,
		["j"] = function()
			res.down(7)
		end,
		["k"] = function()
			res.up(7)
		end,
		["l"] = function()
			res.right(10)
		end,
		-- Fine adjustments
		["H"] = function()
			res.left(1)
		end,
		["J"] = function()
			res.down(1)
		end,
		["K"] = function()
			res.up(1)
		end,
		["L"] = function()
			res.right(1)
		end,
	},
})
