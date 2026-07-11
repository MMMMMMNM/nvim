return {
	name = "c/c++ build(use cmake)",
	builder = function()
		local file = vim.fs.joinpath(vim.fn.getcwd(), "CMakeLists.txt")
		local dir = vim.fs.joinpath(vim.fn.getcwd(), "build")
		if vim.uv.fs_stat(file) then
			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p")
				print("create build")
				cmd = { "cmake", "-B", "build" }
			else
				cmd = { "cmake", "--build", "build" }
			end
		else
			cmd = {}
		end
		return {
			cmd = cmd,
			components = { { "on_output_quickfix", open = false }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp", "c" },
	},
}
