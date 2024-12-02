{ config, lib, pkgs, ... }:

{
  # Enable rofi
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    
    # Basic configuration
    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Papirus";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };
    
    # Theme configuration
    theme = "default";
  };
} 