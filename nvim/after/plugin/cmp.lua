local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger autocompletion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm the selection
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },  -- Source for LSP completions
    { name = 'luasnip' },   -- Source for snippets from LuaSnip
  },
})

-- Set up LSP servers
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  -- Use `cmp` for autocompletion in LSP buffers
  require('cmp').setup.buffer({ sources = { { name = 'nvim_lsp' }, { name = 'luasnip' } } })
end

-- Example for Clangd (C++ LSP)
lspconfig.clangd.setup({
  on_attach = on_attach,
})
lspconfig.pyright.setup({
  on_attach = on_attach,
})

