-- Catppuccin with an easy dark (mocha) / light (latte) switch.
-- The chosen flavour is remembered between sessions.
local state_file = vim.fn.stdpath("data") .. "/catppuccin-flavour"

local function read_flavour()
	local ok, lines = pcall(vim.fn.readfile, state_file)
	local flavour = ok and lines and lines[1] or nil
	if flavour == "latte" or flavour == "mocha" then
		return flavour
	end
	return "mocha"
end

-- Cursor colours, chosen to match a catppuccin-themed terminal.
-- Latte's stock rosewater cursor only reaches 2.3:1 against the background,
-- which is unreadable in sunlight, so light mode uses mauve instead.
local cursor = {
	latte = { bg = "#8839ef", fg = "#eff1f5" },
	mocha = { bg = "#f5e0dc", fg = "#1e1e2e" },
}

local function apply(flavour, notify)
	vim.o.background = (flavour == "latte") and "light" or "dark"
	vim.cmd.colorscheme("catppuccin-" .. flavour)
	-- Must come after the colorscheme: loading one clears highlight overrides.
	vim.api.nvim_set_hl(0, "Cursor", cursor[flavour])
	vim.api.nvim_set_hl(0, "lCursor", cursor[flavour])
	pcall(vim.fn.writefile, { flavour }, state_file)
	if notify then
		vim.notify("Catppuccin " .. flavour, vim.log.levels.INFO)
	end
end

local function current_flavour()
	return (vim.g.colors_name or ""):match("^catppuccin%-(%a+)$") or read_flavour()
end

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			background = { light = "latte", dark = "mocha" },
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				neotree = true,
				treesitter = true,
				telescope = { enabled = true },
				native_lsp = { enabled = true },
			},
		})

		apply(read_flavour())

		-- Optional system-wide hook: set vim.g.theme_switch_cmd in lua/config/local.lua
		-- (see local.example.lua) to a command list, where "%s" is replaced by the
		-- flavour. When unset or failing, only nvim switches.
		local function switch(mode)
			local target = mode
			if mode == "toggle" then
				target = current_flavour() == "mocha" and "latte" or "mocha"
			end
			local hook = vim.g.theme_switch_cmd
			if type(hook) == "table" and #hook > 0 and vim.fn.executable(hook[1]) == 1 then
				local cmd = vim.tbl_map(function(part)
					return (part:gsub("%%s", target))
				end, hook)
				vim.system(cmd, { text = true }, function(res)
					if res.code ~= 0 then
						vim.schedule(function()
							apply(target, true)
						end)
					end
				end)
			else
				apply(target, true)
			end
		end

		vim.keymap.set("n", "<leader>ut", function()
			switch("toggle")
		end, { desc = "Theme toggle light/dark" })

		vim.keymap.set("n", "<leader>ud", function()
			switch("mocha")
		end, { desc = "Theme dark (catppuccin mocha)" })

		vim.keymap.set("n", "<leader>ul", function()
			switch("latte")
		end, { desc = "Theme light (catppuccin latte)" })

		vim.api.nvim_create_user_command("Theme", function(opts)
			local arg = opts.args
			if arg == "" or arg == "toggle" then
				apply(current_flavour() == "mocha" and "latte" or "mocha", true)
			elseif arg == "light" or arg == "latte" then
				apply("latte", true)
			elseif arg == "dark" or arg == "mocha" then
				apply("mocha", true)
			else
				vim.notify("Theme: use light|dark|toggle", vim.log.levels.ERROR)
			end
		end, {
			nargs = "?",
			complete = function()
				return { "light", "dark", "toggle" }
			end,
			desc = "Switch between catppuccin latte (light) and mocha (dark)",
		})
	end,
}
