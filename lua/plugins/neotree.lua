return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup({
        source_selector = {
          winbar = true
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false
          }
        }
      })
      -- keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>E', '<C-w>h', opts)
      vim.keymap.set('n', '<leader>B', '<C-w>l', opts)
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', opts)
    end
  },
}
