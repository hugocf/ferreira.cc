#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -euo pipefail

echo $(date)
export TZ="Europe/Lisbon"
echo $(date)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"/..

hugo --cleanDestinationDir --printPathWarnings --panicOnWarning
