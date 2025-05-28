return {
	{ 'neovim/nvim-lspconfig' },
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		branch = 'main',
		build = ':TSUpdate',
		config = function ()
			require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "tmux" },
                auto_install = true,
                highlight = { enable = true },
							})
		end
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	}
}
