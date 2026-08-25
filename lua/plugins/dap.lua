vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/Jorenar/nvim-dap-disasm" },
})
require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	layouts = {
		{
			position = "left",
			size = 0.3,
			elements = {
				{ id = "stacks", size = 0.2 },
				{ id = "scopes", size = 0.5 },
				{ id = "breakpoints", size = 0.15 },
				{ id = "watches", size = 0.15 },
			},
		},
		{
			position = "bottom",
			size = 0.2,
			elements = {
				{ id = "repl", size = 0.3 },
				{ id = "console", size = 0.7 },
			},
		},
	},
})
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- require("dap-disasm").setup({
-- 	-- Add disassembly view to elements of nvim-dap-ui
-- 	dapui_register = true,
--
-- 	-- Add disassembly view to nvim-dap-view
-- 	dapview_register = true,
--
-- 	-- If registered, pass section configuration to nvim-dap-view
-- 	dapview = {
-- 		keymap = "D",
-- 		label = "Disassembly [D]",
-- 		short_label = "󰒓 [D]",
-- 	},
--
-- 	-- Show winbar with buttons to step into the code with instruction granularity
-- 	-- This settings is overriden (disabled) if the dapview integration is enabled and the plugin is installed
-- 	winbar = {
-- 		enabled = true,
-- 		labels = {
-- 			step_into = "Step Into",
-- 			step_over = "Step Over",
-- 			step_back = "Step Back",
-- 		},
-- 		order = {
-- 			"step_into",
-- 			"step_over",
-- 			"step_back",
-- 		},
-- 	},
--
-- 	-- The sign to use for instruction the exectution is stopped at
-- 	sign = "DapStopped",
--
-- 	-- Number of instructions to show before the memory reference
-- 	ins_before_memref = 16,
--
-- 	-- Number of instructions to show after the memory reference
-- 	ins_after_memref = 16,
--
-- 	-- Columns to display in the disassembly view
-- 	columns = {
-- 		"address",
-- 		"instructionBytes",
-- 		"instruction",
-- 	},
-- })
dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--quiet", "--interpreter=dap" },
}
dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

	-- On windows you may have to uncomment this:
	-- detached = false,
}
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.configurations.rust = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp

-- dap.defaults.fallback.external_terminal = {
-- 	command = "/usr/bin/kitty",
-- 	args = { "-e" },
-- }
-- dap.defaults.fallback.force_external_terminal = true
