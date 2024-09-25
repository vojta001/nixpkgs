{ stdenv, lib, qtbase, wrapQtAppsHook, libvlc, boost, fetchFromGitHub, cmake, qtwebsockets, qt5compat, }:

stdenv.mkDerivation rec {
  pname = "casparcg-client";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "CasparCG";
    repo = "client";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-Hf+L3PZl7W9kEUZ4a9HDTpwoD4i8oLrxFfMhc2f5nqs=";
  };

  preConfigure = "cd src";

  buildInputs = [ qtbase libvlc boost qtwebsockets qt5compat ];
  nativeBuildInputs = [ wrapQtAppsHook cmake ];

  meta = with lib; {
    description = "A client to control CasparCG server used to play out professional graphics, audio and video to multiple outputs";
    homepage = "https://casparcg.com";
    license = lib.licenses.gpl3;
    maintainers = [ maintainers.vojta001 ];
  };
}
