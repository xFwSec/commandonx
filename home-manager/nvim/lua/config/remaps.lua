vim.keymap.set('n', '<Leader>gf', function()
	vim.cmd('Telescope live_grep')
end, {noremap = true, silent = true })

vim.keymap.set('n', '<Leader>ff', function()
	vim.cmd('Telescope find_files')
end, {noremap = true, silent = true })
