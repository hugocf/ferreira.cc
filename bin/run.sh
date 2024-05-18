#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"/..

(sleep 1 && open http://localhost:1313) &
hugo --cleanDestinationDir --buildDrafts --buildExpired --buildFuture server
