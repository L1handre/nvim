return {
	{
		"mason-org/mason.nvim",
		init = function()
			local function mason_package_path(package)
				local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
				return path
			end

			local pylsp = require("mason-registry").get_package("python-lsp-server")

			pylsp:on("install:success", function()
				local path = mason_package_path("python-lsp-server")
				local command = path .. "/venv/Scripts/pip.exe"
				local args = {
					"install",
					"-U",
					"pylsp-rope",
				}

				require("plenary.job")
					:new({
						command = command,
						args = args,
						cwd = path,
						on_exit = function(j, install_code)
							if install_code == 0 then
								local output = table.concat(j:result(), "\n")

								if output:match("Successfully installed") then
									vim.schedule(function()
										vim.notify(
											"[mason.nvim] pylsp-rope succesfully installed.",
											vim.log.levels.INFO
										)
									end)
								end
							else
								vim.schedule(function()
									vim.notify("[mason.nvim] error when running pip.", vim.log.levels.ERROR)
								end)
							end
						end,
					})
					:start()
			end)
		end,
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
				"eslint-lsp"
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
				"pylsp",
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

			vim.lsp.config.pylsp = {
				settings = {
					pylsp = {
						plugins = {
							rope_refactor = { enabled = true },
							rope_autoimport = { enabled = false },
							rope_completion = { enabled = false },

							autopep8 = { enabled = false },
							flake8 = { enabled = false },
							mccabe = { enabled = false },
							preload = { enabled = false },
							pycodestyle = { enabled = false },
							pyflakes = { enabled = false },
							pylint = { enabled = false },
							yapf = { enabled = false },
						},
					},
				},
			}
		end,
		keys = {
			{
				"<leader>rn",
				vim.lsp.buf.rename,
				{ desc = "LSP rename symbol" },
			},
		},
	},
}
