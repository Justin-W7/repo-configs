-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
-- This is also a good place to setup other settings (vim.opt)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ MAPPINGS AND VIM SETTINGS ]]
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {import = "plugins" },
  },

  -- Telescope
  { 'nvim-telescope/telescope.nvim',
  	event = 'VimEnter',
	branch = '0.1.x',
  	dependencies = {
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		-- 'cond' is a condition used to determine whether this plugin should be installed
		-- and loaded.
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	  },
	  { 'nvim-telescope/telescope-ui-selector.nvim' },
	},
	
	-- configure telescope
	config = function()
	require('telescope').setup {
		extensions = {
			['ui-select'] = {
				require('telescope.themes').get_dropdown(),
			},
		},
	}

	-- enable extensions if installed	
	pcall(require('telescope').load_extensions, 'fzf')
	pcall(require('telescope').load_extensions, 'ui-select')
	
	-- Key mappings for Telescope
	local builtin = require 'telescope.builtin'
	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<C-p>', builtin.git_files, {})
	vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
  },

  -- ToDo: LSP Plugins

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  install = { colorscheme = {'gruvbox' } },
  checker = { enabled = true },
})
