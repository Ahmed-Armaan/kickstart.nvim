return {
	--{
	--	"tiagovla/tokyodark.nvim",
	--	opts = {
	--		-- custom options here
	--	},
	--	config = function(_, opts)
	--		require("tokyodark").setup(opts) -- calling setup is optional
	--		vim.cmd [[colorscheme tokyodark]]
	--	end,
	--},
	{
		"vague-theme/vague.nvim",
  		lazy = false, -- make sure we load this during startup if it is your main colorscheme
  		priority = 1000, -- make sure to load this before all the other plugins
  		config = function()
  		  -- NOTE: you do not need to call setup if you don't want to.
  		  require("vague").setup({
  		    -- optional configuration here
  		  })
  		  vim.cmd("colorscheme vague")
  		end
     },
}
