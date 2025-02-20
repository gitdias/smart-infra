#!/usr/bin/env bash

# VARIABLES
# Formats
RESET="\e[0m"     # Resets all styles
BOLD="\e[1m"      # Bold
DIM="\e[2m"       # Dim (less intense)
ITALIC="\e[3m"    # Italic
UNDERLINE="\e[4m" # Underline
BLINK="\e[5m"     # Blinking
REVERSE="\e[7m"   # Inverts text and background color
HIDDEN="\e[8m"    # Hidden

# Text Colors (Foreground)
BLACK="\e[30m"   # Black
RED="\e[31m"     # Red
GREEN="\e[32m"   # Green
YELLOW="\e[33m"  # Yellow
BLUE="\e[34m"    # Blue
MAGENTA="\e[35m" # Magenta
CYAN="\e[36m"    # Cyan
WHITE="\e[37m"   # White

# Background Colors
BG_BLACK="\e[40m"   # Black Background
BG_RED="\e[41m"     # Red Background
BG_GREEN="\e[42m"   # Green Background
BG_YELLOW="\e[43m"  # Yellow Background
BG_BLUE="\e[44m"    # Blue Background
BG_MAGENTA="\e[45m" # Magenta Background
BG_CYAN="\e[46m"    # Cyan Background
BG_WHITE="\e[47m"   # White Background

# Bright Foreground Text Colors
BRIGHT_BLACK="\e[90m"   # Dark Gray
BRIGHT_RED="\e[91m"     # Bright Red
BRIGHT_GREEN="\e[92m"   # Bright Green
BRIGHT_YELLOW="\e[93m"  # Yellow Bright
BRIGHT_BLUE="\e[94m"    # Bright Blue
BRIGHT_MAGENTA="\e[95m" # Bright Magenta
BRIGHT_CYAN="\e[96m"    # Bright Cyan
BRIGHT_WHITE="\e[97m"   # Bright White

# Bright Background Colors
BG_BRIGHT_BLACK="\e[100m"   # Dark Gray Background
BG_BRIGHT_RED="\e[101m"     # Bright Red Background
BG_BRIGHT_GREEN="\e[102m"   # Bright Green Background
BG_BRIGHT_YELLOW="\e[103m"  # Bright Yellow Background
BG_BRIGHT_BLUE="\e[104m"    # Bright Blue Background
BG_BRIGHT_MAGENTA="\e[105m" # Bright Magenta Background
BG_BRIGHT_CYAN="\e[106m"    # Cyan Background Bright
BG_BRIGHT_WHITE="\e[107m"   # Bright White Background

detect_distro() {
    # List of supported distributions
    distros=("debian" "ubuntu" "redhat" "centos" "fedora" "suse" "opensuse" "mandriva" "mageia" "slackware" "arch" "solus" "alpine" "gentoo" "nixos" "elementary" "oracle" "void" "kaos" "nitrux")

    # Define the files to check and their corresponding actions
    declare -A file_checks=(
        ["/etc/os-release"]="detect_from_os_release"
        ["/etc/lsb-release"]="detect_from_lsb_release"
        ["/etc/debian_version"]="detect_from_debian_version"
    )

    # Function to detect distribution from /etc/os-release
    detect_from_os_release() {
        . /etc/os-release
        for distro in "${distros[@]}"; do
            if [[ "$ID" == "$distro" ]]; then
                echo "$DISTRIBUTION $DETECTED: $ID ${VERSION_ID:-($VERSION)}"
                return 0
            fi
        done
        echo "$DISTRIBUTION $UNKNOWN ($ID)"
        return 1
    }

    # Function to detect distribution from /etc/lsb-release
    detect_from_lsb_release() {
        . /etc/lsb-release
        echo "$DISTRIBUTION $DETECTED: $DISTRIB_ID $DISTRIB_RELEASE"
        return 0
    }

    # Function to detect distribution from /etc/debian_version
    detect_from_debian_version() {
        echo "$DISTRIBUTION $DETECTED: Debian ($(cat /etc/debian_version))"
        return 0
    }

    # Iterate over the file checks
    for file in "${!file_checks[@]}"; do
        if [[ -f "$file" ]]; then
            ${file_checks[$file]}
            return
        fi
    done

    # Check for specific /etc/$distro-release files
    for distro in "${distros[@]}"; do
        if [[ -f "/etc/${distro}-release" ]]; then
            echo "$DISTRIBUTION $DETECTED: $distro ($(cat /etc/${distro}-release))"
            return
        fi
    done

    # If no distribution is detected
    echo "$DISTRIBUTION $UNKNOWN"
}

# Print header
header() {
    # VARIABLES
    local TITLE="     S M A R T  #  I N F R A     "
    local LENGTH=${#TITLE}
    local VERSION="0.0.2"
    echo -e "\n        ${BRIGHT_CYAN}╭$(printf '─%.0s' $(seq 1 $((LENGTH + 10))))╮${RESET}"
    echo -e "        ${BRIGHT_CYAN}│                                           │${RESET}"
    echo -e "  ${BRIGHT_CYAN}────────│${RESET}   ${BRIGHT_WHITE}$TITLE${RESET}   ${BRIGHT_CYAN}│────────${RESET}"
    echo -e "        ${BRIGHT_CYAN}│                                           │${RESET}"
    echo -e "        ${BRIGHT_CYAN}╰$(printf '─%.0s' $(seq 1 $((LENGTH + 10))))╯${RESET}"
    echo -e "                                              ${BRIGHT_WHITE}v$VERSION\n${RESET}"
}

# Function check root
check_root() {
    local NEED_SUDO="This script needs to be run using sudo."
    local HAVE_PRIVILEGES="Requesting elevated sudo permissions..."
    local TYPE_ROOT_PASS="Enter the root password to acquire privileges."
    if [[ $EUID -ne 0 ]]; then
        echo -e "${BRIGHT_YELLOW}\t${NEED_SUDO}${RESET}\n"
        # Check if the user has sudo privileges
        if sudo -v &>/dev/null; then
            echo -e "\n${BRIGHT_YELLOW}\t${HAVE_PRIVILEGES}${RESET}\n"
            exec sudo "$0" "$@"
        else
            echo -e "\n${BRIGHT_YELLOW}\t${TYPE_ROOT_PASS}${RESET}\n"
            exec su -c "$0 $*" root
        fi
    fi
}

main() {
    header
    check_root "$@"
    detect_distro
    echo -e "${BRIGHT_WHITE}\tInstalled successfully!${RESET}\n"
    exit
}
clear
main "$@"
