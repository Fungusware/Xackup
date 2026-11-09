#!/usr/bin/env bash
# Installs or upgrades Xackup Server: downloads the newest Xackup Server release from GitHub and runs its installer.
#
#   curl -fsSL https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.sh | sudo bash
#   curl -fsSL https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.sh | sudo bash -s -- --port 8080 --local-only
#
# It asks about the settings (answers are read from the terminal). Anything after "--" goes to the installer (--yes asks nothing;
# the package's README.txt lists the options). Needs systemd, and curl or wget. To install one particular version, set
# XACKUP_SERVER_VERSION first, for example: sudo XACKUP_SERVER_VERSION=3.26.1031.0750 bash install.sh

set -euo pipefail

REPO=Fungusware/Xackup

[ "$(uname -s)" = Linux ] || { echo "Error: this installs the Linux Xackup Server. For Windows, use install.ps1 (see the Xackup releases page)." >&2; exit 1; }
[ "$(id -u)" -eq 0 ] || { echo "Error: run this as root: curl -fsSL <address of install.sh> | sudo bash" >&2; exit 1; }

case "$(uname -m)" in
  x86_64|amd64)  ARCH=x64 ;;
  aarch64|arm64) ARCH=arm64 ;;
  *) echo "Error: Xackup Server runs on 64-bit Intel/AMD and 64-bit ARM, not $(uname -m)." >&2; exit 1 ;;
esac

fail_download() {
  echo "Error: could not download from GitHub with curl or wget on this machine (an old TLS library is the usual cause)." >&2
  echo "Download $ASSET from https://github.com/$REPO/releases on another computer, copy it here, then run:" >&2
  echo "  tar -xzf $ASSET && sudo ./install-xackup-server.sh" >&2
  exit 1
}

fetch() {   # fetch URL -> stdout. Tries curl, then wget: an old curl (for example NSS based) may not share a cipher with GitHub
  local out
  if command -v curl >/dev/null 2>&1 && out=$(curl -fsSL -H 'Accept: application/vnd.github+json' "$1" 2>/dev/null); then printf '%s\n' "$out"; return 0; fi
  if command -v wget >/dev/null 2>&1 && wget -qO- "$1"; then return 0; fi
  return 1
}

download() {   # download URL FILE
  if command -v curl >/dev/null 2>&1 && curl -fL# -o "$2" "$1"; then return 0; fi
  # old wget (CentOS 7 has 1.14) does not know --show-progress, so try it first and then fall back to a plain download
  if command -v wget >/dev/null 2>&1; then
    wget -q --show-progress -O "$2" "$1" 2>/dev/null && return 0
    wget -nv -O "$2" "$1" && return 0
  fi
  return 1
}

ASSET="Xackup-Server-linux-$ARCH.tar.gz"

if [ -n "${XACKUP_SERVER_VERSION:-}" ]; then
  URL="https://github.com/$REPO/releases/download/$XACKUP_SERVER_VERSION/$ASSET"
else
  # Xackup Server releases are the ones tagged 3.*; the list is newest first, so the first package found is the newest
  RELEASES=$(fetch "https://api.github.com/repos/$REPO/releases?per_page=30") || fail_download
  URL=$(printf '%s\n' "$RELEASES" | grep -o "https://github.com/$REPO/releases/download/3\.[0-9.]*/$ASSET" | head -n1 || true)
  [ -n "$URL" ] || { echo "Error: no Xackup Server release with $ASSET was found at https://github.com/$REPO/releases" >&2; exit 1; }
fi

DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT

echo "Downloading $URL"
download "$URL" "$DIR/package.tar.gz" || fail_download

tar -xzf "$DIR/package.tar.gz" -C "$DIR"
bash "$DIR/install-xackup-server.sh" "$@"
