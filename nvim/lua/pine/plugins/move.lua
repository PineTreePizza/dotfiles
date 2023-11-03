return {
  "hinell/move.nvim",
  config = function()
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    vim.keymap.set('n', '<A-k>', ':MoveLine 1<CR>', opts)
    vim.keymap.set('n', '<A-j>', ':MoveLine -1<CR>', opts)
    vim.keymap.set('n', '<S-h>', ':MoveWord -1<CR>', opts)
    vim.keymap.set('n', '<S-l>', ':MoveWord 1<CR>', opts)

    -- Visual-mode commands
    vim.keymap.set('x', '<A-k>', ':MoveBlock 1<CR>', opts)
    vim.keymap.set('x', '<A-j>', ':MoveBlock -1<CR>', opts)
    vim.keymap.set('v', '<S-h>', ':MoveHBlock -1<CR>', opts)
    vim.keymap.set('v', '<S-l>', ':MoveHBlock 1<CR>', opts)
  end
}
