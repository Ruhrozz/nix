# https://wiki.nixos.org/wiki/Flakes#NixOS_configuration_with_flakes

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-25.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    ruhrozz-nixvim.url = "github:Ruhrozz/nixvim";
    ruhrozz-nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }@inputs:
    let
      username = "ruhrozz";
      hostname = "${username}-laptop";
    in {
      # NixOS profiles (local)
      nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username hostname; };
        modules = [
          ./configuration.nix
          ./gui/home.nix
          ./stylix/nixos-module.nix
          inputs.stylix.nixosModules.stylix
        ];
      };

      # Home-manager profiles (remote)
      homeConfigurations.${username} =
        inputs.home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs username; };
          modules = [ ./home.nix inputs.stylix.homeModules.stylix ];
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        };
    };
}
