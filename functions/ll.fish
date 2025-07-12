function ll -d "List files with eza (detailed view with complete information)"
    # Check if eza is installed
    if not type -q eza
        echo "Error: eza is not installed. Please install it first:"
        echo "sudo pacman -S eza"
        return 1
    end

    # Detailed listing with all information
    eza --color=always --icons --git --long --all --header --group --time-style=long-iso --classify $argv
end
