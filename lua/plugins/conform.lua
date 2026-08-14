vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		["_"] = { "trim_whitespace" },
		["*"] = { "codespell" },
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		cpp = { "clang-format", args = { "-style=LLVM" } },
		json = { "clang-format" },
		asm = { "asmfmt" },
		markdown = { "mdformat" },
		python = { "black" },
		bash = { "beautysh" },
		zsh = { "beautysh" },
	},
})
