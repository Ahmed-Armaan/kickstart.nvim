vim.g.mapleader = " "

-- using Oil RN, so redundant
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { desc = 'Delete into void' })
vim.keymap.set({ 'n', 'v' }, 'x', '"+x', { desc = 'Cut into system clipboard' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })

-- redundant since I am using telescope for TODOs
--vim.keymap.set('n', '<leader>td', function()
--	vim.cmd('vsplit ~/.todo.md')
--end, { desc = 'Open TODO list' })

vim.keymap.set('n', '<leader>mtd', function()
	vim.ui.input({ prompt = 'New TODO: ' }, function(input)
		local newTodoFile = '~/.todos/.' .. input .. '.todo.md'
		local newTodoFileCommand = '!touch ' .. newTodoFile
		vim.cmd(newTodoFileCommand)
	end)
end, { desc = 'Make a new TODO file' })

vim.keymap.set('n', '<leader>ar', function()
	vim.ui.input({ prompt = 'Registers: ' }, function(input)
		if not input or input == '' then return end

		local parts = {}

		for reg in input:gmatch('%S') do
			local val = vim.fn.getreg(reg)
			if val ~= '' then
				table.insert(parts, val)
			end
		end

		local result = table.concat(parts, '\n\n')
		vim.fn.setreg('+', result)

		vim.notify('Copied to + register:\n' .. result)
	end)
end, { desc = 'Accumulate registers into +' })
