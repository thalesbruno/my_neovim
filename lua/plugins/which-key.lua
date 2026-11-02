return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>m", group = "Markdown" },
      { "<leader>r", group = "Rename / HTTP" },
      { "<leader>u", group = "Theme" },
      { "<leader>w", group = "Window" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>z", group = "Quote lines" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Which-key: buffer local keymaps",
    },
  },
}
