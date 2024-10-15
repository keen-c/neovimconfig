return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"cmake",
					"dockerls",
					"dotls",
					"html",
					"cssls",
					"biome",
					"marksman",
					"tailwindcss",
					"ts_ls",
					"templ",
					"htmx",
					"ocamllsp", -- Ajout du serveur LSP pour OCaml
					"sqlls",
				},
			})
		end,
	},
}
