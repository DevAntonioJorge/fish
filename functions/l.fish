function l -d "List files with eza (normal view)"
    # Check if eza is installed
    if not type -q eza
        echo "Error: eza is not installed. Please install it first:"
        echo "sudo pacman -S eza"
        return 1
    end

    # Normal listing with colors, icons, and git status
    eza --color=always --icons --git $argv
end
