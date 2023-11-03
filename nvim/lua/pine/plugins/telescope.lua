return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				prompt_prefix = " 󰭎  ",
				selection_caret = "  ",
				path_display = { "smart" },
				vimgrep_arguments = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--no-ignore",
					"--hidden",
				},
				-- Default configuration for telescope goes here:
				-- config_key = value,
			},
			extensions = {
				fzf = {
					fuzzy = true,              -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
				},
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					hidden = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {},
					},
				},
				--[[ persisted = {
					layout_config = { width = 0.55, height = 0.55 }
				}, ]]
			},
		})
		-- require("telescope").load_extension("persisted")
		-- require("telescope").load_extension("session-lens")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		vim.keymap.set("n", "<leader>fx", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ noremap = true })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
