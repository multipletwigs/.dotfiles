return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue", "typescript", "javascript" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable volar
        volar = false,
        -- Configure Vetur for Vue 2
        vuels = {
          filetypes = { "vue" },
          init_options = {
            config = {
              vetur = {
                completion = {
                  autoImport = true,
                  useScaffoldSnippets = true,
                },
                format = {
                  defaultFormatter = {
                    html = "none",
                    js = "none",
                    ts = "none",
                  },
                },
                validation = {
                  template = true,
                  script = true,
                  style = true,
                  templateProps = true,
                  interpolation = true,
                },
                experimental = {
                  templateInterpolationService = true,
                },
              },
            },
          },
        },
        -- Disable ESLint for Vue files
        eslint = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- Remove "vue" from filetypes
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
}
