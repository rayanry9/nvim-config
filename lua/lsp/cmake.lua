vim.lsp.config("cmake-language-server", {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake", "CMakeLists.txt" },
	init_options = {
		buildDirectory = "build",
	},
})
