return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			map_bs = false,
			map_cr = false,
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		},
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					g = function()
						return { line = vim.api.nvim_win_get_cursor(0)[1] }
					end,
					u = ai.gen_spec.function_call(),
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
			local wk = require("which-key")
			if wk then
				wk.add({
					{ "a", group = "mini.ai" },
					{ "i", group = "mini.ai inner" },
					{ "ao", desc = "Around block" },
					{ "io", desc = "Inner block" },
					{ "af", desc = "Around function" },
					{ "if", desc = "Inner function" },
					{ "ac", desc = "Around class" },
					{ "ic", desc = "Inner class" },
					{ "at", desc = "Around tag" },
					{ "it", desc = "Inner tag" },
					{ "ad", desc = "Around digit" },
					{ "id", desc = "Inner digit" },
					{ "ae", desc = "Around word with case" },
					{ "ie", desc = "Inner word with case" },
					{ "ag", desc = "Around buffer line" },
					{ "ig", desc = "Inner buffer line" },
					{ "au", desc = "Around function call" },
					{ "iu", desc = "Inner function call" },
				})
			end
		end,
	},
}
