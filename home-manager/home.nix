{ pkgs, ... }:
{
	programs.fish.enable = true;
	home.username = "xfow";
	home.homeDirectory = "/home/xfow";
	home.stateVersion = "26.05";

	imports = [
		./nvim.nix
	];
	
	programs.kitty = {
		enable = true;
		extraConfig = builtins.readFile ../configs/kitty/kitty.conf;
	};


	home.activation.installTools = ''
	  #! /bin/bash
	  export PATH=$HOME/.cargo/bin:/run/current-system/sw/bin:$HOME/.local/bin:$PATH
	  for pkg in certipy-ad git+https://github.com/Pennyw0rth/NetExec impacket git+https://github.com/CravateRouge/bloodyAD; do
	    if ! pipx list | grep -q $pkg ; then
	      pipx install $pkg
	    fi
	   done
	   '';

        xdg.enable = true;
        programs.fish.shellInit = builtins.readFile ../configs/fish/config.fish;
	xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" = {
	force = true;
	text = ''
	    <?xml version="1.0" encoding="UTF-8"?>

	    <channel name="xfce4-keyboard-shortcuts" version="1.0">
	      <property name="commands" type="empty">
		<property name="custom" type="empty">
		  <property name="<Alt>Return" type="string" value="kitty"/>
		  <property name="<Alt>r" type="string" value="rofi -show drun -show-icons"/>
		  <property name="<Alt>w" type="string" value="firefox"/>
		</property>
	      </property>
	    </channel>
  '';};
      xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml" = {
	force = true;
	source = ../configs/xfce/desktop.xml;
      };
      xdg.configFile."xfce4/wallpaper.jpeg" = {
	force = true;
	source = ../configs/xfce/wallpaper.jpeg;
      };
}
