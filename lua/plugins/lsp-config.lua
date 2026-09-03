return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"tree-sitter-cli",
				"basedpyright",
				"gopls",
				"lua-language-server",
				"prettier",
				"prettierd",
				"ruff",
				"stylua",
				"tailwindcss-language-server",
				"vtsls",
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
