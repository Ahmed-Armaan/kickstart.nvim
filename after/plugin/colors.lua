function ColorMyPencils(color)
	color = color or "vague"
	vim.cmd.colorscheme(color)

	--local transparent_groups = {
	--local t	"Normal",
	--local t	"NormalNC",
	--local t	--"NormalFloat",
	--local t	--"SignColumn",
	--local t	"EndOfBuffer",
	--local t	--"MsgArea",
	--local t	--"StatusLine",
	--local t	--"StatusLineNC",
	--local t	"WinSeparator",
	--local t}

	--local tfor _, group in ipairs(transparent_groups) do
	--local t	vim.api.nvim_set_hl(0, group, { bg = "none" })
	--local tend

end

ColorMyPencils()
