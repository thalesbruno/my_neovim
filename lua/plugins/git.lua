return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", opts)
      vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", opts)
      vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", opts)
    end
  }
}
