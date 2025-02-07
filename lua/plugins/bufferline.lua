return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "neovim",
              highlight = "Directory",
              separator = true,
            },
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        },
      })
      vim.opt.termguicolors = true
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader><Tab>l", ":BufferLineCycleNext<CR>", opts)
      vim.keymap.set("n", "<leader><Tab>h", ":BufferLineCyclePrev<CR>", opts)
      -- vim.keymap.set("n", "<leader>Q", ":BufferLineCloseOthers<CR>", opts)
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", opts)
    end,
  },
}
