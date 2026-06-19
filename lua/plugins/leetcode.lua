vim.pack.add({
	"https://github.com/kawre/leetcode.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})
require("leetcode").setup({
	---@type string
	arg = "leetcode.nvim",

	---@type lc.lang
	lang = "cpp",

	cn = { -- leetcode.cn
		enabled = true, ---@type boolean
		translator = true, ---@type boolean
		translate_problems = true, ---@type boolean
	},

	---@type lc.storage
	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
})
