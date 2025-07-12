function la -d "List all files with eza (including hidden files)"
    # Check if eza is installed
    if not type -q eza
        echo "Error: eza is not installed. Please install it first:"
        echo "sudo pacman -S eza"
        return 1
    end

    # List all files including hidden ones
    eza --color=always --icons --git --all $argv
end
