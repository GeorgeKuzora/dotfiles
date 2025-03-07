function safe_abbr --description 'Create abbr only if the command exists' --argument abr cmd
    set split_cmd (string split -m1 ' ' $cmd)[1]
    type -q $split_cmd; and abbr -a $abr $cmd
end
