return {
    --[[kanagawa
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },]]
    --[[ gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},]]
    --[[ lackluster
    {
        "slugbyte/lackluster.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("lackluster-mint")
            -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
            -- vim.cmd.colorscheme("lackluster-mint")
        end,
    },]]

    --[[Base16 Black Metal
	{
		"metalelf0/base16-black-metal-scheme",
		priotiry = 1000,
		init = function()
			vim.cmd.colorscheme("base16-black-metal")
		end,
	},]]

    -- vague 2k
    {
        "vague2k/vague.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("vague")
        end,
    },

    --[[ gruvsquirrel
	{
		"mikesmithgh/gruvsquirrel.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("gruvsquirrel")
		end,
	},]]

    --[[ kanagawa-paper
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("kanagawa-paper")
		end,
	},]]
}
