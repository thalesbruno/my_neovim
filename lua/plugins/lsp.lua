return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls' }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})

      -- keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, opts)
      -- vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end
  }
}
