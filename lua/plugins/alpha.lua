return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local button = dashboard.button

    dashboard.section.header.val = {
      [[                                                      ]],
      [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
      [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
      [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
      [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
      [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
      [[  by @thalesbruno                                     ]],
    }

    dashboard.section.buttons.val = {
      button("SPC e", "  Open file explorer"),
      button("e", "  New file", "<cmd>ene <CR>"),
      button("SPC f f", "󰈞  Find file"),
      button("SPC f h", "󰊄  Recently opened files"),
      button("SPC f r", "  Frecency/MRU"),
      button("SPC f g", "󰈬  Find word"),
      -- button("SPC f m", "  Jump to bookmarks"),
      -- button("SPC s l", "  Open last session"),
    }

    alpha.setup(dashboard.opts)
  end,
}
