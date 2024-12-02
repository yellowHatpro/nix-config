{
  description = "nixos config flake ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {

	inherit system;
	config = {
	  allowUnfree = true;
	};
    };
  in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs system;};
      modules = [
        ./hosts/default/configuration.nix
         inputs.home-manager.nixosModules.default
	 {
	 services = {
            xserver.enable = false;
	    dbus.enable = true;
 	    xserver.displayManager.gdm.enable = true;
	 };
	 environment.variables = {
	    MOZ_ENABLE_WAYLAND = "1";
	    QT_QPA_PLATFORM = "wayland";
	    XDG_SESSION_TYPE = "wayland";
	 };
	 }
      ];
    };
  };
}
