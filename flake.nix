{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    forAllSystems = with nixpkgs.lib; genAttrs (import systems);
    forAllPkgs = pkgsWith: forAllSystems (system: pkgsWith nixpkgs.legacyPackages.${system});
  in {
    packages = forAllPkgs (pkgs: rec {
      fonts = {
        cormorant = pkgs.callPackage ./fonts/cormorant {};
        dm-mono = pkgs.callPackage ./fonts/dm-mono {};
      };
      default = pkgs.stdenvNoCC.mkDerivation (final: {
        name = "Curriculum Vitae";
        src = self;
        nativeBuildInputs = with pkgs; [
          typst
          ghostscript
          exiftool
          qpdf
        ] ++ builtins.attrValues fonts;
        enableParallelBuilding = true;
        TYPST_FONT_PATHS = builtins.concatStringsSep ":" (map
          (f: f + "/share/fonts/truetype")
          (builtins.attrValues fonts));
        buildPhase = ''
          mkdir -p $out
          typst compile $src/main.typ \
            "$out/${final.name}.pdf"
        '';
        installPhase = ''
          gs -o a.pdf \
            -dBATCH -dNOPAUSE -dNOOUTERSAVE \
            -dPDFA=2 \
            -sColorConversionStrategy=UseDeviceIndependentColor \
            -dPDFSETTINGS=/prepress \
            -dPDFACompatibilityPolicy=2 \
            -sDEVICE=pdfwrite \
            -sDocumentUUID=00000000-0000-0000-0000-000000000000 \
            -sInstanceUUID=00000000-0000-0000-0000-000000000000 \
            -dOmitInfoDate=true -dOmitID=true \
            -dNumRenderingThreads=$NIX_BUILD_CORES \
            -f "$out/${final.name}.pdf"
          exiftool -producer= -documentid= -overwrite_original a.pdf
          qpdf --deterministic-id --linearize --newline-before-endstream \
            a.pdf "$out/${final.name} (A-2b).pdf"
        '';
      });
    });
  };
}
