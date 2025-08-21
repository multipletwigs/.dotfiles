return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Explicitly disable pylsp
        pylsp = {
          enabled = false,
        },
        -- Ensure pyright is enabled
        pyright = {
          enabled = true,
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Remove python-lsp-server from ensure_installed if it exists
      if opts.ensure_installed then
        for i, pkg in ipairs(opts.ensure_installed) do
          if pkg == "python-lsp-server" or pkg == "pylsp" then
            table.remove(opts.ensure_installed, i)
            break
          end
        end
      end
      return opts
    end,
  },
}
