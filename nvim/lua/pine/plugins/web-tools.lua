return {
  "ray-x/web-tools.nvim",
  config = function()
    vim.opt.autochdir = true
    require 'web-tools'.setup({
      keymaps = {
        rename = nil,        -- by default use same setup of lspconfig
        repeat_rename = '.', -- . to repeat
      },
    })
  end
}
