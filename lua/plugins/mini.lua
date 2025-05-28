-- Statusline config start
local function override_hl()
	local filename_hl = { bg = "#181825", fg = "#CDD6F5" }
	local inactive_hl = { bg = "#181825", fg = "#89B4FB" }

	vim.api.nvim_set_hl(0, "MiniStatuslineFilename", filename_hl)
	vim.api.nvim_set_hl(0, "MiniStatuslineInactive", inactive_hl)
end

local statuses = {
	["CANCELED"] = { symbol = " ", hl = "markdownH3" },
	["FAILURE"] = { symbol = "󰅚 ", hl = "markdownH1" },
	["SUCCESS"] = { symbol = "󰄴 ", hl = "markdownH4" },
	["RUNNING"] = { symbol = "󰑮 ", hl = "markdownH2" },
}

local function get_overseer_task_status(status)
	local result = { hl = "MiniStatuslineInactive", strings = { nil } }
	if not package.loaded.overseer then
		return result
	end

	local tasks = require("overseer.task_list").list_tasks({ unique = true })
	local tasks_by_status = require("overseer.util").tbl_group_by(tasks, "status")
	if not tasks_by_status[status] then
		return result
	end

	local str = string.format("%s%d", statuses[status].symbol, #tasks_by_status[status])
	result.hl = statuses[status].hl
	result.strings = { str }
	return result
end

local function get_noice_status(str_callback, cond_callback, hl)
	local result = { hl = "MiniStatuslineInactive", strings = { nil } }
	if not cond_callback() then
		return result
	end
	result.hl = hl
	result.strings = { str_callback() }
	return result
end

local function get_cwd()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
end

local function get_relative_filename()
	return vim.fn.expand("%:.")
end
-- Statusline setup end

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
			-- statusline.setup({ use_icons = true })
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

			if vim.g.colors_name == "catppuccin-mocha" then
				override_hl()
			end

			statusline.setup({
				content = {
					-- Content for active window
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
						---@diagnostic disable-next-line: unused-local
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
							"%<", -- Mark general truncate point
							get_overseer_task_status("CANCELED"),
							get_overseer_task_status("FAILURE"),
							get_overseer_task_status("SUCCESS"),
							get_overseer_task_status("RUNNING"),
							{ hl = "MiniStatuslineFilename", strings = { get_relative_filename() } },
							"%=", -- End left alignment
							get_noice_status(
								require("noice").api.status.mode.get,
								require("noice").api.status.mode.has,
								mode_hl
							),
							{ hl = "MiniStatuslineFilename", strings = { get_cwd() } },
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})
		end,
		version = "*",
	},
}
