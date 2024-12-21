local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>r", function()
  -- Save the current file before compiling
  vim.cmd("write")

  -- Get the file name and the output file name
  local file = vim.fn.expand("%")
  local output_file = vim.fn.expand("%:r") -- Remove the extension to get the output file name

  -- Compile the C++ file
  local compile_cmd = "g++ " .. file .. " -o " .. output_file
  vim.fn.system(compile_cmd)

  require("toggleterm").exec(output_file, 1)
  --Optional: Show a message in Neovim
  vim.api.nvim_out_write("Execution Complete!\n")
end, { noremap = true, silent = true })
