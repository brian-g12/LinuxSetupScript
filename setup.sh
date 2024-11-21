# Run Critical Updates

# Debian Based OS
if [ -f /etc/debian_version ]; then
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
else
echo "Probably not Debian/Ubuntu, moving on!"
fi

# CentOS/RHEL/Alma/Rocky Based OS

if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        centos|rhel|almalinux|rocky)
            echo "This is a CentOS/RHEL/AlmaLinux-based system."
            sudo yum upgrade -y && sudo yum autoremove -y
            ;;
        *)
            echo "This is not a CentOS/RHEL/AlmaLinux-based system."
            ;;
    esac
else
    echo "Cannot determine OS! Aborting..."
fi