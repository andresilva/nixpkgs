{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, gettext
, makeWrapper
, alsa-lib
, libjack2
, tk
, fftw
}:

stdenv.mkDerivation rec {
  pname = "pdnext";
  version = "0.52-2";

  src = fetchFromGitHub {
    owner = "sebshader";
    repo = "pdnext";
    rev = version;
    hash = "sha256-Bi7m/8rqGNtDGpsAD9X6PLe1JTDrKz9naSzfJ/KEERs=";
  };

  nativeBuildInputs = [ autoreconfHook gettext makeWrapper ];

  buildInputs = [ alsa-lib libjack2 fftw ];

  configureFlags = [
    "--enable-alsa"
    "--enable-jack"
    "--enable-fftw"
    "--disable-portaudio"
    "--disable-oss"
  ];

  postInstall = ''
    wrapProgram $out/bin/pd --prefix PATH : ${tk}/bin
  '';

  meta = with lib; {
    description = ''A real-time graphical programming environment for
                    audio, video, and graphical processing'';
    homepage = "https://github.com/sebshader/pdnext";
    license = licenses.bsd3;
    platforms = platforms.linux;
    maintainers = [ maintainers.andresilva ];
  };
}
