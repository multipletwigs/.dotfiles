require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "jsonls",
    "html",
    "cssls",
    "pyright",
  },
  automatic_installation = true,
})
