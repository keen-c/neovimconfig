return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			-- Définir les formateurs par type de fichier
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "sql-formatter" },
				c = { "clang-format" },
				templ = { "templ" },
				html = { "htmlbeautifier" },
				tmpl = { "htmlbeautifier", "prettierd" },
				javascript = { "prettierd", "prettier", "biome" },
				typescript = { "prettierd", "prettier", "biome" },
				-- go = { "gofmt", "gofumpt", "goimports", "goimports-reviser", "golines" },
				go = { "gofmt" },
				ocaml = { "ocamlformat" }, -- Ajout du formateur pour OCaml
			},

			-- Configuration pour le formatage automatique lors de l'enregistrement
			format_on_save = {
				timeout_ms = 500, -- Timeout pour le formatage
				lsp_fallback = true, -- Utilise LSP pour le formatage si aucun formateur n'est trouvé
			},
		})

		-- Créer un autocmd pour formater automatiquement les fichiers avant l'enregistrement
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
