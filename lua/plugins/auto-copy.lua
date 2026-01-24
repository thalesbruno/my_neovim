return {
  "auto-copy",
  dir = vim.fn.stdpath("config") .. "/lua/auto-copy",
  config = function()
    require("auto-copy").setup()
  end,
}
