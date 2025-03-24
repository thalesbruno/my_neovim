return {
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
}

