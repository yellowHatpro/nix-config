{config, pkgs, ...}:

{
    xdg.configFile."hypr/hyprland.conf".text = ''
        # Monitor
        monitor=eDP-1,1920x1080@60,0x0,1

        # Autostart
        exec-once=waybar
        exec-once=kitty

        # Input config
        input {
            kb_layout=us
        }

        # Decoration
        decoration {
            rounding=5
        }

        # Keybinds
        $mainMod = SUPER

        bind = $mainMod, SPACE, exec, rofi -show drun
        bind = $mainMod, B, exec, firefox-developer-edition
    '';
}
