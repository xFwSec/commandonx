{
	description = "CommandoNx, a NIX flake to build and rebuild for red team operations";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
		pkgs = import nixpkgs { system = "x86_64-linux"; };
		nixosConfigurations.commandonx = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {inherit inputs;};
			modules = [	  
				./modules/configuration.nix
				/etc/nixos/hardware-configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = {
						inherit inputs;
					};
					home-manager.users = {
						xfow = import ./home-manager/home.nix;
					};
				}
			];
		};
	};
}
