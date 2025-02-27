return {
  {
    "MunifTanjim/nui.nvim",
    config = function()
      local Input = require("nui.input")
      local Menu = require("nui.menu")
      local event = require("nui.utils.autocmd").event

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

      -- Quit prompt
      vim.keymap.set("n", "<leader>Q", function()
        local menu = Menu({
          position = "50%",
          size = {
            width = 30,
            height = 3,
          },
          border = {
            style = "rounded",
            text = {
              top = "Quit Options",
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        }, {
          lines = {
            Menu.item("Cancel"),
            Menu.item("Save and Quit"),
            Menu.item("Discard and Quit"),
          },
          max_width = 30,
          keymap = {
            focus_next = { "j", "<Down>" },
            focus_prev = { "k", "<Up>" },
            close = { "<Esc>" },
            submit = { "<CR>" },
          },
          on_submit = function(item)
            if item.text == "Save and Quit" then
              vim.cmd("wqa") -- Save all and quit
            elseif item.text == "Discard and Quit" then
              vim.cmd("qa!") -- Force quit, discard changes
            end
          end,
        })

        menu:mount()
        menu:on(event.BufLeave, function()
          menu:unmount()
        end)
      end, { desc = "Nui Quit Options Menu" })
    end,
  },
}
