return {
	{
		"mason-org/mason.nvim",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"tree-sitter-cli",
				"prettier",
				"prettierd",
				"stylua",
				"ruff",
			},
			auto_update = false,
			run_on_start = true,
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"basedpyright",
				"gopls",
				"lua_ls",
				"vtsls",
				"tailwindcss",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			}
		end,
	},
}
