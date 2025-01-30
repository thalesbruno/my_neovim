return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({ size = 25 })

    vim.keymap.set(
      "n",
      "<leader>t",
      ":ToggleTerm<CR>",
      { desc = "ToggleTerm toggle terminal (with a number first it opens new instances eg 2<toggle>)" }
    )
  end,
}
