return {
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 
            'markdown_inline', 'query', 'vim', 'vimdoc', 'java', 
            'go', 'python' },
        },
    }
}
