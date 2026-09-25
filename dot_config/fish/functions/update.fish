function update --description "Update all packages across dnf, snap, flatpak, and brew"
    set -l errors 0
    
    # Helper function to run a command with error handling
    function _run_update
        set cmd $argv
        echo "Running: $cmd"
        if not eval $cmd
            echo "❌ Failed: $cmd" >&2
            set errors (math $errors + 1)
            return 1
        else
            echo "✅ Success: $cmd"
        end
    end
    
    # Update dnf packages
    if _run_update "sudo dnf update -y"
        echo "DNF packages updated successfully"
    end
    
    # Update snap packages
    if _run_update "sudo snap refresh"
        echo "Snap packages updated successfully"
    end
    
    # Update flatpak packages
    if _run_update "flatpak update -y"
        echo "Flatpak packages updated successfully"
    end
    
    # Update brew packages (if brew is available)
    if type -q brew
        if _run_update "brew update && brew upgrade"
            echo "Homebrew packages updated successfully"
        end
    else
        echo "⚠️  Homebrew not found - skipping brew update"
    end
    
    # Final summary
    echo ""
    if test $errors -eq 0
        echo "🎉 All package managers updated successfully!"
        return 0
    else
        echo "⚠️  $errors package manager(s) failed to update" >&2
        return 1
    end
end
