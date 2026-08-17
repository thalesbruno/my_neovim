return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        theme = 'auto' -- follows the active colorscheme (catppuccin mocha/latte)
      },
    })
  end
}
