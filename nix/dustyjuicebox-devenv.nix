{ pkgs
, dustyjuiceboxVim }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {

  name = "dustyjuicebox-devenv";
  paths = with pkgs; [
    bash
    bashCompletion
    bashInteractive

    wget
    curl
    unzip
    zip
    ack

    dustyjuiceboxVim

    nix-repl
    nix-prefetch-scripts

    gitAndTools.gitFull
    gitAndTools.tig

    keybase
    (pidgin.override { plugins = [ pidginotr ]; })
  ];
}

