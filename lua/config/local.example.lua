-- Copy to lua/config/local.lua (gitignored) for settings that only make sense
-- on one machine. It is loaded before everything else, so vim.g values set
-- here are visible to the plugin configs.

-- Run an external command when switching theme with <leader>ut/ud/ul, so the
-- terminal/OS can follow. "%s" is replaced by "latte" or "mocha".
-- vim.g.theme_switch_cmd = { "fish", "-c", "theme %s" }
