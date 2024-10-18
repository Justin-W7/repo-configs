local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
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
-- vim.opt.colorcolumn = "80"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },

    install = { colorscheme = { "colors" } },
    checker = { enabled = true },
})

-- Setup Mason
require("mason").setup({
    { import = "plugins.mason" },
})
--[[require("mason-lspconfig").setup({
	ensure_installed = {},

}) ]]
