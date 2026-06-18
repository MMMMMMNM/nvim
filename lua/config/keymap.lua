local map = function(Mode, Key, Cmd, Desc)
	vim.keymap.set(Mode, Key, Cmd, Desc)
end
------------------------------split config
map("n", "<leader>ow", "<cmd>vsplit<cr>", { desc = " Vsplit" }) -- vsplit
map("n", "<leader>os", "<cmd>split<cr>", { desc = " Split" }) -- split
------------------------------Line Move config
map({ "n", "v" }, "<A-k>", "<cmd>m .-2<cr>==", { silent = true, desc = "Move line up" }) -- Move line up
map({ "n", "v" }, "<A-j>", "<cmd>m .+1<cr>==", { silent = true, desc = "Move line down" }) -- Move line down
------------------------------Only use hjkl Move
map("i", "jk", "<Esc>")
map({ "n", "i", "v" }, "<Left>", "<Nop>")
map({ "n", "i", "v" }, "<Right>", "<Nop>")
map({ "n", "i", "v" }, "<Up>", "<Nop>")
map({ "n", "i", "v" }, "<Down>", "<Nop>")
------------------------------Windows Move
map({ "n", "i", "v" }, "<C-k>", "<C-w>k")
map({ "n", "i", "v" }, "<C-j>", "<C-w>j")
map({ "n", "i", "v" }, "<C-l>", "<C-w>l")
map({ "n", "i", "v" }, "<C-h>", "<C-w>h")
-----------------------------Flash
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map({ "o", "x" }, "<c-s>", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
---------------------------------Scissors
map("n", "<leader>se", function()
	require("scissors").editSnippet()
end, { desc = "Snippet: Edit" })

-- when used in visual mode, prefills the selection as snippet body
map({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end, { desc = "Snippet: Add" })
