{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  jdupes,
}: let
  pname = "crystal-remix-icon-theme";
  version = "2.6";
in
  stdenvNoCC.mkDerivation {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "dangvd";
      repo = "crystal-remix-icon-theme";
      rev = "v${version}";
      hash = "sha256-t7ATjba9hS4LwWCaD9fvHi1xMjoYEML9buiki3tEcSQ=";
    };

    nativeBuildInputs = [
      jdupes
    ];

    dontPatchELF = true;
    dontRewriteSymlinks = true;
    dontDropIconThemeCache = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icons/crystal-remix
      cp -a * $out/share/icons/crystal-remix/
      jdupes --quiet --link-soft --recurse $out/share

      runHook postInstall
    '';

    meta = with lib; {
      description = "A Crystal icon theme for modern Linux desktop environments";
      homepage = "https://github.com/dangvd/crystal-remix-icon-theme";
      platforms = platforms.linux;
      license = licenses.gpl3Only;
      maintainers = [];
    };
  }
