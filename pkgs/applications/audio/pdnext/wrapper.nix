{ symlinkJoin, pdnext, makeWrapper, plugins }:

let
  pdnextFlags = map (x: "-path ${x}/") plugins;
in
symlinkJoin {
  name = "pdnext-with-plugins-${pdnext.version}";

  paths = [ pdnext ] ++ plugins;

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    wrapProgram $out/bin/pd \
      --add-flags "${toString pdnextFlags}"
  '';
}
