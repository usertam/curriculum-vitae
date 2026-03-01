{
  description = "A flake for building curriculum vitae";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    forAllSystems = with nixpkgs.lib; genAttrs (import systems);
    forAllPkgs = pkgsWith: forAllSystems (system: pkgsWith nixpkgs.legacyPackages.${system});
  in {
    packages = forAllPkgs (pkgs: {
      default = pkgs.stdenvNoCC.mkDerivation (final: {
        pname = "curriculum-vitae";
        src = pkgs.lib.sourceFilesBySuffices self [ ".typ" ".svg" ];
        version = (self.shortRev or self.dirtyShortRev);

        passthru.repo = "usertam/" + final.pname;

        nativeBuildInputs = with pkgs; [
          typst
          exiftool
          qpdf
        ] ++ final.passthru.fonts;

        passthru.fonts = with pkgs; [
          dm-mono
          mona-sans
          twitter-color-emoji
        ];

        env.TYPST_FONT_PATHS =
          builtins.concatStringsSep ":" (
            builtins.concatMap (p: [
              "${p}/share/fonts/opentype"
              "${p}/share/fonts/truetype"
            ]) final.passthru.fonts
          );

        configurePhase = ''
          echo "Building ${final.passthru.repo} (${final.version}) with $(typst --version)"
          export SOURCE_DATE_EPOCH=${toString self.lastModified}
        '';

        buildPhase = ''
          echo "Build stage 1: compile typst source"
          typst compile --pdf-standard a-2b --input rev="${final.version}" \
            $src/main.typ build-stage-1.pdf

          echo "Build stage 2: make metadata with exiftool"
          exiftool \
            -{creator,creatortool,producer}='${final.passthru.repo} (${final.version})' \
            -alldates="$(date -d "@$SOURCE_DATE_EPOCH" +'%Y-%m-%d %H:%M:%S')" \
            -verbose build-stage-1.pdf -o build-stage-2.pdf

          echo "Build stage 3: linearize with qpdf"
          qpdf --deterministic-id --linearize --newline-before-endstream --verbose \
            build-stage-2.pdf build-stage-3.pdf
        '';

        installPhase = ''
          install -Dm444 build-stage-3.pdf "$out/${final.pname}.pdf"
        '';

        meta = {
          homepage = "https://github.com/${final.passthru.repo}";
          platforms = pkgs.lib.platforms.all;
          maintainers = with pkgs.lib.maintainers; [ usertam ];
        };
      });
    });
  };
}
