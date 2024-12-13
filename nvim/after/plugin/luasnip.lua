local luasnip = require('luasnip')

-- Load snippets (optional)
require('luasnip.loaders.from_vscode').load()

-- You can also define your own snippets
luasnip.snippets = {
  all = {
    luasnip.parser.parse_snippet("expand", "This is an expanded snippet!"),
  },
}

-- Keybindings for snippets
vim.keymap.set({"i", "s"}, "<C-K>", function() luasnip.expand() end, {silent = true})

