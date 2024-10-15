-- Retourne la table qui contient la configuration du plugin lspconfig
return {
	-- Spécifie le plugin à utiliser
	"neovim/nvim-lspconfig",

	-- Ajoute une dépendance pour compléter automatiquement LSP avec nvim-cmp
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	-- La fonction de configuration du plugin
	config = function()
		-- Définir la fonction on_attach qui sera appelée quand le serveur LSP est attaché à un buffer
		local on_attach = function(client, bufnr)
			-- Fonction pour définir les mappages de touches dans un buffer spécifique
			local buf_set_keymap = function(mode, lhs, rhs, opts)
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			-- Configurer omnifunc pour l'autocomplétion LSP dans le buffer actuel
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Options par défaut pour les mappages de touches (noremap et silent)
			local opts = { noremap = true, silent = true }

			-- Définir les mappages de touches LSP
			buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Affiche la documentation
			buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Aller à la définition
			buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Actions de code (comme renommer, etc.)
			buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Affiche l'aide pour la signature de fonction
			buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Renommer la variable sous le curseur
			buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- Trouver les références de la variable/fonction sous le curseur
		end

		-- Charger les capacités de l'autocomplétion LSP
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Charger le module lspconfig pour configurer les serveurs LSP
		local lspconfig = require("lspconfig")

		local servers = { "ts_ls", "lua_ls", "htmx", "gopls", "ocamllsp", "tailwindcss", "cssls", "sqlls" }

		-- Boucle pour configurer chaque serveur LSP
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach, -- Attacher les keymaps après que le serveur LSP soit attaché
			})
		end

		-- Configuration spécifique pour le serveur OCaml LSP
		lspconfig.ocamllsp.setup({
			cmd = { "/Users/alexandredesir/.opam/default/bin/ocamllsp" }, -- Chemin vers l'exécutable ocamllsp
			capabilities = capabilities, -- Intègre les capacités d'autocomplétion avec cmp
			on_attach = on_attach, -- Attache les configurations définies ci-dessus à ce serveur LSP
			root_dir = function(fname)
				return lspconfig.util.root_pattern("dune-project", ".git")(fname) or lspconfig.util.path.dirname(fname)
			end,
		})
	end,
}
