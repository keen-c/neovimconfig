return {
	-- Moteur d'autocomplétion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Source pour LSP
			"hrsh7th/cmp-buffer", -- Source pour les mots dans les buffers ouverts
			"hrsh7th/cmp-path", -- Source pour les chemins de fichiers
			"hrsh7th/cmp-cmdline", -- Source pour la ligne de commande Neovim
			"saadparwaiz1/cmp_luasnip", -- Source pour les snippets via LuaSnip
			"L3MON4D3/LuaSnip", -- Plugin de snippets
			"rafamadriz/friendly-snippets", -- Collection de snippets pré-définis
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Expander les snippets
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accepter la suggestion
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item() -- Naviguer vers la prochaine suggestion
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump() -- Passer au prochain placeholder du snippet
						else
							fallback() -- Si aucune suggestion ni placeholder, faire le comportement par défaut
						end
					end, { "i", "s" }), -- 'i' pour insertion, 's' pour sélection
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item() -- Naviguer vers la suggestion précédente
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1) -- Retourner au placeholder précédent du snippet
						else
							fallback() -- Comportement par défaut si rien à sauter
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Source LSP
					{ name = "luasnip" }, -- Source Snippets
				}, {
					{ name = "buffer" }, -- Source Buffer
					{ name = "path" }, -- Source Path
				}),
			})
		end,
	},
}
