#!/usr/bin/env bash
clear
# VARIABLES
TITLE="     S M A R T  #  I N F R A     "
LENGTH=${#TITLE}
VERSION="0.0.1"

# Print header
echo -e "\n       ╭$(printf '─%.0s' $(seq 1 $((LENGTH + 6))))╮"
echo -e "       │                                       │"
echo -e "  ───────│ $TITLE │───────"
echo -e "       │                                       │"
echo -e "       ╰$(printf '─%.0s' $(seq 1 $((LENGTH + 6))))╯"
echo -e "                                        v"$VERSION"\n"

# Function check root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "This script needs to be run as root."
        
        # Check if the user has sudo privileges
        if sudo -v &>/dev/null; then
            echo -e "You have sudo privileges.\nRequesting elevated permissions...\n"
            exec sudo "$0" "$@"
        else
            echo -e "You do not have sudo privileges.\nPlease provide the root password.\n"
            exec su -c "$0 $*" root
        fi
    fi
}

main (){

check_root

echo -e "Installed successfully!\n"

}
main "$@"

