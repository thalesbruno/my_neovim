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
      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
      -- TODO: add rename action
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end
  }
}
