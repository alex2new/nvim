-- Load which-key
local wk = require("which-key")

-- Define a simple keybinding to show all mappings
vim.keymap.set("n", "<leader>k", function()
    wk.show()
end, { desc = "Show All Keybindings" })

