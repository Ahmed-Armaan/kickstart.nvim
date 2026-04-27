local function camel_to_snake(name)
	return name
	    :gsub("(%l)(%u)", "%1_%2")
	    :lower()
end

local function get_name(line)
	return line:match("^%s*([A-Z][%w]*)")
end

local function is_struct_open(line)
	return line:match("struct%s*{")
end

local function is_struct_close(line)
	return line:match("^%s*}")
end

local function tagging(lines, i)
	while i <= #lines do
		local line = lines[i]

		if is_struct_close(line) then
			return i
		end

		local name = get_name(line)

		if name then
			if is_struct_open(line) then
				local closing = tagging(lines, i + 1)

				if not lines[closing]:find("`") then
					local tag = camel_to_snake(name)
					lines[closing] =
					    lines[closing] .. string.format(' `json:"%s"`', tag)
				end

				i = closing + 1
			elseif not line:find("`") then
				local tag = camel_to_snake(name)
				lines[i] =
				    line .. string.format(' `json:"%s"`', tag)
				i = i + 1
			else
				i = i + 1
			end
		else
			i = i + 1
		end
	end

	return i
end

vim.keymap.set("x", "tt", function()
	local buf        = vim.api.nvim_get_current_buf()

	local start_line = vim.fn.getpos("'<")[2] - 1
	local end_line   = vim.fn.getpos("'>")[2]

	local lines      =
	    vim.api.nvim_buf_get_lines(buf, start_line, end_line, false)

	tagging(lines, 1)

	vim.api.nvim_buf_set_lines(buf, start_line, end_line, false, lines)
end, { desc = "Add JSON tags to Go structs" })
