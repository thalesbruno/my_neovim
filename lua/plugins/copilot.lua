return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      local copilot = require("copilot")
      copilot.setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>", -- Set <Tab> to accept suggestions
          },
        },
      })

      vim.keymap.set("i", "<Tab>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        else
          return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
        end
      end, { expr = true, desc = "Accept Copilot suggestion or fallback to default <Tab>" })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them

    config = function()
      local chat = require("CopilotChat")
      chat.setup({
        window = {
          width = 0.4
        }
      })
      vim.opt.splitright = true
      vim.keymap.set('n', '<leader>coo', function() chat.open() end, { desc = "copilot chat: open" })
      vim.keymap.set('n', '<leader>coc', function() chat.close() end, { desc = "copilot chat: close" })
      vim.keymap.set('n', '<leader>cot', function() chat.toggle() end, { desc = "copilot chat: toggle" })
    end
  }
}
