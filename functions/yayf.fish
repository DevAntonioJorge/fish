function yayf -d "Interactive package search and install with yay and fzf"
    # Check if fzf is installed
    if not type -q fzf
        echo "Error: fzf is not installed. Please install it first:"
        echo "sudo pacman -S fzf"
        return 1
    end

    # Check if yay is installed
    if not type -q yay
        echo "Error: yay is not installed. Please install it first."
        return 1
    end

    # Direct FZF interface with dynamic package search
    set -l selected_package (yay -Ss '' 2>/dev/null | awk '
    /^[a-zA-Z0-9_-]+\// {
        # Extract repository and package name
        repo = $1
        sub(/\/.*/, "", repo)
        pkg = $1
        sub(/.*\//, "", pkg)
        version = $2
        
        # Store package info
        packages[NR] = repo "/" pkg " " version
        pkg_names[NR] = pkg
        repos[NR] = repo
    }
    /^    / {
        # Description line
        desc = substr($0, 5)
        if (NR-1 in packages) {
            packages[NR-1] = packages[NR-1] " | " desc
        }
    }
    END {
        for (i in packages) {
            print packages[i]
        }
    }' | fzf \
        --height=80% \
        --border \
        --prompt="Search and select package: " \
        --preview="echo {} | sed 's/^[^/]*\///' | sed 's/ .*//' | xargs -I {} yay -Si {} 2>/dev/null || echo 'Package information not available'" \
        --preview-window=right:60% \
        --bind="ctrl-/:toggle-preview" \
        --header="Type to search | ENTER: install | CTRL-/: toggle preview | ESC: cancel" \
        --query="$argv[1]")

    if test -z "$selected_package"
        echo "Error: No package selected."
        return 1
    end

    # Extract package name
    set -l package_name (echo "$selected_package" | sed 's/^[^/]*\///' | sed 's/ .*//')
    
    # Confirm installation
    echo
    echo "Package selected: "(set_color yellow)"$package_name"(set_color normal)
    echo
    
    # Show package information
    echo "Package information:"
    yay -Si "$package_name" 2>/dev/null | head -10
    echo

    end
end
