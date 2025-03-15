return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { "/Users/thalesbruno/codes/javascript/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to javascript Node app",
        address = "localhost",
        port = 9229,
        cwd = "${workspaceFolder}",
        restart = true,
      },
    }

    dap.configurations.typescript = dap.configurations.javascript
    -- dap.configurations.typescript = {
    --   {
    --     type = "pwa-node",
    --     request = "attach",
    --     name = "Attach to typescript Node app",
    --     address = "localhost",
    --     port = 9229,
    --     cwd = "${workspaceFolder}",
    --     restart = true,
    --   },
    -- }

    -- Also support TypeScript
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
    vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "DAP step over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "DAP step out" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP terminate" })
  end,
}
