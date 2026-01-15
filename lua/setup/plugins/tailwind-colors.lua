return {
  "themaxmarchuk/tailwindcss-colors.nvim",
  config = function()
    require("tailwindcss-colors").setup({
      -- Optional: You can override the default options here
      -- For example:
      -- color_square_width = 2,
    })
  end
}
