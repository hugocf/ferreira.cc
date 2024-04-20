#!/usr/bin/env bash

#;
# theme-compare.sh
# Verify if the lines I’ve tweaked changed in the vendored version
#"

# https://medium.com/factualopinions/consider-starting-all-your-bash-scripts-with-these-options-74fbec0cbb83
set -u

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME=${0##*/}

compare() {
    local base_file=${SCRIPT_NAME%.*}-$1
    local original=$2
    local changed=$3

    check_differences "$base_file" "$original" "$changed"
    report_changes "$base_file"
}

check_differences() {
    local base_file=$1
    local original=$2
    local changed=$3

    if [ -d "$original" ]; then
        diff --unified=0 --recursive "$original" "$changed" | grep -v "Only in"> /tmp/"$base_file".diff
    else
        diff --unified=0 "$original" "$changed" > /tmp/"$base_file".diff
    fi
}

report_changes() {
    local base_file=$1

    echo "diff $SCRIPT_DIR/$base_file.approved /tmp/$base_file.diff"
    echo "cp /tmp/$base_file.diff $SCRIPT_DIR/$base_file.approved"
    diff --color=always "$SCRIPT_DIR"/"$base_file".approved /tmp/"$base_file".diff
    echo
}

cd "$SCRIPT_DIR"/.. || exit

compare papermod-default  _vendor/github.com/adityatelange/hugo-PaperMod/layouts/                   layouts/
compare papermod-snippets _vendor/github.com/adityatelange/hugo-PaperMod/layouts/_default/list.html layouts/snippets/list.html
compare notice-shortcode  _vendor/github.com/martignoni/hugo-notice/layouts/shortcodes/notice.html  layouts/shortcodes/notice.html
