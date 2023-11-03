return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				use_treesitter = false,
				style = "#806d9c",
			},
			indent = {
				chars = {
					"│",
					"¦",
					"┆",
					"┊",
				},
				style = {
					vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
				},
				use_treesitter = false,
			},
			line_num = {
				style = "#806d9c",
			},
			blank = {
				enable = true,
				chars = {
					" ",
				},
			},
		})
	end,
}
