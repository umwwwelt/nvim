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
						paleblue = "#B0E0E9",
						tsblue = "#007ACC",
					},
				},
				custom_highlights = function(colors)
					return {
						Operator = { fg = colors.yellow },
						["@property"] = { fg = colors.text },
						["@tag.delimiter.svelte"] = { fg = colors.rosewater },
						["@custom.html"] = { fg = colors.base },
						-- svelte
						["@string.svelte"] = { fg = colors.rosewater },
						["@tag.svelte"] = { fg = colors.maroon },
						["@keyword.conditional.svelte"] = { fg = colors.red, bold = true },
						["@class.component.svelte"] = { bold = true },
						["@lsp.type.function.svelte"] = { fg = colors.red },
						["@lsp.typemod.function.local.svelte"] = { fg = colors.blue },
						-- JS
						["@function.method.call.javascript"] = { bold = true },
						-- TS
						["@keyword.type.typescript"] = { fg = colors.tsblue, italic = true },
						["@lsp.type.type.svelte"] = { fg = colors.paleblue, underline = true },
						["@type.builtin.typescript"] = { fg = colors.paleblue },
						["@lsp.type.interface"] = { fg = colors.paleblue, bold = true },
						-- CSS
						["@property.class.scss"] = { fg = colors.blue },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
