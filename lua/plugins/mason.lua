require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "jsonls",
    "html",
    "cssls",
    "gopls",
  },
  automatic_installation = true, -- optional
})
