return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close, -- Ferme Telescope avec ESC en mode insert
					},
				},
			},
			file_ignore_patterns = { "node_modules", ".git/" },
		})

		-- Keymaps pour lancer Telescope avec les différentes commandes
		vim.api.nvim_set_keymap(
			"n",
			"<leader><Space>",
			"<cmd>Telescope find_files<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", { noremap = true, silent = true })
	end,
}
