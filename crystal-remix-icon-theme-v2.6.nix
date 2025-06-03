{ stdenv, fetchFromGitHub, gtk3 }:

stdenv.mkDerivation rec {
  name = "${package-name}-${version}";
  package-name = "crystal-remix-icon-theme";
  version = "2025-03-25";

  src = fetchFromGitHub {
    owner = "dangvd";
    repo = "crystal-remix-icon-theme";
    rev = "161b5cc89b92e7d7f5bcf37a9a93388af31d7118";
    sha256 = "zkildd0rmAv/vWSdT0iHnGNBIDyt+bT/SfYqIlzZ8tQ=";
  };

  nativeBuildInputs = [ gtk3 ];

  installPhase = ''
    mkdir -p $out/share/icons
    mv Crystal-Remix* $out/share/icons/
  '';

  postFixup = ''
    for theme in $out/share/icons/*; do
      gtk-update-icon-cache $theme
    done
  '';

  meta = with stdenv.lib; {
    description = "Crystal-remix is the default icon theme for Crystal-Dock.";
    homepage = http://www.softicons.com/system-icons/crystal-project-icons-by-everaldo-coelho;
    license = with licenses; [ lgpl ];
    platforms = platforms.all;
    maintainers = with maintainers; [ dangvd ];
  };
}
