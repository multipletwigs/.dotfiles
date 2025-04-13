-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
function Setup_Autosave(debounce_ms)
  debounce_ms = debounce_ms or 2000

  -- Clear existing timer if already defined
  if _G.autosave_timer then
    _G.autosave_timer:stop()
    _G.autosave_timer:close()
  end

  _G.autosave_timer = vim.loop.new_timer()

  vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = vim.api.nvim_create_augroup("AutosaveGroup", { clear = true }),
    callback = function()
      local timer = _G.autosave_timer
      if not timer or timer:is_closing() then
        return
      end

      timer:stop()
      timer:start(
        debounce_ms,
        0,
        vim.schedule_wrap(function()
          local bufnr = vim.api.nvim_get_current_buf()
          local ok_modifiable, modifiable = pcall(vim.api.nvim_buf_get_option, bufnr, "modifiable")
          local ok_modified, modified = pcall(vim.api.nvim_buf_get_option, bufnr, "modified")
          local buflisted = vim.fn.buflisted(bufnr) == 1
          local ft = vim.bo[bufnr].filetype

          -- Skip autosaving special or non-file buffers
          if ok_modifiable and ok_modified and modifiable and modified and buflisted and ft ~= "" then
            vim.cmd("silent! write")
          end
        end)
      )
    end,
  })
end

Setup_Autosave(1000)
