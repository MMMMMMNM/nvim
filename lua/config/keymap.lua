local map = function(Mode, Key, Cmd, Desc)
	vim.keymap.set(Mode, Key, Cmd, Desc)
end
------------------------------split config
map("n", "<leader>ow", "<cmd>vsplit<cr>", { desc = " Vsplit" }) -- vsplit
map("n", "<leader>os", "<cmd>split<cr>", { desc = " Split" }) -- split
------------------------------Buffer
map("n", "<leader>obd", "<cmd>BufferDelete<cr>", { desc = "Buffer Delete" })
map("n", "<leader>obl", "<cmd>BufferPickDelete<cr>", { desc = "Buffer Pick Delete" })
map("n", "<leader>obp", "<cmd>BufferPick<cr>", { desc = "Buffer Pick" })
map("n", "<leader>obn", "<cmd>BufferNext<cr>", { desc = "Buffer Next" })
------------------------------Line Move config
map({ "n" }, "<A-k>", "<cmd>m .-2<cr>==", { silent = true, desc = "Move line up" }) -- Move line up
map({ "n" }, "<A-j>", "<cmd>m .+1<cr>==", { silent = true, desc = "Move line down" }) -- Move line down
map({ "v" }, "<A-k>", "<cmd>m '<-2<cr>gv=gv", { silent = true, desc = "Move line up" }) -- Move line up
map({ "v" }, "<A-j>", "<cmd>m '>+1<cr>gv=gv", { silent = true, desc = "Move line up" }) -- Move line up
------------------------------Only use hjkl Move
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
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
----------------------------------------lsp----------------------------------------
map("n", "gD", "<CMD>FzfLua lsp_declarations<CR>", { desc = "[G]oto [D]eclaration" })
map("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", { desc = "[G]oto [D]efinition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "[G]oto [I]mplementation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
map("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "gca", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "[C]ode [A]ction" })
map("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "[G]oto [R]eferences" })
