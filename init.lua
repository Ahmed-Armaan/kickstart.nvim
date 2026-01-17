require('setup')

print("Delta's vim")

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.cmdheight = 0

vim.api.nvim_create_autocmd('LspAttach', require('setup.lsp_actions'))
vim.lsp.enable({ 'lua_ls' })
vim.lsp.enable({ 'go_ls' })
vim.lsp.enable({ 'ts_ls' })
vim.lsp.enable({ 'clang_ls' })
vim.lsp.enable({ 'tailwind_ls' })
vim.lsp.enable({ 'rust_ls' })

vim.env.HELLO = "hello"

vim.g.did_load_netrw = 1

-- Run treesitter
vim.api.nvim_create_autocmd('FileType', {
	-- List every language you want treesitter to handle
	pattern = { 'c', 'cpp', 'go', 'lua', 'rust', 'javascript', 'typescript', 'bash' },
	callback = function()
		-- pcall prevents errors if the parser isn't installed yet
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.todo.md",
	callback = function(data)
		local buf = data.buf
		local date_line = "## " .. os.date("%Y-%m-%d")

		-- Replace the first line (line index 0)
		vim.api.nvim_buf_set_lines(buf, 0, 1, false, { date_line })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
