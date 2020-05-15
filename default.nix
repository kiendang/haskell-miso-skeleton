with (import (import ./pkgs-from-json.nix { json = ./miso.json; }) { });
let
  ghc = pkgs.haskell.packages.ghc865;
  ghcjs = pkgs.haskell.packages.ghcjs86;
in
  {
    dev = ghc.callCabal2nix "app" ./. { miso = miso-jsaddle; };
    release = ghcjs.callCabal2nix "app" ./. { };
    inherit pkgs ghc ghcjs;
  }
