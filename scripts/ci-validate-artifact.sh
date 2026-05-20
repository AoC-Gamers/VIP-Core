#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ARTIFACT_DIR="${SOURCEMOD_ARTIFACT_DIR:-$ROOT_DIR/dist/sourcemod/artifact}"

if [[ ! -d "$ARTIFACT_DIR" ]]; then
  echo "SourceMod artifact directory not found at $ARTIFACT_DIR" >&2
  exit 1
fi

python3 - "$ROOT_DIR" "$ARTIFACT_DIR" <<'PY'
import os
import sys

root_dir, artifact_dir = sys.argv[1], sys.argv[2]

expected = [
    os.path.join(artifact_dir, "addons", "sourcemod", "plugins", "VIP_Core.smx"),
    os.path.join(artifact_dir, "addons", "sourcemod", "scripting", "VIP_Core.sp"),
    os.path.join(artifact_dir, "addons", "sourcemod", "translations", "vip_core.phrases.txt"),
    os.path.join(artifact_dir, "README.md"),
    os.path.join(artifact_dir, "LICENSE"),
    os.path.join(artifact_dir, "compile.log"),
]

for path in expected:
    if not os.path.exists(path):
        raise SystemExit(f"Missing artifact entry: {path}")

print("ARTIFACT_VALIDATION_OK")
PY
