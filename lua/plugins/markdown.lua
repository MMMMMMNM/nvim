vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/HakonHarnes/img-clip.nvim",
	"https://github.com/3rd/image.nvim",
	"https://github.com/jakobkhansen/journal.nvim",
})
require("render-markdown").setup({
	completions = { lsp = { enabled = true }, blink = { enabled = true } },
	file_types = { "markdown", "vimwiki" },
	anti_conceal = {
		disabled_modes = { "n" },
	},
})
require("img-clip").setup()
require("image").setup({
	backend = "kitty", -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup", -- or "inline"
			floating_windows = false, -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		asciidoc = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup",
			floating_windows = false,
			filetypes = { "asciidoc", "adoc" },
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		rst = {
			enabled = true,
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = true,
		},
		css = {
			enabled = true,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	scale_factor = 1.0,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})
require("journal").setup({
	filetype = "md", -- Filetype to use for new journal entries
	root = "~/Templates/Journal", -- Root directory for journal entries
	date_format = "%d/%m/%Y", -- Date format for `:Journal <date-modifier>`
	autocomplete_date_modifier = "end", -- "always"|"never"|"end". Enable date modifier autocompletion

	-- Configuration for journal entries
	journal = {
		-- Default configuration for `:Journal <date-modifier>`
		format = "%Y/%m-%B/daily/%d-%A",
		template = "# %A %B %d %Y\n",
		frequency = { day = 1 },

		-- Nested configurations for `:Journal <type> <type> ... <date-modifier>`
		entries = {
			day = {
				format = "%Y/%m-%B/daily/%d-%A", -- Format of the journal entry in the filesystem.
				template = "# %A %B %d %Y\n", -- Optional. Template used when creating a new journal entry
				frequency = { day = 1 }, -- Optional. The frequency of the journal entry. Used for `:Journal next`, `:Journal -2` etc
			},
			week = {
				format = "%Y/%m-%B/weekly/week-%W",
				template = "# Week %W %B %Y\n",
				frequency = { day = 7 },
				date_modifier = "monday", -- Optional. Date modifier applied before other modifier given to `:Journal`. Can contain multiple chained date modifiers with spaces between
			},
			month = {
				format = "%Y/%m-%B/%B",
				template = "# %B %Y\n",
				frequency = { month = 1 },
			},
			year = {
				format = "%Y/%Y",
				template = "# %Y\n",
				frequency = { year = 1 },
			},
		},
	},
})
