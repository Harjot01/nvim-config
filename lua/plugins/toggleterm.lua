return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({
			size = 10, -- Size of the terminal (height for horizontal, width for vertical)
			open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
			hide_numbers = true, -- Hide line numbers in terminal buffers
			shade_terminals = true, -- Shade background of terminal
			direction = "horizontal", -- "horizontal" | "vertical" | "tab" | "float"
			float_opts = {
				border = "curved", -- Border style for floating terminals
				winblend = 3,
			},
		})
	end,
}
