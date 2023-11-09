require'nvim-treesitter.configs'.setup {
	ensure_installed = { "rust", "go", "c", "yaml", "gitignore", "lua", "cmake", "cpp", "gomod", "gosum", "gowork", "html", "css", "json", "json5", "nasm", "bash", "fortran" },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
