{ stdenv
, lib
, fetchFromGitHub
, meson
, ninja
, vala
, pkg-config
, desktop-file-utils
, glib
, gtk3
, libgee
, libsoup
, json-glib
, sqlite
, webkitgtk
, libmanette
, libXtst
, libxml2
, polkit
, glib-networking
, innoextract
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "GameHub";
  version = "0.16.0-1";

  src = fetchFromGitHub {
    owner = "tkashkin";
    repo = pname;
    rev = "${version}-master";
    sha256 = "sha256-QcpqGydNkmAPrPxp/52+D6MS1I7k+CKHxr3/tpCukP8=";
  };

  nativeBuildInputs = [
    meson
    ninja
    vala
    pkg-config
    desktop-file-utils
    wrapGAppsHook

  ];
  buildInputs = [
    glib
    gtk3
    libgee
    libsoup
    json-glib
    sqlite
    webkitgtk
    libmanette
    libXtst
    libxml2
    polkit
    glib-networking
    innoextract
  ];

  meta = with lib; {
    description = "All your games in one place";
    homepage = "https://tkashkin.tk/projects/gamehub/";
    mantainers = [ maintainers.pasqui23 ];
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
