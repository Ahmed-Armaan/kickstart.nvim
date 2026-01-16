function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	--transparent_groups = {
	--	"Normal",
	--	"NormalNC",
	--	--"NormalFloat",
	--	--"SignColumn",
	--	"EndOfBuffer",
	--	--"MsgArea",
	--	--"StatusLine",
	--	--"StatusLineNC",
	--	"WinSeparator",
	--}

	--for _, group in ipairs(transparent_groups) do
	--	vim.api.nvim_set_hl(0, group, { bg = "none" })
	--end
end

ColorMyPencils()
