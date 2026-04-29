return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"typescript-language-server",
				"pyright",
				"css-lsp",
				"shfmt",
			},
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		--@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				cmd = { "lua-language-server" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				cmd = { "pyright-langserver", "--stdio" },
				root_markers = { "pyproject.toml", "setup.py", ".git" },
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				cmd = { "typescript-language-server", "--stdio" },
				root_markers = { "package.json", "tsconfig.json", ".git" },
			})

			-- Enable semua LSP server
			vim.lsp.enable("lua_ls", "pyright", "ts_ls")
		end,
	},
}
