#!/usr/bin/env bash

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAYOUTS_DEFAULT=theme-compare-default
LAYOUTS_SNIPPETS=theme-compare-snippets

cd "$SCRIPT_DIR"/.. || exit

# Check differences
diff -ur themes/PaperMod/layouts/ layouts/ | grep -v "Only in themes" > /tmp/$LAYOUTS_DEFAULT.diff
diff -u themes/PaperMod/layouts/_default/list.html layouts/snippets/list.html > /tmp/$LAYOUTS_SNIPPETS.diff

# Report changes
echo "diff $SCRIPT_DIR/$LAYOUTS_DEFAULT.approved /tmp/$LAYOUTS_DEFAULT.diff"
echo "? cp /tmp/$LAYOUTS_DEFAULT.diff $SCRIPT_DIR/$LAYOUTS_DEFAULT.approved"
diff --color=always "$SCRIPT_DIR"/$LAYOUTS_DEFAULT.approved /tmp/$LAYOUTS_DEFAULT.diff

echo

echo "diff $SCRIPT_DIR/$LAYOUTS_SNIPPETS.approved /tmp/$LAYOUTS_SNIPPETS.diff"
echo "? cp /tmp/$LAYOUTS_SNIPPETS.diff $SCRIPT_DIR/$LAYOUTS_SNIPPETS.approved"
diff --color=always "$SCRIPT_DIR"/$LAYOUTS_SNIPPETS.approved /tmp/$LAYOUTS_SNIPPETS.diff
