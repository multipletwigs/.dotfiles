return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Terminal mode mappings
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
    end

    -- Auto-apply terminal keymaps when ToggleTerm buffers are created
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
