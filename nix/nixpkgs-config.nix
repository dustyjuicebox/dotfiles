{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  nixDotfiles = "${homeDir}/.dotfiles/nix";

  otfVim = callPackage "${nixDotfiles}/dustyjuicebox-vim.nix" { inherit pkgs; };
  otfDevenv = callPackage "${nixDotfiles}/dustyjuicebox-devenv.nix" { dustyjuiceboxVim=otfVim; inherit pkgs; };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    dustyjuiceboxDevenv = otfDevenv;
  };

  pidgin = {
    openssl = true;
    gnutls = true;
  };
}

