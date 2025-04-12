require("config.lazy")
require("keymap")
require("config.autocmd")

-- number colon
vim.opt.number = true
vim.opt.relativenumber = true

-- ligatures
vim.opt.termguicolors = true

-- encoding / icons
--vim.opt.ambiwidth = "double"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- scroll padding
vim.opt.scrolloff = 15
vim.bo.modifiable = true

-- set
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true

-- autocompletion
-- vim.lsp.completion.enable(true, {autotrigger=true})

-- modification out
-- vim.opt.wrap = false -- do not wrap text but insert EOL instead
vim.opt.textwidth = 100
vim.opt.cursorline = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- gouttiere
vim.opt.signcolumn = "yes"
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { only_current_line = true },
	underline = false,
	italic = false,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.INFO] = "◉",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
})
-- undo
vim.opt.undofile = true

-- blink avante
vim.api.nvim_set_hl(0, "BlinkCmpKindAvante", { default = false, fg = "#89b4fa" })
