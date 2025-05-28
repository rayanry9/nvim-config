return {
	{ 'neovim/nvim-lspconfig' },
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		branch = 'master',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { "c", "lua", "vim", "typescript", "javascript", "html", "css", "go", "bash", "dart", "dockerfile", "gitignore", "gomod", "gosum", "json5", "latex", "make", "python", "sql"},
			highlight = {
				enable = true
			}

		}
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	}
}
