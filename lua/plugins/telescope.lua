return {

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				-- 'cond' is a condition used to determine whether this plugin should be installed
				-- and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		-- Telescope ui selector
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- configure telescope
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- enable extensions if installed
			pcall(require("telescope").load_extensions, "fzf")
			pcall(require("telescope").load_extensions, "ui-select")

			-- Key mappings for Telescope
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
		end,
	},
}
