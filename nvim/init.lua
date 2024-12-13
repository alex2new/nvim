require("essentials")
vim.o.number = true
vim.o.relativenumber = true

-- Run this in your `init.lua` or `after/plugin/` setup
vim.api.nvim_create_user_command('Make', function()
  local filename = vim.fn.expand('%')  -- Get the current file name
  local output_name = 'a.out'  -- Default output name for the compiled binary

  -- Compile C++ code using g++
  local compile_cmd = string.format('g++ -o %s %s', output_name, filename)
  local compile_result = vim.fn.system(compile_cmd)

  -- If compilation succeeds, run the compiled binary
  if vim.fn.executable(output_name) then
    vim.fn.system('./' .. output_name)
    print('Executed: ' .. output_name)
  else
    print('Compilation failed.')
    print(compile_result)  -- Display any compile errors
  end
  vim.keymap.set('n', '<leader>rm', ':Make<CR>', { noremap = true, silent = true })
end, { nargs = 0 })
vim.opt.clipboard = 'unnamedplus'

