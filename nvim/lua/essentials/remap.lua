vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>rr', ':!./a.out<CR>', { silent = true })
vim.keymap.set("n", "<leader>rd", ":Make<CR>") -- yk
vim.keymap.set("n", "<leader>tn", ":tabnew | :Ex<CR>")		-- new tab
vim.keymap.set("n", "<leader>tr", function()
	local new_name = vim.fn.input("Rename Tab: ")
	vim.api.nvim_command("file " .. new_name)
end)									--rename tab
vim.keymap.set("n", "<leader>tt", ":tabn<CR>")     			-- next tab
vim.keymap.set("n", "<leader>tz", ":tabp<CR>")				-- prev. tab
vim.keymap.set("n", "<leader>tc", ":tabnew | :term ./a.out<CR>i")     	-- new ./a.out tab terminal
vim.keymap.set("n", "<leader>-", ":w<CR>")     	-- new ./a.out tab terminal
