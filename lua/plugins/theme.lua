return {
	{
		"catppuccin/nvim",
		enabled = true,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- theme
			require("catppuccin").setup({
				flavor = "latte",
				transparent_background = true,
				term_colors = true,
				styles = {
					attributes = {},
					comments = {},
					keywords = { "italic" },
				},
				color_overrides = {
					mocha = {
						green = "#5FFFB2", -- inchangé
						lavender = "#E1AFFF", -- violet clair très saturé
						mauve = "#7c00db", -- violet électrique
						peach = "#f79e54",
						rosedarker = "#FF3C5E", -- rose/rouge très éclatant
						red = "#FF4D4D", -- rouge vif
						svelte = "#f96743", -- inchangé
						paleblue = "#A3F7FF", -- bleu ciel très lumineux
						paledarker = "#5DCAD6", -- turquoise saturé
						blue = "#3EBEFF", -- bleu électrique
						tsblue = "#007ACC", -- inchangé
						tsdarker = "#0063A6", -- bleu foncé mais plus saturé
						surface1 = "#46424E", -- gris profond, un peu bleuté
						yellow = "#f7d302",
						yellowdark = "#5c4e01",
						trans = "#0F1413", -- noir doux avec un peu plus de lumière
					},
				},
				custom_highlights = function(colors)
					return {
						TelescopeBorder = { fg = colors.green },
						CursorLineNr = { fg = colors.green, bold = true },
						CursorLine = { bg = colors.trans },
						MiniIndentscopeSymbol = { fg = colors.surface2 }, -- ligne d'indentation mini.indentscope
						LineNr = { fg = colors.surface2 }, -- gutter line numbers
						IblScope = { fg = colors.surface1 },
						Operator = { fg = colors.yellow },
						Comment = { fg = colors.surface2 },
						AvanteSuggestion = { reverse = true },
						AvantePopupHint = { bg = colors.green },
						["@property"] = { fg = colors.text },
						["@tag.delimiter.svelte"] = { fg = colors.surface1 },
						["@custom.html"] = { fg = colors.base },
						["@punctuation.bracket"] = { fg = colors.surface2 },
						["@keyword.exception"] = { fg = colors.red },
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
						["@lsp.typemod.function.readonly.svelte"] = { fg = colors.sapphire },
						-- JS
						["@string.javascript"] = { fg = colors.rosewater },
						["@function.method.call.javascript"] = { bold = true },
						-- TS
						["@string.typescript"] = { fg = colors.rosewater },
						["@keyword.typescript"] = { fg = colors.yellowdark },
						["@punctuation.special.typescript"] = { fg = colors.yellow },
						["@punctuation.delimiter.typescript"] = { fg = colors.surface1 },
						["@keyword.type.typescript"] = { fg = colors.tsblue },
						["@keyword.conditional.typescript"] = { fg = colors.lavender, italic = true },
						["@keyword.operator.typescript"] = { fg = colors.tsdarker, italic = true },
						["@keyword.coroutine.typescript"] = { fg = colors.paledarker, italic = true },
						["@lsp.type.type.svelte"] = { fg = colors.tsblue, underline = true },
						["@lsp.type.type.typescript"] = { fg = colors.tsblue, underline = true },
						["@type.builtin.typescript"] = { fg = colors.tsblue },
						["@lsp.type.interface"] = { fg = colors.tsblue, underline = true },
						["@lsp.typemod.interface.declaration.svelte"] = { fg = colors.tsblue },
						-- CSS
						["@property.class.scss"] = { fg = colors.blue },
						["@keyword.directive.scss"] = { fg = colors.rosedarker },
						["@variable.scss"] = { fg = colors.lavender },
						["@character.special.scss"] = { fg = colors.yellow },
						-- Diag
						DiagnosticWarn = { fg = colors.yellowdark },
						DiagnosticVirtualTextWarn = { fg = colors.yellowdark },
						DiagnosticUnderlineWarn = { sp = colors.yellowdark, undercurl = true },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
