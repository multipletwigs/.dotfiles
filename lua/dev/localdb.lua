local M = {}

M.start = function()
  vim.cmd("tabnew")

  vim.cmd("terminal")
  vim.fn.chansend(vim.b.terminal_job_id, "dblocal" .. "\n")
end

return M
