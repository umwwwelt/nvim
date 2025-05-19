return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},

	config = function(_)
		vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=floating<CR>", { desc = "Open [G]it" })
	end,
}
