return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({})
			vim.api.nvim_set_keymap("n", "<leader>b", ":Neotree toggle<CR>", { noremap = true, silent = true })
		end,
	},
}
