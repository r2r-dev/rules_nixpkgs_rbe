{ pkgs ? import ./default.nix {}}:

with pkgs;

mkShell {
  buildInputs = [
    bazel_5
    busybox
    docker-compose
    openssh
    (writeShellScriptBin "nix-build" ''
    SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt ${nix}/bin/nix-build "$@"
    '')
    nix
  ];
}
