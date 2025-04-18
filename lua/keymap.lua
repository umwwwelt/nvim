-- mapping
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ui", vim.cmd.NvimTreeToggle)

-- visual move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cancel search highlight on <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- delete entire word
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })

-- Do not lose previously yanked content
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- cmd+s to save file
vim.keymap.set({ "n", "i", "v" }, "M-s>", "<cmd>w<CR>", { desc = "Save file" })

-- move in autocompletion suggestionkeykey
---[[ Setup keymaps so we can accept completion using Enter and choose items using arrow keys or Tab.
local pumMaps = {
	["<Tab>"] = "<C-n>",
	["<S-Tab>"] = "<C-p>",
	["<Down>"] = "<C-n>",
	["<Up>"] = "<C-p>",
	["<CR>"] = "<C-y>",
}
for insertKmap, pumKmap in pairs(pumMaps) do
	vim.keymap.set("i", insertKmap, function()
		return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
	end, { expr = true })
end
---]]

-- reload files
-- Execute current file, line, selection
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

-- inspect definitions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Avante
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteClear<Return>", { desc = "[C]lear [A]vante" })
