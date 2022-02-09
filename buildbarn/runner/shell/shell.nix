{ pkgs ? import ./default.nix {}}:

with pkgs;

mkShell {
  buildInputs = [
    busybox
    (writeShellScriptBin "nix-build" ''
    SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt ${nix}/bin/nix-build "$@"
    '')
    nix
  ];
}
