return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ojroques/nvim-bufdel",
    },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",
          close_command = "BufDel %d",
          right_mouse_command = "BufDel %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          always_show_bufferline = true,

          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })

      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

      vim.keymap.set("n", "<C-w>", ":BufDel<CR>", { noremap = true, silent = true })

      require("bufdel").setup({
        next = "cycle",
        quit = false,
      })
    end,
  },
}
