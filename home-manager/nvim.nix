{ pkgs,... }:
{
    programs.nixvim = {
	    enable = true;
	    opts = {
	     number = true;
	     relativenumber = false;
	     fillchars = {eob = " ";};
	    };

	    colorschemes.nord = {
		enable = true;
		# settings = {
		#     background = "hard";
		# };
	    };
	    
	    plugins = {
		lualine = {
		   enable = true;
		   settings.options = {
			theme = "auto";
			sectionSeperators = "";
			componentSeperators = "";
		   };
		};
		neo-tree = {
		   enable = true;
		};
		noice = {
		   enable = true;
		};
		lsplines = {
		   enable = true;
		};
		blink-cmp = {
		   enable = true;
		   setupLspCapabilities = true;
		   settings = {
			keymap = {
				preset = "super-tab";
			};
			appearance = {
				nerd_font_variant = "mono";
			};
			completion = {documentation = {auto_show = false;};};
			sources = {
				default = [
					"lsp"
					"path"
					"snippets"
					"buffer"
				];
			};
			fuzzy = {implementation = "prefer_rust_with_warning";};
		   };
		};
		treesitter = {
		    enable = true;
		    highlight.enable = true;
		    folding.enable = true;
		};
		lsp = {
		    enable = true;
		    servers = {
			tsserver.enable = true;
			gopls.enable = true;
			nil.enable = true;
		    };
		};
		luasnip.enable = true;
		rustaceanvim.enable = true;
		trouble.enable = true;
		telescope.enable = true;
		nvim-autopairs.enable = true;
		indent-blankline.enable = true;
		beacon.enable = true;
		todo-comments.enable = true;
		symbols-outline.enable = true;
	    };
    };
}
