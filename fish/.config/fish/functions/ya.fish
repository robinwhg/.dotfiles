function ya
    set tmp (mktemp -t yazi-cwd.XXXXXX)

    # Run yazi with the same args and write cwd to temp file
    yazi $argv --cwd-file="$tmp"

    # Read resulting cwd
    set cwd (cat $tmp)

    # Change directory if valid and different
    if test -n "$cwd"
        and test "$cwd" != "$PWD"
        cd "$cwd"
    end

    rm -f "$tmp"
end
