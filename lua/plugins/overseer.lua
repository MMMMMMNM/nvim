vim.pack.add({
	{ src = "https://github.com/stevearc/overseer.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})
local overseer = require("overseer")
overseer.setup({
	dap = true,
	output = {
		-- Use a terminal buffer to display output. If false, a normal buffer is used
		use_terminal = true,
		-- If true, don't clear the buffer when a task restarts
		preserve_output = false,
	},
	keymaps = {
		["?"] = "keymap.show_help",
		["<CR>"] = "keymap.run_action",
		["p"] = "keymap.toggle_preview",
		["q"] = { "<CMD>close<CR>", desc = "Close task list" },
	},
	task_list = { direction = "right" },
	templates = { "user.run_script", "user.cpp_build" },
})
