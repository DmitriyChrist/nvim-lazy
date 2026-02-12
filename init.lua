-- Загрузка LazyVim
require("config.lazy")
-- Ваши кастомные подсветки
local function setup_highlights()
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFF00", bold = true })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#90EE90", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#90EE90", italic = true })
  vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#90EE90" })
  vim.api.nvim_set_hl(0, "bashComment", { fg = "#90EE90", italic = true })
  vim.api.nvim_set_hl(0, "@comment.bash", { fg = "#90EE90", italic = true })
end

-- Установить при старте
vim.schedule(function()
  setup_highlights()
end)

-- И переустановить при смене цветовой схемы
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = setup_highlights,
})

-- Автоматическая свертка по отступам
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99 -- начальный уровень свертки (99 = почти все открыто)
vim.opt.foldenable = true

-- Клавиши для быстрого управления
vim.keymap.set("n", "<leader>zz", "zA", { desc = "Toggle fold under cursor" })
vim.keymap.set("n", "<leader>zr", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>zm", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>zj", "zj", { desc = "Next fold" })
vim.keymap.set("n", "<leader>zk", "zk", { desc = "Previous fold" })
