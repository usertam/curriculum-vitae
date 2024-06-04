{ lib
, stdenv
, fetchgit
}:

stdenv.mkDerivation (final: {
  pname = "cormorant";
  version = "3.609";
  src = fetchgit {
    url = "https://github.com/CatharsisFonts/Cormorant.git";
    rev = "v${final.version}";
    hash = "sha256-W63N1d4NWh7JMHbdQKAjYpzcnMDSz6qkiajLRWYXVzo=";
  };
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/opentype $out/share/fonts/truetype
    install -Dt $out/share/fonts/truetype $src/"1. TrueType Font Files"/*.ttf
    install -Dt $out/share/fonts/opentype $src/"2. OpenType Files"/*.otf
    runHook postInstall
  '';
  meta = {
    description = "A free display type family, inspired by Garamont";
    homepage = "https://github.com/CatharsisFonts/Cormorant";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = lib.singleton {
      email = "heiyiutam@gmail.com";
      github = "usertam";
      githubId = 22500027;
      name = "usertam";
    };
  };
})
