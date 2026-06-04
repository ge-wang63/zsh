# Print each entry of the PATH variable on a separate line
printpath() {
    local -a entries
    entries=("${(s/:/)PATH}")
    for entry in $entries; do
        print "$entry"
    done
}
