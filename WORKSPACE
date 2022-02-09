workspace(name = "com_github_r2r_dev_rules_tar")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "360c1e6cd9f88d5f9a91d585f056e2fcf3c982d275c93a5d395c6cf3efcc43f3",
    strip_prefix = "rules_nixpkgs-35ce6e2fd73e2c60fa5ec289fc40a95777b207d8",
    urls = ["https://github.com/r2r-dev/rules_nixpkgs/archive/35ce6e2fd73e2c60fa5ec289fc40a95777b207d8.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_local_repository", "nixpkgs_git_repository", "nixpkgs_package") 

nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file = "//:default.nix",
    nix_file_deps = ["//:nixpkgs.json"],
)

nixpkgs_git_repository(
    name = "nixpkgs_remote",
    revision = "21.11",
    sha256 = "c77bb41cf5dd82f4718fa789d49363f512bb6fa6bc25f8d60902fe2d698ed7cc",
)

nixpkgs_package(
    name = "lsd_local",
    nix_file = "//pkgs/lsd:default.nix",
    repositories = { "nixpkgs": "@nixpkgs//:default.nix" },
)

nixpkgs_package(
    name = "lsd",
    repositories = { "nixpkgs": "@nixpkgs_remote//:default.nix" },
)
