return {
  {
    'norcalli/nvim-colorizer.lua',
    enabled = false,
    config = function()
      require('colorizer').setup({})
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    enabled = true,
    config = function()
      local hc = require('nvim-highlight-colors')
      hc.setup({
        render = 'virtual',
        enable_named_colors = true,
        enable_tailwind = true,
        enable_hex = true,
        enable_rgb = true,
        enable_hsl = true,
        enable_hsla = true,
        enable_rgba = true,
      })

      vim.keymap.set('n', '<leader>co', function()
        hc.toggle()
      end, { desc = 'Toggle highlight colors' })
    end
  }
}
