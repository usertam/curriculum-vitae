{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    forAllSystems = with nixpkgs.lib; genAttrs (import systems);
    forAllPkgs = pkgsWith: forAllSystems (system: pkgsWith nixpkgs.legacyPackages.${system});
  in {
    packages = forAllPkgs (pkgs: {
      fonts = {
        cormorant = pkgs.callPackage ./fonts/cormorant {};
        dm-mono = pkgs.callPackage ./fonts/dm-mono {};
        noto-fonts-symbols = pkgs.callPackage ./fonts/noto-fonts-symbols {};
      };
      default = let
        fonts = builtins.attrValues self.packages.${pkgs.system}.fonts;
      in pkgs.stdenv.mkDerivation (final: {
        name = "Curriculum Vitae";
        src = self;
        nativeBuildInputs = [ pkgs.typst ] ++ fonts;
        TYPST_FONT_PATHS = builtins.concatStringsSep ":" fonts;
        buildCommand = ''
          mkdir -p $out
          typst compile $src/main.typ \
            "$out/${final.name}.pdf"
        '';
      });
    });
  };
}
