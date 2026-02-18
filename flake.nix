{
  description = "CommandoNx, a NIX flake to build and rebuild for red team operations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.commandonx = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [	  
	  ./modules/configuration.nix
	  /etc/nixos/hardware-configuration.nix
	  home-manager.nixosModules.home-manager
	  {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.users = {
			xfow = import ./home-manager/home.nix;
		};
	  }
	];
    };
  };
}
