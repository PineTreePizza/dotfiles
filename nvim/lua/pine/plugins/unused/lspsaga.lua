return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        border = 'rounded',
      },
    })
    _G.auto_hover = true
    _G.last_cursor_moved = vim.loop.now()
    function AutoHover()
      -- don't bother if mode isn't normal and auto hover is disabled.
      if vim.fn.mode() ~= "n" or not _G.auto_hover then
        return
      end

      local timer = vim.loop.new_timer()
      local job = function()
        -- if should ignore or mode is no longer normal. ignore
        if vim.loop.now() - last_cursor_moved < 3000 or vim.fn.mode() ~= "n" then
          return
        end
        local hover = require "lspsaga.hover"
        if not hover.has_saga_hover() then
          hover.render_hover_doc()
        end
      end

      -- Start the timer job
      timer:start(3000, 0, vim.schedule_wrap(job))
    end

    vim.cmd "autocmd CursorMoved <buffer> lua last_cursor_moved = vim.loop.now()"
    vim.cmd "autocmd CursorHold <buffer> lua AutoHover()"
    vim.keymap.set('n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>')
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  }
}
