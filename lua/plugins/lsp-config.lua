return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- Lua Language Server
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Typescript Language Server
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			-- C++ Language Server
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
			})

			-- Python Language Server
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- Change to "strict" for more rigorous type checking
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		end,
	},
}
