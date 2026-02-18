return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		'danilamihailov/beacon.nvim'
	},
	{
		'vidocqh/auto-indent.nvim'
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function ()
			require("ibl").setup()
		end
	}
}
