-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Insert file path as comment (simple version)
map("n", "<leader>ci", function()
  local path = vim.fn.expand("%:~:.")
  local comment = "// Path to file: " .. path

  -- Insert at cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local new_line = line:sub(1, col) .. comment .. line:sub(col + 1)

  vim.api.nvim_set_current_line(new_line)
  vim.api.nvim_win_set_cursor(0, { row, col + #comment })
end, { desc = "Insert file path as comment" })

-- Пустая строка снизу, курсор переходит на новую строку
map("n", "<leader>o", function()
  vim.cmd("normal! o")
  vim.cmd("stopinsert") -- выходим из режима вставки
end, { desc = "Insert blank line below and move down" })

-- Пустая строка сверху, курсор переходит на новую строку
map("n", "<leader>O", function()
  vim.cmd("normal! O")
  vim.cmd("stopinsert") -- выходим из режима вставки
end, { desc = "Insert blank line above and move up" })
