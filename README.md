This project serves as an example of how `rules_nixpkgs` with `--experimental_repo_remote_exec`, and Remote Asset Api could be leveraged to achieve RBE in Nix+Bazel set-ups.

## Quickstart
1. Enter nix shell:
```
# Term1@repository_root
nix-shell
```
2. Create Bazel outputRoot directory:
```
# Term1@repository_root
bazel version
```
3. Open a separate terminal window, and enter nix shell again:
```
# Term2@repository_root
nix-shell
```
4. Head to `buildbarn` directory
5. Generate ssh keys for remote execution runner, and append them to your authorized keys file:
```
# Term2@repository_root/buildbarn
ssh-keygen -t rsa -b 4096 -C "runner@buildbarn" -f runner/ssh/id_rsa
cat runner/ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
6. Start buildbarn stack:
```
# Term2@repository_root/buildbarn
./run.sh
```
7. Open Buildbarn Scheduler UI by heading to http://localhost:7982/ in a web browser
8. Wait for Buildbarn stack to finish setting up. Once it's done you should see 8 idle workers in Buildbarn Scheduler UI.
Note: this page does not refresh by itself.
9. Head back to first terminal window and execute build commands:
```
# Term1@repository_root
bazel build \
  --experimental_repo_remote_exec \
  --remote_executor=grpc://localhost:8980 \
  --remote_instance_name="" \
  --repo_env=CLIENT_NAME=$USER \
  --repo_env=CLIENT_HOST=172.17.0.1 \
  --curses=no \
  @lsd_local//:bin/lsd \
  @lsd//:bin/lsd
```
10. Observe execution in both terminal windows and in Buildbarn Scheduler UI
