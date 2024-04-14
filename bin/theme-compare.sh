#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"/.. || exit

# Check differences
diff -ur themes/PaperMod/layouts/ layouts/ | grep -v "Only in themes" > /tmp/theme-compare-default.diff
diff -u themes/PaperMod/layouts/_default/list.html layouts/snippets/list.html > /tmp/theme-compare-snippets.diff

# Report changes
echo "diff $SCRIPT_DIR/theme-compare-default.approved /tmp/theme-compare-default.diff"
diff --color=always "$SCRIPT_DIR"/theme-compare-default.approved /tmp/theme-compare-default.diff

echo "diff $SCRIPT_DIR/theme-compare-snippets.approved /tmp/theme-compare-snippets.diff"
diff --color=always "$SCRIPT_DIR"/theme-compare-snippets.approved /tmp/theme-compare-snippets.diff
