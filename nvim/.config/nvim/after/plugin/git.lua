if vim.g.vscode then
  return
end
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

local My_GitCfg = vim.api.nvim_create_augroup('My_GitCfg', {})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = My_GitCfg,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= "fugitive" then return; end

    local bnr = vim.api.nvim_get_current_buf()
    local opts = {buffer = bnr, remap = false}
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({'pull',  '--rebase'})
    end, opts)
  end,
})
