require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "help", "html", "http",
		"javascript", "json", "lua", "make", "markdown", "regex", "rust", "toml", "yaml", "tsx", "typescript", },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer"
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer"
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer"
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer"
			}
		}
	}
}
