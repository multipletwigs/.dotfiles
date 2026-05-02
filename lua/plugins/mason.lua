return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "pyright",
      },
      automatic_installation = true,
    },
  },
}
