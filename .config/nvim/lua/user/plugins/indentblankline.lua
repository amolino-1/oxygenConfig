return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	event = "InsertEnter", -- Only load this plugin when you enter insert mode
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
			"CursorColumn",
			"Whitespace",
		}
		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		end)

		require("ibl").setup({
			indent = {
				char = "│",
				highlight = highlight,
				smart_indent_cap = true,
			},
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				highlight = { "Function", "Label" },
				priority = 500,
			},
		})
	end,
}
