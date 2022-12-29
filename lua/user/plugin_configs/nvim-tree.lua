vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	renderer = {
		highlight_opened_files = '1',
		group_empty = true,
		icons = {
			show = {
				folder_arrow = false,
			},
		},
		indent_markers = {
			enable = true,
			-- inline_arrows = false,
		},
	},
})

vim.cmd([[
  highlight NvimTreeIndentMarker guifg=#30323E
  augroup NvimTreeHighlights
    autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#30323E
  augroup end
]])
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
