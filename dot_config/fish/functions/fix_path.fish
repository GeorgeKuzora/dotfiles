function fix_path --description "Safely remove fish_user_paths from fish_variables"
    set -l fish_vars ~/.config/fish/fish_variables
    
    # Check if file exists
    if not test -f $fish_vars
        echo "Info: $fish_vars does not exist, nothing to fix"
        return 0
    end
    
    # Count occurrences before removal
    set -l count_before 0
    if test -s $fish_vars
        set count_before (grep -c '^SETUVAR fish_user_paths:' $fish_vars 2>/dev/null || \
            awk '/^SETUVAR fish_user_paths:/ {count++} END {print count+0}' $fish_vars 2>/dev/null || \
            echo 0)
    end
    
    # Create temporary file safely
    set -l tmpfile ""
    if set tmpfile (mktemp 2>/dev/null)
        # Successfully created temp file
    else
        # Fallback if mktemp doesn't work
        set tmpfile /tmp/fish_vars.(random).tmp
    end
    
    # Process file
    set -l processed_lines 0
    if test -r $fish_vars
        while read -l line
            set processed_lines (math $processed_lines + 1)
            if not string match -q 'SETUVAR fish_user_paths:*' -- $line
                echo $line >> $tmpfile
            end
        end < $fish_vars
    end
    
    # Only replace if we processed something
    if test $processed_lines -gt 0
        mv $tmpfile $fish_vars
        echo "✓ Processed $processed_lines lines"
    else
        rm -f $tmpfile
        echo "✗ Failed to read $fish_vars"
        return 1
    end
    
    # Clear the universal variable
    set -eU fish_user_paths 2>/dev/null || true
    
    echo "✓ Cleaned fish_variables file"
    
    if test $count_before -gt 0
        echo "✓ Removed $count_before occurrence(s) of fish_user_paths"
    end
    
    echo ""
    echo "Note: Start a new shell with 'exec fish' for changes to take effect"
end
