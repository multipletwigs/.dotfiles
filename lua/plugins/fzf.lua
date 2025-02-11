return {
  "ibhagwan/fzf-lua",
  opts = {
    lsp = {
      -- Immediately jump if there's only one definition
      jump_to_single_result = true,
      -- Don't show fzf window for single results
      silent = true,
      -- Reduce delay
      async_or_timeout = 3000,
    },
  },
}
