{
  json,
}:
let
  info = builtins.fromJSON (builtins.readFile json);
in
  builtins.fetchGit {
    inherit (info) url rev;
  }
