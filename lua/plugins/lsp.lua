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
        ensure_installed = { "lua_ls", "ts_ls", "graphql", "jsonls", "zls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      local Input = require("nui.input")

      -- Configure lua_ls
      vim.lsp.config['lua_ls'] = {}
      vim.lsp.enable('lua_ls')
      
      -- Configure ts_ls for TypeScript/JavaScript files
      vim.lsp.config['ts_ls'] = {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      }
      vim.lsp.enable('ts_ls')
      
      -- Configure GraphQL only for .graphql files
      vim.lsp.config['graphql'] = {
        filetypes = { "graphql" },
      }
      vim.lsp.enable('graphql')
      
      -- Configure jsonls
      vim.lsp.config['jsonls'] = {}
      vim.lsp.enable('jsonls')
      
      -- Configure zls
      vim.lsp.config['zls'] = {
        cmd = { vim.fn.expand("~/Codes/zig/zls/zig-out/bin/zls") },
      }
      vim.lsp.enable('zls')
      
      -- Configure biome to not conflict with ts_ls
      vim.lsp.config['biome'] = {
        -- filetypes = { "json", "jsonc" },
        handlers = {
          ["textDocument/hover"] = function() end,
        },
      }
      vim.lsp.enable('biome')
      
      -- Configure eslint to not provide hover info (diagnostic only)
      -- vim.lsp.config['eslint'] = {
      --   handlers = {
      --     ["textDocument/hover"] = function() end,
      --   },
      -- }
      -- vim.lsp.enable('eslint')

      local create_input_style = function(title)
        return {
          position = "30%",
          size = {
            width = 40,
          },
          border = {
            style = "single",
            text = {
              top = "[" .. title .. "]",
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
          },
        }
      end

      vim.keymap.set(
        "n",
        "<leader>i",
        function()
          vim.lsp.buf.hover({ border = "rounded" })
        end,
        { desc = "LSP: Displays hover information about the symbol under the cursor" }
      )

      vim.keymap.set("n", "<leader>r", function()
        -- Get the current word under cursor as default value
        local current_name = vim.fn.expand("<cword>")

        local rename_input = Input(create_input_style("Rename Symbol"), {
          prompt = "> ",
          default_value = current_name,
          on_submit = function(value)
            if value and value ~= "" and value ~= current_name then
              vim.lsp.buf.rename(value)
            elseif value == current_name then
              print("No changes made")
            else
              print("Invalid name!")
            end
          end,
        })

        rename_input:map("n", "<Esc>", function()
          rename_input:unmount()
        end)
        rename_input:map("i", "<Esc>", function()
          rename_input:unmount()
        end)

        rename_input:mount()
      end, { desc = "LSP: renames all references to the symbol under the cursor with NUI prompt" })

      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: code action" })
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP: diagnostic on float window" })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
