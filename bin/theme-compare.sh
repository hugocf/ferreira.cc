#!/usr/bin/env bash

#;
# theme-compare.sh
# Verify if the lines I’ve tweaked changed in the vendored version
#"

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAYOUTS_DEFAULT=theme-compare-default
LAYOUTS_SNIPPETS=theme-compare-snippets
LAYOUTS_NOTICE=theme-compare-notice

cd "$SCRIPT_DIR"/.. || exit

# Check differences
diff --unified=0 --recursive _vendor/github.com/adityatelange/hugo-PaperMod/layouts/ layouts/ | grep -v "Only in _vendor" > /tmp/$LAYOUTS_DEFAULT.diff
diff --unified=0 _vendor/github.com/adityatelange/hugo-PaperMod/layouts/_default/list.html layouts/snippets/list.html > /tmp/$LAYOUTS_SNIPPETS.diff
diff --unified=0 _vendor/github.com/martignoni/hugo-notice/layouts/shortcodes/notice.html layouts/shortcodes/notice.html > /tmp/$LAYOUTS_NOTICE.diff

# Report changes
echo "diff $SCRIPT_DIR/$LAYOUTS_DEFAULT.approved /tmp/$LAYOUTS_DEFAULT.diff"
echo "? cp /tmp/$LAYOUTS_DEFAULT.diff $SCRIPT_DIR/$LAYOUTS_DEFAULT.approved"
diff --color=always "$SCRIPT_DIR"/$LAYOUTS_DEFAULT.approved /tmp/$LAYOUTS_DEFAULT.diff

echo

echo "diff $SCRIPT_DIR/$LAYOUTS_SNIPPETS.approved /tmp/$LAYOUTS_SNIPPETS.diff"
echo "? cp /tmp/$LAYOUTS_SNIPPETS.diff $SCRIPT_DIR/$LAYOUTS_SNIPPETS.approved"
diff --color=always "$SCRIPT_DIR"/$LAYOUTS_SNIPPETS.approved /tmp/$LAYOUTS_SNIPPETS.diff

echo

echo "diff $SCRIPT_DIR/$LAYOUTS_NOTICE.approved /tmp/$LAYOUTS_NOTICE.diff"
echo "? cp /tmp/$LAYOUTS_NOTICE.diff $SCRIPT_DIR/$LAYOUTS_NOTICE.approved"
diff --color=always "$SCRIPT_DIR"/$LAYOUTS_NOTICE.approved /tmp/$LAYOUTS_NOTICE.diff
