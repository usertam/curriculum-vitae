{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    forAllSystems = with nixpkgs.lib; genAttrs (import systems);
    forAllPkgs = pkgsWith: forAllSystems (system: pkgsWith nixpkgs.legacyPackages.${system});
  in {
    packages = forAllPkgs (pkgs: {
      default = pkgs.stdenv.mkDerivation rec {
        name = "resume";
        src = self;
        nativeBuildInputs = [
          pkgs.typst
          pkgs.texlivePackages.cormorantgaramond.tex
          pkgs.noto-fonts
          (pkgs.stdenv.mkDerivation rec {
            pname = "dm-mono";
            version = "57fadab";
            src = pkgs.fetchzip {
              url = "https://github.com/googlefonts/dm-mono/archive/${version}.zip";
              hash = "sha256-Xj6UmvH7tqW6xdobBxuafqc7TB1nrTFwHWv4DaZmwx8=";
            };
            installPhase = ''
              runHook preInstall
              mkdir -p $out/share/fonts/truetype
              install -Dt $out/share/fonts/truetype $src/exports/*.ttf
              runHook postInstall
            '';
          })
        ];
        buildCommand = ''
          export TYPST_FONT_PATHS=${builtins.foldl' (x: y: x + ":" + y) src nativeBuildInputs}
          mkdir -p $out
          typst compile $src/main.typ \
            $out/Résumé.pdf
        '';
      };
    });
  };
}
