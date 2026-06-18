vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		["_"] = { "trim_whitespace" },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		rust = { "rustfmt", lsp_format = "fallback" },
		cpp = { "clang-format" },
		json = { "clang-format" },
		asm = { "asmfmt" },
		markdown = { "mdformat" },
		python = { "black" },
		bash = { "beautysh" },
		zsh = { "beautysh" },
	},
})
