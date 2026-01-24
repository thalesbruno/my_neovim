return {
  {
    "buffer-navigator",
    dir = vim.fn.stdpath("config") .. "/lua/plugins",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>b", desc = "Open buffer navigator" },
    },
    config = function()
      local Menu = require("nui.menu")
      local event = require("nui.utils.autocmd").event

      -- Helper: Check if buffer is special/hidden
      local function is_special_buffer(bufnr)
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

        -- Filter criteria
        if buftype == "terminal" then
          return true
        end
        if buftype == "help" then
          return true
        end
        if not vim.api.nvim_buf_get_option(bufnr, "buflisted") then
          return true
        end

        -- Plugin-specific filetypes
        local special_filetypes = {
          "neo-tree",
          "Trouble",
          "dap-repl",
          "dapui_watches",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
          "dapui_console",
          "TelescopePrompt",
          "qf",
        }

        for _, ft in ipairs(special_filetypes) do
          if filetype == ft then
            return true
          end
        end

        return false
      end

      -- Helper: Get filtered buffer list with metadata
      local function get_buffers()
        local buffers = {}
        local buf_list = vim.api.nvim_list_bufs()

        for _, bufnr in ipairs(buf_list) do
          if vim.api.nvim_buf_is_valid(bufnr) and not is_special_buffer(bufnr) then
            local buf_info = vim.fn.getbufinfo(bufnr)[1]

            table.insert(buffers, {
              bufnr = bufnr,
              name = vim.api.nvim_buf_get_name(bufnr),
              lastused = buf_info.lastused,
              is_modified = vim.api.nvim_buf_get_option(bufnr, "modified"),
              is_current = bufnr == vim.api.nvim_get_current_buf(),
            })
          end
        end

        -- Sort by lastused (MRU - Most Recently Used)
        table.sort(buffers, function(a, b)
          return a.lastused > b.lastused
        end)

        return buffers
      end

      -- Helper: Detect duplicate filenames
      local function detect_duplicates(buffers)
        local name_count = {}
        local duplicates = {}

        -- Count occurrences
        for _, buf in ipairs(buffers) do
          if buf.name ~= "" then
            local basename = vim.fn.fnamemodify(buf.name, ":t")
            name_count[basename] = (name_count[basename] or 0) + 1
          end
        end

        -- Mark duplicates
        for _, buf in ipairs(buffers) do
          if buf.name ~= "" then
            local basename = vim.fn.fnamemodify(buf.name, ":t")
            if name_count[basename] > 1 then
              duplicates[buf.bufnr] = true
            end
          end
        end

        return duplicates
      end

      -- Helper: Format buffer entry for display
      local function format_buffer_entry(buf_info, is_duplicate)
        local display_name

        if buf_info.name == "" then
          display_name = "[No Name]"
        elseif is_duplicate then
          display_name = vim.fn.fnamemodify(buf_info.name, ":.")
        else
          display_name = vim.fn.fnamemodify(buf_info.name, ":t")
        end

        -- Add indicators
        local prefix = buf_info.is_current and "> " or "  "
        local suffix = buf_info.is_modified and " [+]" or ""

        local text = prefix .. display_name .. suffix

        return Menu.item(text, { bufnr = buf_info.bufnr })
      end

      -- Helper: Build menu items
      local function build_menu_items()
        local buffers = get_buffers()
        local duplicates = detect_duplicates(buffers)
        local items = {}

        for _, buf_info in ipairs(buffers) do
          local is_duplicate = duplicates[buf_info.bufnr] or false
          table.insert(items, format_buffer_entry(buf_info, is_duplicate))
        end

        return items
      end

      -- Main: Show buffer navigator
      local function show_buffer_navigator()
        local items = build_menu_items()

        if #items == 0 then
          vim.notify("No buffers to display", vim.log.levels.INFO)
          return
        end

        local menu = Menu({
          position = "50%",
          size = {
            width = 60,
            height = math.min(#items, 15),
          },
          border = {
            style = "rounded",
            text = {
              top = " Open tabs ",
              top_align = "center",
              bottom = " d: close tab | v: vertical split ",
              bottom_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        }, {
          lines = items,
          max_width = 60,
          keymap = {
            focus_next = { "j", "<Down>", "<Tab>" },
            focus_prev = { "k", "<Up>", "<S-Tab>" },
            close = { "<Esc>", "q" },
            submit = { "<CR>" },
          },
          on_submit = function(item)
            vim.api.nvim_set_current_buf(item.bufnr)
          end,
        })

        -- Custom keymap for delete buffer
        menu:map("n", "d", function()
          local state = menu.tree:get_node()
          local bufnr = state.bufnr

          if vim.api.nvim_buf_get_option(bufnr, "modified") then
            vim.notify("Buffer has unsaved changes. Save first or use :bd! " .. bufnr, vim.log.levels.WARN)
            return
          end

          -- Delete buffer
          vim.api.nvim_buf_delete(bufnr, { force = false })

          -- Refresh menu or close if no buffers left
          menu:unmount()
          vim.schedule(show_buffer_navigator)
        end, { noremap = true })

        -- Custom keymap for vertical split
        menu:map("n", "v", function()
          local state = menu.tree:get_node()
          local bufnr = state.bufnr

          menu:unmount()
          vim.cmd("vsplit")
          vim.api.nvim_set_current_buf(bufnr)
        end, { noremap = true })

        menu:mount()

        -- Auto-close on buffer leave
        menu:on(event.BufLeave, function()
          menu:unmount()
        end)
      end

      -- Set up keybinding
      vim.keymap.set("n", "<leader>b", show_buffer_navigator, {
        desc = "Buffer navigator - switch between open buffers",
      })
    end,
  },
}
