{ callPackage, replaceEmojis }:
callPackage ./generic.nix { inherit replaceEmojis; } rec {
  pname = "signal-desktop";
  dir = "Signal";
  version = "7.38.0";
  url = "https://updates.signal.org/desktop/apt/pool/s/signal-desktop/signal-desktop_${version}_amd64.deb";
  hash = "sha256-C5wzKhJcH2FJQJk5u2FGBrGDbezHBIIIUMkkVV6T8S4=";
  hash-original-emojis = "sha256-h/viW4FVzMzEPOEgSxop255+yoMwFNe9VFMCTRhRBe8=";
}
