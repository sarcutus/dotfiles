{
  lib,
  stdenv,
  fetchurl,
  gitUpdater,
  appimageTools,
  appimage-run,
  makeWrapper
}:

let
  pname = "helium";
  version = "0.14.5.1";

  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    sha256 = "sha256:24ce139b82def5771fab77c5304bbf0c82baf35ec5120050dab4b0634f77174e";
  };

    appimageContents = appimageTools.extract {
      inherit pname version src;
    };

in

  stdenv.mkDerivation rec {
      inherit pname version;
      dontUnpack = true;
      dontBuild = true;

    nativeBuildInputs = [ makeWrapper ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      mkdir -p $out/share/applications
      mkdir -p $out/share/pixmaps
      
      cp ${appimageContents}/helium.desktop $out/share/applications
      cp ${appimageContents}/helium.png $out/share/pixmaps

      chmod +w $out/share/applications/helium.desktop

      substituteInPlace $out/share/applications/helium.desktop \
        --replace "Exec=helium" "Exec=$out/bin/helium"

      makeWrapper ${appimage-run}/bin/appimage-run $out/bin/helium \
        --add-flags "${src}"

      runHook postInstall
    '';
  
  # ...

    passthru.updateScript = gitUpdater {
    # Helium's tags look like "0.32.0.1" etc — no "v" prefix to strip, so
    # the default should just work. Set rev-prefix here if that's wrong.
    };

  meta = with lib; {
    description = "A privacy-focused, no nonsense web browser";
    homepage = "https://helium.computer";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}
