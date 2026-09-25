function e -d "Fuzzy search for file and open it in editor"
    # -l makes the variable local so it doesn't pollute shell environment
    set -l ed vi
    test -n "$EDITOR"; and set ed $EDITOR

    set -l file (fzf)
    and $ed $file
end
