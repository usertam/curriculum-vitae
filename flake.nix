{
  description = "A flake for making usertam's curriculum vitae";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    forAllSystems = with nixpkgs.lib; genAttrs (import systems);
    forAllPkgs = pkgsWith: forAllSystems (system: pkgsWith nixpkgs.legacyPackages.${system});
  in {
    packages = forAllPkgs (pkgs: rec {
      fonts = {
        inherit (pkgs) mona-sans twitter-color-emoji;
        dm-mono = pkgs.callPackage ./fonts/dm-mono {};
      };
      default = pkgs.stdenvNoCC.mkDerivation (final: {
        pname = "curriculum-vitae";
        src = pkgs.lib.sourceFilesBySuffices self [ ".typ" ".svg" ];
        version = (self.shortRev or self.dirtyShortRev);

        nativeBuildInputs = with pkgs; [
          typst
          exiftool
          qpdf
        ] ++ builtins.attrValues fonts;

        enableParallelBuilding = true;

        TYPST_FONT_PATHS = "${fonts.mona-sans}/share/fonts/opentype"
          + ":${fonts.dm-mono}/share/fonts/truetype"
          + ":${fonts.twitter-color-emoji}/share/fonts/truetype";

        configurePhase = ''
          echo 'Building ${final.meta.repo} (${final.version}) with Typst ${pkgs.typst.version}'
          export SOURCE_DATE_EPOCH=${toString self.lastModified}
        '';

        buildPhase = ''
          echo "Build stage 1: compile typst source"
          typst compile --pdf-standard a-2b --input rev="${final.version}" \
            $src/main.typ build-stage-1.pdf

          echo "Build stage 2: make metadata with exiftool"
          exiftool \
            -{creator,creatortool,producer}='${final.meta.repo} (${final.version})' \
            -alldates="$(date -d "@$SOURCE_DATE_EPOCH" +'%Y-%m-%d %H:%M:%S')" \
            -verbose build-stage-1.pdf -o build-stage-2.pdf

          echo "Build stage 3: linearize with qpdf"
          qpdf --deterministic-id --linearize --newline-before-endstream --verbose \
            build-stage-2.pdf build-stage-3.pdf
        '';

        installPhase = ''
          install -Dm444 build-stage-3.pdf "$out/${final.pname}.pdf"
        '';

        meta = rec {
          homepage = "https://github.com/${repo}";
          repo = "usertam/${final.pname}";
        } // (with pkgs.lib; {
          platforms = platforms.all;
          maintainers = with maintainers; [ usertam ];
        });
      });
    });
  };
}
