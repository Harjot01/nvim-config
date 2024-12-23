return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 10,             -- Size of the terminal (height for horizontal, width for vertical)
      open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
      hide_numbers = true,   -- Hide line numbers in terminal buffers
      shade_terminals = true, -- Shade background of terminal
      direction = "horizontal", -- "horizontal" | "vertical" | "tab" | "float"
      float_opts = {
        border = "curved",   -- Border style for floating terminals
        winblend = 3,
      },
    })
    -- Initialize terminal counter
    local terminal_counter = 0

    -- Keybinding to create a new terminal with a unique number
    vim.keymap.set("n", "<leader>tn", function()
      terminal_counter = terminal_counter + 1
      local terminal_name = "Terminal " .. terminal_counter

      -- Create a new terminal instance
      local new_terminal = require("toggleterm.terminal").Terminal:new({
        direction = "horizontal", -- You can also use "vertical" or "float"
        on_open = function(term)
          -- Set a unique buffer name using the terminal ID
          local unique_name = "Terminal " .. term.id
          vim.api.nvim_buf_set_name(term.bufnr, unique_name)
        end,
      })

      -- Open the terminal
      new_terminal:toggle()
      -- Optionally, print a message
      vim.api.nvim_out_write("Created " .. terminal_name .. "\n")
    end, { noremap = true, silent = true })
    -- Switch from terminal mode to normal mode
    vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-[>", [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
}
