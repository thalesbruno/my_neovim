return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "zls", "graphql", "jsonls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})

      -- keymaps
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "LSP: displaysunder the cursor" })
      vim.keymap.set(
        "n",
        "<leader>r",
        vim.lsp.buf.rename,
        { desc = "LSP: renames all references to the symbol under the cursor" }
      )
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: code action" })
    end,
  },
}
