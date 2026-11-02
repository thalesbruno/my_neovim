return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		---@module "render-markdown"
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "Avante" },
			heading = {
				icons = { "󰎤  ", "󰎧  ", "󰎪  ", "󰎭  ", "󰎱  ", "󰎳  " },
				width = "block",
				left_pad = 1,
				right_pad = 1,
				min_width = 30,
				border = { true, false, false, false, false, false },
			},
			code = {
				border = "thin",
				width = "block",
				left_pad = 1,
				right_pad = 1,
				min_width = 45,
				language_left = "",
				language_right = "",
			},
			bullet = {
				icons = { "●", "○", "◆", "◇" },
				left_pad = 1,
				right_pad = 1,
			},
			checkbox = {
				unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
				checked = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
				custom = {
					progress = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
				},
			},
			pipe_table = {
				preset = "round",
				cell = "trimmed",
			},
			quote = {
				icon = "▎",
				repeat_linebreak = true,
			},
			dash = {
				icon = "─",
				width = 0.8,
				left_margin = 0.1,
			},
			win_options = {
				showbreak = { default = vim.o.showbreak, rendered = "  " },
				breakindent = { default = vim.o.breakindent, rendered = true },
				breakindentopt = { default = vim.o.breakindentopt, rendered = "" },
			},
		},
		ft = { "markdown", "Avante" },
		keys = {
			{ "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown toggle inline rendering" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- downloads a prebuilt binary, so no node/yarn is needed
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			-- Keep one preview tab and update it as Markdown buffers change.
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_combine_preview = 1
			vim.g.mkdp_combine_preview_auto_refresh = 1
			vim.g.mkdp_page_title = "${name} · Markdown"
			vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/assets/markdown-preview.css"
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "relative",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 0,
				toc = {},
			}
		end,
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown toggle browser preview" },
		},
	},
}
