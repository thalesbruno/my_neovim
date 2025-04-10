return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    'hrsh7th/nvim-cmp', -- Completion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completions
      'hrsh7th/cmp-buffer',   -- Buffer completions
      'hrsh7th/cmp-path',     -- Path completions
      'hrsh7th/cmp-cmdline'   -- Command-line completions
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(_)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(), -- Next item
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),    -- Scroll up in documentation
          ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Scroll down in documentation
          ['<C-Space>'] = cmp.mapping.complete(),     -- Trigger completion
          ['<C-e>'] = cmp.mapping.abort(),            -- Close completion menu
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm selection
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP completions
          { name = 'buffer' },   -- Buffer completions
          { name = 'path' },     -- File path completions
          { name = 'render-markdown' }, -- Markdown completions
        })
      })
    end
  }
}
