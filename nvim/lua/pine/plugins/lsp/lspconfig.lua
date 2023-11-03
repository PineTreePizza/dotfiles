return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").lua_ls.setup {}
    require("lspconfig").clangd.setup {}
    require("lspconfig").cssls.setup {}
    require("lspconfig").cmake.setup {}
    require("lspconfig").bashls.setup {}
    require("lspconfig").arduino_language_server.setup {}
    require("lspconfig").dockerls.setup {}
    require("lspconfig").html.setup {}
    require("lspconfig").jsonls.setup {}
    require("lspconfig").jedi_language_server.setup {}
    require("lspconfig").sqlls.setup {}
    require("lspconfig").tsserver.setup {}
  end
}
