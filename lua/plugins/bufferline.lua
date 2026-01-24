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
      vim.keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>", opts)
      vim.keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>", opts)
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", opts)
      vim.keymap.set("n", "<leader>Q", function()
        local current = vim.api.nvim_get_current_buf()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if buf ~= current and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            require("bufdelete").bufdelete(buf, false)
          end
        end
      end, { noremap = true, silent = true, desc = "Close all buffers except current" })
    end,
  },
}
