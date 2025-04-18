return {
	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			local highlighter = require("mini.hipatterns")
			highlighter.setup({
				highlighters = {
					hex_color = highlighter.gen_highlighter.hex_color({ priority = 2000 }),
				},
			})
			statusline.setup({ use_icons = true })
			-- Better Around/Inside textobjects
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.indentscope").setup({
				draw = {
					delay = 70,
				},
			})

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.pairs").setup()
		end,
		version = "*",
	},
}
