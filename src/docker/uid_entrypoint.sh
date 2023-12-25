#!/bin/bash
set -e

if ! whoami &>/dev/null; then
  # Create arbitrary user at run-time
  echo "${USER}:x:$(id -u):0:::${HOME}:/sbin/nologin" >>/etc/passwd
  # Allow to log without password
  echo "${USER}:!:18000::::::" >>/etc/shadow
fi

# Local config for BuildKit
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export BUILDKIT_HOST=unix:///run/user/$(id -u)/buildkit/buildkitd.sock

exec "$@"
