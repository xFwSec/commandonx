{ pkgs, inputs, config, poetry2nix, ... }:
{
	programs.fish.enable = true;
	home.username = "xfow";
	home.homeDirectory = "/home/xfow";
	home.stateVersion = "26.05";

	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./nvim.nix
	];

	programs.kitty = {
		enable = true;
		extraConfig = builtins.readFile ../configs/kitty/kitty.conf;
	};
	home.packages = [
		(pkgs.python3.withPackages (
		ppkgs: [
		ppkgs.impacket
		ppkgs.certipy
		ppkgs.bloodyad
		ppkgs.pypykatz
		ppkgs.scapy
		]
		))
	];
# programs.certipy.enable = true;

	xdg.enable = true;
	programs.fish.shellInit = builtins.readFile ../configs/fish/config.fish;
	xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml" = {
		force = true;
		source = ../configs/xfce/desktop.xml;
	};
	xdg.configFile."xfce4/wallpaper.jpeg" = {
		force = true;
		source = ../configs/xfce/wallpaper.jpeg;
	};
}
