return {
	"mfussenegger/nvim-dap",
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
	dependencies = {
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Run/Continue",
		},
		{
			"<leader>ds",
			function()
				require("dap").session()
			end,
			desc = "Session",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
		}
		-- dap.configurations.cpp = {
		-- 	{
		-- 		name = "Launch file",
		-- 		type = "codelldb",
		-- 		request = "launch",
		-- 		program = function()
		-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- 		end,
		-- 		cwd = "${workspaceFolder}",
		-- 		stopOnEntry = false,
		-- 	},
		-- }
		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c
	end,
	opts = {
		adapters = {
			codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = {
						"--port",
						"${port}",
					},
				},
			},
			gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			},
		},
	},
}
