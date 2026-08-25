vim.pack.add({
	"https://github.com/romgrk/barbar.nvim",
	"https://github.com/lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	"https://github.com/nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	"https://github.com/Bekaboo/dropbar.nvim",
	{ src = "https://github.com/rcarriga/nvim-notify", name = "notify" },
	"https://github.com/nvim-zh/colorful-winsep.nvim",
	"https://github.com/rachartier/tiny-cmdline.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/rubiin/highlighturl.nvim", -- highlight url
})
--require("dropbar").setup()
----------------------------------------BufferLine----------------------------------------
require("barbar").setup({
	-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
	animation = true,
	auto_hide = true,
	icons = {
		-- Configure the base icons on the bufferline.
		-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = false,
		buffer_number = false,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			-- Sets the icon's highlight group.
			-- If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- Requires `nvim-web-devicons` if `true`
			enabled = true,
		},
		separator = { left = "▎", right = "" },

		-- If true, add an additional separator at the end of the buffer list
		separator_at_end = true,

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "●" },
		pinned = { button = "", filename = true },

		-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
		preset = "default",

		-- Configure the icons on the bufferline based on the visibility of a buffer.
		-- Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},
})
----------------------------------------Notify----------------------------------------
vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 50,
	render = "default",
	stages = "fade_in_slide_out",
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T",
	},
	timeout = 5000,
	top_down = true,
})
----------------------------------------Colorful window separator----------------------------------------
require("colorful-winsep").setup({
	-- choose between "single", "rounded", "bold" and "double".
	border = "bold",
	excluded_ft = { "packer", "TelescopePrompt", "mason" },
	highlight = nil, -- nil|string|function. See the docs's Highlights section
	animate = {
		---@type "shift"|"progressive"|false
		enabled = "progressive", -- false to disable or choose a option below (e.g. "shift") and set option for it if needed
		shift = {
			delay = 16, -- about 60fps
			frames = 15, -- how many frames are required to complete the animation
		},
		progressive = {
			delay = 16,
			vertical_lerp_factor = 0.15, -- between 0 and 1
			horizontal_lerp_factor = 0.15, -- between 0 and 1
		},
	},
	indicator_for_2wins = {
		-- only work when the total of windows is two
		position = "center", -- false to disable or choose between "center", "start", "end" and "both"
		symbols = {
			-- the meaning of left, down ,up, right is the position of separator
			start_left = "󱞬",
			end_left = "󱞪",
			start_down = "󱞾",
			end_down = "󱟀",
			start_up = "󱞢",
			end_up = "󱞤",
			start_right = "󱞨",
			end_right = "󱞦",
		},
	},
})
----------------------------------------Cmdline----------------------------------------
vim.o.cmdheight = 0
require("tiny-cmdline").setup({
	-- Cmdline window width
	width = {
		value = "60%", -- "N%" = fraction of editor columns, integer = absolute columns
		min = 40, -- minimum width in columns
		max = 80, -- maximum width in columns
	},

	-- Window position ("N%" = fraction of available space, integer = absolute columns/rows)
	position = {
		x = "50%", -- horizontal: "0%" = left, "50%" = center, "100%" = right
		y = "50%", -- vertical:   "0%" = top,  "50%" = center, "100%" = bottom
	},

	-- Border style for the floating window
	-- nil inherits vim.o.winborder at setup() time, falling back to "rounded"
	-- Set to "none" to disable the border
	border = nil,

	-- Horizontal offset of the completion menu anchor from the window's left inner edge
	-- Used to align blink.cmp / nvim-cmp menus with the cmdline window
	menu_col_offset = 3,

	-- Cmdline types rendered at the bottom of the screen instead of centered
	-- "/" and "?" (search) are kept native by default
	native_types = { "/", "?" },

	-- Dynamic popup title (rendered on the floating border)
	-- Disabled by default; set enabled = true to opt in
	-- Has no effect when border = "none" or when the cmdline is rendered via native_types
	title = {
		enabled = false,
		pos = "center", -- "left" | "center" | "right"
	},

	-- Optional callback invoked after every reposition
	on_reposition = require("tiny-cmdline").adapters.blink,
})
----------------------------------------Highlight----------------------------------------
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({ indent = { highlight = highlight } })
----------------------------------------Highlight URL----------------------------------------
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
----------------------------------------Treesitter----------------------------------------
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
----------------------------------------LuaLine----------------------------------------
vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nickjvandyke/opencode.nvim",
	"https://github.com/stevearc/overseer.nvim",
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
			"overseer",
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
