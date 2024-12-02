{config, pkgs, ...}:

{
    xdg.configFile."waybar/config".text = ''
    {
        "layer": "top",
        "height": 30,
        "modules-left": ["network", "cpu", "memory"],
        "modules-center": ["clock"],
        "modules-right": ["battery", "temperature"],
        "clock": {
            "format": "{:%H:%M:%S}"
        },
        "network": {
            "format-wifi": "{essid} ({signalStrength}%) ",
            "format-ethernet": "{ipaddr}/{cidr} ",
            "tooltip-format": "{ifname}"
        },
        "cpu": {
            "format": "{usage}% ",
            "tooltip": false
        },
        "memory": {
            "format": "{}% "
        },
        "temperature": {
            "format": "{temperatureC}°C "
        },
        "battery": {
            "format": "{capacity}% {icon}",
            "format-icons": ["", "", "", "", ""]
        }
    }
    '';

    xdg.configFile."waybar/style.css".text = ''
        * {
            border: none;
            border-radius: 0;
            font-family: "JetBrains Mono";
            font-size: 13px;
            min-height: 0;
        }

        window#waybar {
            background: #1e1e2e;
            color: #cdd6f4;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network {
            padding: 0 10px;
            margin: 0 5px;
            color: #cdd6f4;
        }
    '';
}
