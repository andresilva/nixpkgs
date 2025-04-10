{ callPackage }:
callPackage ./generic.nix { } rec {
  pname = "signal-desktop";
  version = "7.47.0";

  libdir = "opt/Signal";
  bindir = libdir;
  extractPkg = "dpkg-deb -x $downloadedFile $out";

  url = "https://updates.signal.org/desktop/apt/pool/s/signal-desktop/signal-desktop_${version}_amd64.deb";
  hash = "sha256-366/haawoLHhavJhWMGunik/YvxUYCZSRAfJ8e2wA54=";
}
