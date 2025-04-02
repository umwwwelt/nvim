-- AI Budget
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Create a coroutine for asynchronous execution
		local co = coroutine.create(function()
			local budget = require("custom.ai_budget").get_openai_budget()
			vim.schedule(function()
				vim.notify(budget, vim.log.levels.INFO, { title = "Budget OpenAI" })
			end)
		end)

		-- Resume the coroutine
		coroutine.resume(co)
	end,
})

-- Return to alpha after closing the last buffer
vim.api.nvim_create_autocmd("BufDelete", {
	callback = function()
		-- Check if there are any remaining buffers
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		print("Number of listed buffers: " .. #buffers) -- Debugging message
		if #buffers == 0 or buffers == 1 then
			-- Open the alpha screen
			-- vim.cmd.alpha()
		end
	end,
})
