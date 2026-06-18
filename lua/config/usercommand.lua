local usercommand = vim.api.nvim_create_user_command
usercommand("Packupdate", "lua vim.pack.update()", { bang = true, desc = "Pack Update" })
usercommand("Packdelate", "lua vim.pack.del()", { bang = true, desc = "Pack Delate" })
