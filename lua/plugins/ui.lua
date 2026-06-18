vim.pack.add({
	"https://github.com/romgrk/barbar.nvim",
	"https://github.com/lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	"https://github.com/nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	"https://github.com/Bekaboo/dropbar.nvim",
	{ src = "https://github.com/rcarriga/nvim-notify", name = "notify" },
	"https://github.com/nvim-zh/colorful-winsep.nvim",
	"https://github.com/rachartier/tiny-cmdline.nvim",
})
--require("dropbar").setup()
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
vim.notify = require("notify")
require("notify").setup({
	background_colour = "NotifyBackground",
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
