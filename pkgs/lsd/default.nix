{ pkgs ? import <nixpkgs> {}}:
pkgs.lsd.overrideDerivation (oldAttrs: {
  postInstall = oldAttrs.postInstall + ''
    echo "overriden"
    echo "000337"
  '';
})
