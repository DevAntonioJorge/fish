function sudo apt update "Update package lists for upgrades for packages that need upgrading, as well as new packages that have just come to the repositories."
    # Check if apt is installed
    if not type -q apt
        echo "Error: apt is not installed. Please install it first."
        return 1
    end

    # Update package lists
    sudo apt update 
    sudo apt upgrade -y
end