vim.pack.add({ "https://github.com/nickjvandyke/opencode.nvim" })
---@type opencode.Opts
vim.g.opencode_opts = {}

vim.o.autoread = true -- Required for `opts.events.reload`
