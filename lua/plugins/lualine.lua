return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- Automatically match colorscheme
				globalstatus = true, -- One statusline across all windows
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", color = { gui = "bold" } }, -- Show mode in different colors
				},
				lualine_b = { "branch", "diff" }, -- Git branch + diff (added, removed, modified)
				lualine_c = {
					{ "filename", path = 1 }, -- Show relative file path
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", hint = " ", info = " " },
					}, -- LSP diagnostics
				},
				lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, file format, file type
				lualine_y = { "progress" }, -- Show progress (e.g., 40%)
				lualine_z = { "location" }, -- Cursor position (line, column)
			},
			inactive_sections = {
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
			extensions = { "quickfix", "nvim-tree", "fugitive" }, -- Extra integrations
		})
	end,
}
