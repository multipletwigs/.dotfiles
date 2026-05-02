return {
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<Leader>tr",
        function()
          vim.cmd("rightbelow vsplit")
          vim.cmd("vertical resize 80")
          vim.cmd("terminal")
        end,
        desc = "Right split terminal (80 cols)",
      },
    },
  },
}
