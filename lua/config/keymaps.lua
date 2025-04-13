-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ToggleTerm mappings
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

-- Tailwind keybinds
vim.keymap.set("n", "<leader>ts", function()
  require("tailwind-sorter").sort()
end, { desc = "Sort Tailwind classes" })
vim.keymap.set("v", "<leader>ts", function()
  require("tailwind-sorter").sort()
end, { desc = "Sort Tailwind classes in selection" })
