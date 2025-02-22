return {
  {
    "MunifTanjim/nui.nvim",
    config = function()
      local Input = require("nui.input")
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
            -- winblend = 10, -- Transparent background for the popup window
            winhighlight = "Normal:Normal,FloatBorder:Normal",
          },
        }
      end

      -- New file prompt
      vim.keymap.set("n", "<leader>fe", function()
        local new_file_input = Input(create_input_style("Enter file name"), {
          prompt = "> ",
          on_submit = function(value)
            if value and value ~= "" then
              vim.cmd("e " .. value)
            else
              print("Invalid file name!")
            end
          end,
        })

        new_file_input:map("n", "<Esc>", function()
          new_file_input:unmount()
        end)
        new_file_input:map("i", "<Esc>", function()
          new_file_input:unmount()
        end)

        new_file_input:mount()
      end, { desc = "Nui Open new file with prompt" })
    end,
  },
}
