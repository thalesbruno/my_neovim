return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
      vim.keymap.set(
        "n",
        "<leader>rr",
        "<cmd>Rest run<cr>",
        { noremap = true, silent = true, desc = "http run request" }
      )
      vim.keymap.set(
        "n",
        "<leader>rl",
        "<cmd>Rest logs<cr>",
        { noremap = true, silent = true, desc = "http request logs" }
      )
    end,
  },
}
