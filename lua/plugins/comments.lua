vim.pack.add({
	{ src = "https://github.com/celeste3z/celeste_comment.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})
require("celeste_comment").setup({
	-- Restore cursor position after commenting.
	keep_cursor = true,

	-- Restore selection after commenting.
	-- See `:help celeste_comment-config-keep_selection`
	-- Possible values: "never" | "accurate" | "expand_block"
	keep_selection = "never",

	-- Insert space between comment marker and text.
	insert_space = true,

	-- Place comment at start of line, skip indent alignment
	line_comment_no_indent = false,

	-- Match comment markers case-insensitively (e.g. `@REM` vs `@rem` vs `@rEm`)
	case_insensitive = false,

	-- Trim whitespace before detecting block tokens.
	block_relaxed_detect = true,

	-- Max lines to search for block comment pairs.
	block_textobj_nlines = 200,

	-- How to handle empty lines during comment toggle.
	-- See `:help celeste_comment-config-ignore_empty_lines` for more details
	-- Possible values: "never" | "mixed" | "always"
	ignore_empty_lines = "always",

	-- Fallback to block comment when line comment wraps.
	-- See `:help celeste_comment-config-fallback_to_block` for more details
	-- Possible values: "never" | "if_line_cms_wrapped"
	fallback_to_block = "if_line_cms_wrapped",

	-- Log level (nvim-0.13+). Ignored on older versions.
	log_level = vim.log.levels.OFF,

	-- Comment string configuration.
	cms_confs = nil,

	mappings = {
		-- Line comment by motion (n)
		line_toggle = "gc",
		-- Line comment current line (n)
		line_toggle_cur = "gcc",
		-- Line comment visual selection (x)
		line_toggle_visual = "gc",
		-- Insert mode line toggle (i), example `{"<M-/>", "<M-_>"}`
		line_toggle_insert = "",

		-- Block comment by motion (n, x)
		block_toggle = "gb",
		-- Block comment current line (n)
		block_toggle_cur = "gbc",
		-- Block comment visual selection (x)
		block_toggle_visual = "gb",

		-- Linewise textobject (o)
		line_textobject = "gc",
		-- Blockwise textobject (o)
		block_textobject = "gb",
		-- Auto textobject (o, x), example 'ga'
		auto_textobject = "",
		-- Auto uncomment (n), example `gcu`
		uncomment_auto = "",

		-- Insert comment below (n), example `gco`
		line_add_below = "",
		-- Insert comment above (n), example `gcO`
		line_add_above = "",
		-- Insert comment at end of line (n), example `gcA`
		line_add_eol = "",

		-- Invert comment per line (n, x), example `gcI`
		line_invert = "",
		-- Force add line comment (n, x), example `gCC`
		line_force_add = "",
		-- Force remove line comment (n, x), example `gCU`
		line_force_remove = "",

		-- Cursor sticky dot-repeat
		dot_repeat = ".",
	},

	hooks = {
		-- Called before commit edits, receives context
		pre_commit_edits = nil,
		-- Called after commit edits, receives context
		post_commit_edits = nil,
		-- Custom comment string resolver function
		cms_conf_resolver = nil,
	},
})
require("todo-comments").setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE", -- The gui style to use for the fg highlight group.
		bg = "BOLD", -- The gui style to use for the bg highlight group.
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		multiline = true, -- enable multine todo comments
		multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
		before = "", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "fg", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of highlight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})
