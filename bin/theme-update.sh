#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"/.. || exit

git submodule update --remote --merge

# Check differences
diff -ur themes/PaperMod/layouts/ layouts/ | grep -v "Only in themes" > /tmp/theme-update-default.diff
diff -u themes/PaperMod/layouts/_default/list.html layouts/snippets/list.html > /tmp/theme-update-snippets.diff

# Report changes
echo "Default overrides"
diff "$SCRIPT_DIR"/theme-update-default.approved /tmp/theme-update-default.diff
echo "Snippets list"
diff "$SCRIPT_DIR"/theme-update-snippets.approved /tmp/theme-update-snippets.diff
