vim.pack.add({ { src = "https://github.com/akinsho/toggleterm.nvim" } })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm Term" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm Float" })
require("toggleterm").setup({})
