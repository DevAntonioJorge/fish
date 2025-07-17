function ls -d "List files with eza"
    # Check if eza is installed
    if not type -q eza
        echo "Error: eza is not installed. Please install it first:"
        echo "sudo pacman -S eza"
        return 1
    end

    eza --color=always --icons $argv
end