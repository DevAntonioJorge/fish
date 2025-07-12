function lt -d "List files with eza in tree format"
    # Check if eza is installed
    if not type -q eza
        echo "Error: eza is not installed. Please install it first:"
        echo "sudo pacman -S eza"
        return 1
    end

    # Tree view with limited depth
    eza --color=always --icons --git --tree --level=2 $argv
end
