vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/xzbdmw/colorful-menu.nvim",
	"https://github.com/chrisgrieser/nvim-scissors",
})
require("colorful-menu").setup({
	ls = {
		lua_ls = {
			arguments_hl = "@comment",
		},
		gopls = {
			align_type_to_right = true,
			add_colon_before_type = false,
			preserve_type_when_truncate = true,
		},
		ts_ls = {
			extra_info_hl = "@comment",
		},
		vtsls = {
			extra_info_hl = "@comment",
		},
		["rust-analyzer"] = {
			extra_info_hl = "@comment",
			align_type_to_right = true,
			preserve_type_when_truncate = true,
		},
		clangd = {
			extra_info_hl = "@comment",
			align_type_to_right = true,
			import_dot_hl = "@comment",
			preserve_type_when_truncate = true,
		},
		zls = {
			align_type_to_right = true,
		},
		roslyn = {
			extra_info_hl = "@comment",
		},
		dartls = {
			extra_info_hl = "@comment",
		},
		basedpyright = {
			extra_info_hl = "@comment",
		},
		pylsp = {
			extra_info_hl = "@comment",
			arguments_hl = "@comment",
		},
		fallback = true,
		fallback_extra_info_hl = "@comment",
	},
	fallback_highlight = "@variable",
	max_width = 60,
})
require("scissors").setup({ snippetDir = "~/.config/nvim/snippets" })
require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "select_and_accept", "fallback" },
		["<S-TAB>"] = { "select_prev", "fallback" },
		["<TAB>"] = { "select_next", "fallback" },

		-- disable a keymap from the preset
		["<C-e>"] = { "show_signature", "hide_signature", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
	},
	cmdline = { enabled = true, completion = {
		menu = {
			auto_show = true,
		},
	} },
	appearance = {
		highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
		kind_icons = {
			Text = "󰉿",
			Method = "󰊕",
			Function = "󰊕",
			Constructor = "󰒓",

			Field = "󰜢",
			Variable = "󰆦",
			Property = "󰖷",

			Class = "󱡠",
			Interface = "󱡠",
			Struct = "󱡠",
			Module = "󰅩",

			Unit = "󰪚",
			Value = "󰦨",
			Enum = "󰦨",
			EnumMember = "󰦨",

			Keyword = "󰻾",
			Constant = "󰏿",

			Snippet = "󱄽",
			Color = "󰏘",
			File = "󰈔",
			Reference = "󰬲",
			Folder = "󰉋",
			Event = "󱐋",
			Operator = "󰪚",
			TypeParameter = "󰬛",
		},
	},
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						width = { fill = true, max = 60 },
						text = function(ctx)
							local highlights_info = require("colorful-menu").blink_highlights(ctx)
							if highlights_info ~= nil then
								return highlights_info.label
							else
								return ctx.label
							end
						end,
						highlight = function(ctx)
							local highlights = {}
							local highlights_info = require("colorful-menu").blink_highlights(ctx)
							if highlights_info ~= nil then
								highlights = highlights_info.highlights
							end
							for _, idx in ipairs(ctx.label_matched_indices) do
								table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
							end
							-- Do something else
							return highlights
						end,
					},
				},
			},
		},
	},
	signature = { enabled = true },
	sources = {
		default = {
			"buffer",
			"lsp",
			"snippets",
			"path",
		},
		providers = {
			buffer = { score_offset = 3 },
			path = { score_offset = 2 },
			lsp = { score_offset = 5 },
			snippets = {
				score_offset = 4,
				opts = {
					search_paths = { "~/.config/nvim/snippets" },
				},
			},
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	snippets = { preset = "default" },
	opts_extend = { "sources.default" },
})
