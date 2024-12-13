-- mason.nvim setup
require("mason").setup()

-- mason-lspconfig setup
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright" },  -- Example LSP servers
})

-- LSP setup
local lspconfig = require('lspconfig')

-- Automatically configure LSP servers
for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
  lspconfig[server].setup {}
end
