vim.pack.add({ "https://github.com/nickjvandyke/opencode.nvim" })
---@type opencode.Opts
vim.g.opencode_opts = {}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<leader>cx", function()
	require("opencode").select()
end, { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<leader>c.", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "<leader>cgo", function()
	return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "<leader>cgoo", function()
	return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<leader>csu", function()
	require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })
vim.keymap.set("n", "<leader>csd", function()
	require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })

-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
vim.keymap.set("n", "+", "<leader>ca", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<leader>ca", { desc = "Decrement under cursor", noremap = true })
