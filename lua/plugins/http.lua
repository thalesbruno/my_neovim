-- rest.nvim normally installs its dependencies through luarocks, but that build
-- fails on fresh machines (the tree-sitter-http rock no longer builds). luarocks
-- is disabled in lua/config/lazy.lua and the dependencies come from git instead.
-- The http parser is installed by nvim-treesitter (lua/plugins/treesitter.lua).

-- xml2lua and mimetypes keep their modules at the repo root, not under lua/,
-- so lazy cannot put them on the runtimepath; add them to package.path.
local function add_root_to_path(name)
  local root = vim.fn.stdpath("data") .. "/lazy/" .. name
  package.path = package.path .. ";" .. root .. "/?.lua;" .. root .. "/?/init.lua"
end

return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    { "j-hui/fidget.nvim", opts = {} },
    { "manoelcampos/xml2lua", lazy = true },
    { "lunarmodules/lua-mimetypes", lazy = true },
  },
  init = function()
    add_root_to_path("xml2lua")
    add_root_to_path("lua-mimetypes")
  end,
  keys = {
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "http run request" },
    { "<leader>rl", "<cmd>Rest logs<cr>", desc = "http request logs" },
  },
  ft = "http",
}
