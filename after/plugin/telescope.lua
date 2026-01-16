local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<M-Tab>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ft', function()
	require('telescope.builtin').find_files {
		cwd = "~/.todos/",
		hidden = true,
	}
end
, { desc = 'Telescope TODO' })

require('telescope').setup {
	defaults = require('telescope.themes').get_ivy {},
	pickers = {
		buffers = {
			sort_lastused = true,
			ignore_current_buffer = true,
		},
	},
}

--vim.keymap.set('n', '<M-Tab>', function()
--	local builtin = require('telescope.builtin')
--	local actions = require('telescope.actions')
--	local action_state = require('telescope.actions.state')
--	local timer
--
--	builtin.buffers({
--		attach_mappings = function(prompt_bufnr)
--			local picker_win = vim.api.nvim_get_current_win()
--
--			timer = vim.loop.new_timer()
--
--			vim.api.nvim_create_autocmd('CursorMoved', {
--				buffer = prompt_bufnr,
--				callback = function()
--					timer:stop()
--					timer:start(500, 0, vim.schedule_wrap(function()
--						local entry = action_state.get_selected_entry()
--						if not entry then return end
--
--						actions.close(prompt_bufnr)
--						vim.cmd('buffer ' .. entry.bufnr)
--					end))
--				end,
--			})
--
--			return true
--		end,
--	})
--end)
