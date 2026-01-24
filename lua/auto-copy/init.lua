local M = {}

-- Function to show toast notification
local function show_toast(message)
  -- Create a floating window for toast notification
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Set buffer content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { " " .. message .. " " })
  
  -- Calculate window size and position
  local width = #message + 2
  local height = 1
  local row = 1
  local col = vim.o.columns - width - 2
  
  -- Window options for toast
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    focusable = false,
  }
  
  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, false, opts)
  
  -- Set window highlight
  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:FloatBorder")
  
  -- Auto-close after 1.5 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    if vim.api.nvim_buf_is_valid(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end, 1500)
end

-- Function to copy visual selection to clipboard
local function copy_selection()
  -- Use the '< and '> marks which store the last visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  
  -- Check if we have a valid selection
  if start_pos[2] == 0 or end_pos[2] == 0 then
    return
  end
  
  -- Get the selected text
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines == 0 then
    return
  end
  
  -- Handle single line selection
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    -- Handle multi-line selection
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end
  
  local text = table.concat(lines, "\n")
  
  -- Only copy if there's actual text
  if text and text ~= "" then
    -- Copy to system clipboard
    vim.fn.setreg("+", text)
    
    -- Show toast notification
    show_toast("Copied to clipboard")
  end
end

-- Setup function
function M.setup()
  -- Create an autocommand group
  local autocmd_group = vim.api.nvim_create_augroup("AutoCopy", { clear = true })
  
  -- Detect mouse release in visual mode
  vim.keymap.set("v", "<LeftRelease>", function()
    -- Yank to clipboard register and exit visual mode
    -- The y command will yank the visual selection, then we exit
    vim.schedule(function()
      show_toast("Copied to clipboard")
    end)
    return '"+y'
  end, { expr = true, desc = "Auto-copy on mouse release" })
end

return M
