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
          # Force truetype fonts for now
          (f: f + "/share/fonts/truetype")
          (builtins.attrValues fonts));

        buildPhase = ''
          echo "Build stage 1: compile typst source"
          typst compile $src/main.typ build-stage-1.pdf

          echo "Build stage 2: convert to PDF/A-2b with ghostscript"
          gs -o build-stage-2.pdf \
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
            -f build-stage-1.pdf

          echo "Build stage 3: remove specific metadata with exiftool"
          exiftool -producer= -documentid= -verbose build-stage-2.pdf -o build-stage-3.pdf

          echo "Build stage 4: linearize with qpdf"
          qpdf --deterministic-id --linearize --newline-before-endstream --verbose \
            build-stage-3.pdf build-stage-4.pdf
        '';

        installPhase = ''
          install -Dm444 build-stage-4.pdf "$out/${final.name}.pdf"
        '';
      });
    });
  };
}
