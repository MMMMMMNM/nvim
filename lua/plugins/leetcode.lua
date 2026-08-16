vim.pack.add({
	"https://github.com/kawre/leetcode.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})
vim.keymap.set("n", "<leader>ols", "<cmd>Leet submit<cr>", { desc = "leetcode submit" })
vim.keymap.set("n", "<leader>old", "<cmd>Leet desc<cr>", { desc = "leetcode desc" })
vim.keymap.set("n", "<leader>olr", "<cmd>Leet run<cr>", { desc = "leetcode run" })
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
		home = "~/Documents/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
})
