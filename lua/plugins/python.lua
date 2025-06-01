return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
      formatters = {
        black = {
          args = {
            "--line-length=90",
            "--safe",
            "--skip-string-normalization",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
      },
    },
  },
}
