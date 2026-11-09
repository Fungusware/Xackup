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

fetch() {   # fetch URL -> stdout
  if command -v curl >/dev/null 2>&1; then curl -fsSL -H 'Accept: application/vnd.github+json' "$1"
  elif command -v wget >/dev/null 2>&1; then wget -qO- "$1"
  else echo "Error: neither curl nor wget is installed." >&2; exit 1; fi
}

ASSET="Xackup-Server-linux-$ARCH.tar.gz"

if [ -n "${XACKUP_SERVER_VERSION:-}" ]; then
  URL="https://github.com/$REPO/releases/download/$XACKUP_SERVER_VERSION/$ASSET"
else
  # Xackup Server releases are the ones tagged 3.*; the list is newest first, so the first package found is the newest
  URL=$(fetch "https://api.github.com/repos/$REPO/releases?per_page=30" \
        | grep -o "https://github.com/$REPO/releases/download/3\.[0-9.]*/$ASSET" | head -n1 || true)
  [ -n "$URL" ] || { echo "Error: no Xackup Server release with $ASSET was found at https://github.com/$REPO/releases" >&2; exit 1; }
fi

DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT

echo "Downloading $URL"
if command -v curl >/dev/null 2>&1; then curl -fL# -o "$DIR/package.tar.gz" "$URL"
else wget -q --show-progress -O "$DIR/package.tar.gz" "$URL"; fi

tar -xzf "$DIR/package.tar.gz" -C "$DIR"
bash "$DIR/install-xackup-server.sh" "$@"
