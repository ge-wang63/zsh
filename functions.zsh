# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# Print each entry of the PATH variable on a separate line
printpath() {
    local -a entries
    entries=("${(s/:/)PATH}")
    for entry in $entries; do
        print "$entry"
    done
}
