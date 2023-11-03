return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "clangd", "cssls", "cmake", "bashls", "arduino_language_server", "dockerls", "html", "jsonls", "jedi_language_server", "sqlls", "tsserver"},

    }
  end
}
