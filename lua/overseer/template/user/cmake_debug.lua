return {
	name = "c/c++ debug(use cmake)",
	builder = function()
		local file = vim.fs.joinpath(vim.fn.getcwd(), "CMakeLists.txt")
		local dir = vim.fs.joinpath(vim.fn.getcwd(), "debug")
		if vim.uv.fs_stat(file) then
			if vim.fn.isdirectory(dir) == 0 then
				cmd = { "cmake", "-DCMAKE_BUILD_TYPE=debug", "-B", "debug" }
			else
				cmd = { "cmake", "--build", "debug" }
			end
		else
			cmd = {}
		end
		return {
			cmd = cmd,
			-- attach a component to the task that will pipe the output to the quickfix.
			-- components customize the behavior of a task.
			-- see :help overseer-components for a list of all components.
			components = { { "on_output_quickfix", open = false }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp", "c" },
	},
}
