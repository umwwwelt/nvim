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
					attributes = {},
					comments = {},
					keywords = { "italic" },
				},
				color_overrides = {
					mocha = {
						green = "#93dbbd",
						blue = "#5FA8D3",
						lavender = "#C4A5FF",
						svelte = "#f96743",
						paleblue = "#B0E0E9",
						tsblue = "#007ACC",
						tsdarker = "#004675",
						mauve = "#624e80",
						surface1 = "#302e33",
					},
				},
				custom_highlights = function(colors)
					return {
						CursorLineNr = { fg = colors.green, bold = true },
						Operator = { fg = colors.yellow },
						Comment = { fg = colors.surface1 },
						["@property"] = { fg = colors.text },
						["@tag.delimiter.svelte"] = { fg = colors.rosewater },
						["@custom.html"] = { fg = colors.base },
						-- svelte
						["@string.svelte"] = { fg = colors.rosewater },
						["@tag.svelte"] = { fg = colors.maroon },
						["@component.svelte"] = { fg = colors.svelte, bold = true },
						["@label.typescript"] = { fg = colors.svelte, bold = true },
						["@keyword.svelte"] = { fg = colors.svelte, italic = true },
						["@tag.attribute.svelte"] = { fg = colors.green, italic = false },
						["@keyword.repeat.svelte"] = { fg = colors.svelte, bold = true, italic = true },
						["@keyword.conditional.svelte"] = { fg = colors.svelte, bold = true, italic = true },
						["@tag.component.svelte"] = { fg = colors.svelte, bold = true },
						["@class.component.svelte"] = { bold = true },
						["@lsp.type.function.svelte"] = { fg = colors.svelte },
						["@lsp.typemod.function.local.svelte"] = { fg = colors.blue },
						["@lsp.typemod.function.readonly.svelte"] = { fg = colors.paleblue },
						-- JS
						["@function.method.call.javascript"] = { bold = true },
						-- TS
						["@keyword.type.typescript"] = { fg = colors.tsblue },
						["@keyword.conditional.typescript"] = { fg = colors.lavender, italic = true },
						["@keyword.operator.typescript"] = { fg = colors.tsdarker, italic = true },
						["@lsp.type.type.svelte"] = { fg = colors.tsblue, underline = true },
						["@lsp.type.type.typescript"] = { fg = colors.tsblue, underline = true },
						["@type.builtin.typescript"] = { fg = colors.paleblue },
						["@lsp.type.interface"] = { fg = colors.tsblue, underline = true },
						["@lsp.typemod.interface.declaration.svelte"] = { fg = colors.tsblue },
						-- CSS
						["@property.class.scss"] = { fg = colors.blue },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
