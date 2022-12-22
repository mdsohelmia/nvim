require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork",  "help", "html", "http", "javascript", "json", "lua", "make", "markdown", "regex", "rust", "toml", "vim", "yaml"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
