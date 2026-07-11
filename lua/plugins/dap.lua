vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/Jorenar/nvim-dap-disasm",
})
require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")
dapui.setup({})
vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
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
require("config.debugger")
local map = function(Mode, Key, Cmd, Desc)
	vim.keymap.set(Mode, Key, Cmd, Desc)
end
map("n", "<F5>", function()
	require("dap").continue()
end)
map("n", "<F10>", function()
	require("dap").step_over()
end)
map("n", "<F11>", function()
	require("dap").step_into()
end)
map("n", "<F12>", function()
	require("dap").step_out()
end)
map("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "[DAP] Dap Toggle Breakpoint" })
map("n", "<Leader>dB", function()
	require("dap").set_breakpoint()
end, { desc = "[DAP] Dap Set Breakpoint" })
map("n", "<Leader>dp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "[DAP] Breakpoint Log" })
map("n", "<Leader>dr", function()
	require("dap").repl.open()
end, { desc = "[DAP] Repl Open" })
map("n", "<Leader>dl", function()
	require("dap").run_last()
end, { desc = "[DAP] Run Last" })
map({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "[DAP] Dap Hover" })
map({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "[DAP] Dap Preview" })
map("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
map("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
