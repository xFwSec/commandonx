return {
	'neovim/nvim-lspconfig',
	dependencies = { 'saghen/blink.cmp' },

	-- example using `opts` for defining servers
	opts = {
		servers = {
			lua_ls = {}
		}
	},
	config = function(_, opts)
		local lspconfig = require('lspconfig')
		lspconfig.rust_analyzer.setup ({
			settings = {
				checkOnSave = {
					command = "clippy"
				},
				cargo = {
					allFeatures = true
				},
				completion = {
					autoimport = "enable"
				}
			}
		})
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
		vim.diagnostic.config({
			virtual_text = false,
			signs = false,
			update_in_insert = true,
			underline = true,
			severity_sort = false
		})
	end
}
