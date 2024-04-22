#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"/.. || exit

hugo mod get -u github.com/adityatelange/hugo-PaperMod
hugo mod vendor

"$SCRIPT_DIR"/theme-compare.sh
