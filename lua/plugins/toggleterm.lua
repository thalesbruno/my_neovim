return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({ size = vim.o.columns * 0.25, direction = "vertical" })

    vim.keymap.set(
      "n",
      "<leader>t",
      ":ToggleTerm<CR>",
      { desc = "ToggleTerm toggle terminal (with a number first it opens new instances eg 2<toggle>)" }
    )
  end,
}
