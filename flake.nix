
{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-citizen.url = "github:LovingMelody/nix-citizen";
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pob.url = "github:ciiol/path-of-building-flake";

  };

  outputs = { self, nixpkgs, stable , ... }@inputs: {
   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs;
        pkgs-stable = import stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
