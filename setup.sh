## Written by Brian Graham.

# Run Critical Updates

# Debian Based OS

#!/bin/sh

if [ -f /etc/debian_version ]; then
    echo "Debian-based system detected. Running updates..."
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
else
    echo "This is probably not a Debian/Ubuntu-based system. Moving on!"
fi


# CentOS/RHEL/Alma/Rocky Based OS

if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        centos|rhel|almalinux|rocky)
            echo "This is a CentOS/RHEL/Alma/Rocky Linux-based system."
            sudo yum upgrade -y && sudo yum autoremove -y
            ;;
        *)
            echo "This is not a CentOS/RHEL/AlmaLinux-based system."
            ;;
    esac
else
    echo "Cannot determine OS! Aborting..."
fi

# Configure UFW if it's installed.

#!/bin/sh

if [ -f /etc/debian_version ]; then
    if command -v ufw > /dev/null 2>&1; then
        echo "UFW is installed. Configuring firewall..."
        sudo ufw allow 443/tcp && sudo ufw allow 80/tcp
        if command -v mysql > /dev/null 2>&1 || command -v mariadb > /dev/null 2>&1; then
            echo "MySQL or MariaDB detected. Allowing port 3306..."
            sudo ufw allow 3306/tcp
        fi
    else
        echo "UFW is not installed. Skipping firewall configuration."
    fi
else
    echo "This is not a Debian-based system. Exiting..."
fi

