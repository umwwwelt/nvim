return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- theme
			require("catppuccin").setup({
				flavor = "latte",
				transparent_background = true,
				styles = {
					comments = { "italic" },
				},
				color_overrides = {
					mocha = {
						green = "#93dbbd",
						blue = "#5FA8D3",
						lavender = "#C4A5FF",
						red = "#ff3e00",
					},
				},
				custom_highlights = function(colors)
					return {
						Operator = { fg = colors.yellow },
						["@property"] = { fg = colors.text },
						["@tag.svelte"] = { fg = colors.red },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
