-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.o
local opt = vim.opt
local env = vim.env
local g = vim.g

o.swapfile = false -- disable swapfiles because
opt.cursorline = true

-- # Создай директорию + файл
-- OSC 52: VPS → Termux → Android clipboard
if env.SSH_TTY then
  g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
  opt.clipboard = { "unnamedplus" }
end

-- ~/.config/nvim/lua/config/options.lua
-- Отключи лигатуры навсегда
-- vim.opt.conceallevel = 0
-- vim.opt.conceal = false
