with (import ./default.nix);
let
  ghcid = ghc.ghcid;

  cabal-install = ghc.cabal-install;

  reload-script = pkgs.writeScriptBin "reload" ''
    ${ghcid}/bin/ghcid -c \
      '${cabal-install}/bin/cabal new-repl' \
      -T ':main'
  '';
in dev.env.overrideAttrs (old: {
  buildInputs = old.buildInputs ++ [
    reload-script
    ghcid
    cabal-install
  ];
})
