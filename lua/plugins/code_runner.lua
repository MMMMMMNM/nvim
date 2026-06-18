vim.pack.add({ "https://github.com/CRAG666/code_runner.nvim" })
require("code_runner").setup({
	filetype = {
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
		c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
	},
})
vim.keymap.set("n", "<leader>rr", "<cmd>RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", "<cmd>RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rt", "<cmd>RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", "<cmd>RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", "<cmd>RunClose<CR>", { noremap = true, silent = false })
