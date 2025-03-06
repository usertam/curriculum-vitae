{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation {
  pname = "dm-mono";
  version = "2020-04-15";
  src = fetchzip {
    url = "https://github.com/googlefonts/dm-mono/archive/57fadabfb200a77de2812540026c249dc3013077.zip";
    hash = "sha256-Xj6UmvH7tqW6xdobBxuafqc7TB1nrTFwHWv4DaZmwx8=";
  };
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype
    install -Dt $out/share/fonts/truetype $src/exports/*.ttf
    runHook postInstall
  '';
  meta = with lib; {
    description = ''
      A three weight, three style family. Loosely based off of DM Sans,
      with a reduction in contrast and less geometric proportions.
    '';
    homepage = "https://github.com/googlefonts/dm-mono";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ usertam ];
  };
}
