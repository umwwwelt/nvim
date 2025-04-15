return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example avante
			provider = "openai",
			auto_suggestions_provider = "gemini",
			memory_summary_provider = "gemini",
			cursor_applying_provider = "gemini",
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4.1-2025-04-14", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
			},
			claude = {
				model = "claude-3-7-sonnet-latest",
				max_tokens = 8192,
			},
			gemini = {
				model = "gemini-2.0-flash-lite",
			},
			vendors = {
				mistral = {
					api_key_name = "MISTRAL_API_KEY",
					endpoint = "https://api.mistral.ai/v1",
					model = "codestral-latest",
					__inherited_from = "openai",
				},
			},
			suggestion = {
				debounce = 300,
				throttle = 1000,
			},
			rag_service = {
				enabled = false, -- Enables the RAG service
				host_mount = os.getenv("HOME"), -- Host mount path for the rag service
				provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
				llm_model = "4o-mini", -- The LLM model to use for RAG service
				embed_model = "text-embedding-ada-002", -- The embedding model to use for RAG service
			},
			web_search_engine = {
				provider = "brave",
			},
			behaviour = {
				auto_suggestions = true,
				enable_cursor_planning_mode = true,
				auto_suggestions_respect_ignore = true,
				enable_claude_text_editor_tool_mode = false,
				use_cwd_as_project_root = true,
			},
			mappings = {
				suggestion = {
					accept = "<Tab>",
				},
				ask = "<leader>à",
				files = {
					add_current = "<leader>aw",
				},
			},
			windows = {
				sidebar_header = {
					rounded = false,
					align = "left",
				},
				edit = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					start_insert = false,
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
