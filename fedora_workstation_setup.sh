#!/bin/bash
# ==============================================================================
# Script: fedora_workstation_setup.sh
# Author: Mohammed Ismaili Alaoui
# Description: Automated provisioning script for a complete Fedora Workstation.
#              Updated for DNF5 and features unattended installer handling.
# ==============================================================================

echo "Starting Fedora Workstation Provisioning by Mohammed Ismaili Alaoui..."

# --- 1. System Update & Core Utilities ---
echo "--> Updating dnf packages..."
sudo dnf update -y
echo "--> Installing core utilities (curl, wget, htop, flatpak)..."
sudo dnf install -y curl wget htop flatpak

# --- 2. C/C++ Development Environment ---
echo "--> Installing C++ toolchain and tools (GCC, CMake, GDB, Make, Valgrind, Git)..."
sudo dnf install -y gcc gcc-c++ gdb cmake make valgrind git

# --- 3. Cybersecurity & Penetration Testing Tools ---
echo "--> Installing Network Security Tools (Nmap, Wireshark, Aircrack-ng)..."
sudo dnf install -y nmap wireshark wireshark-qt aircrack-ng

# Add user to wireshark group for non-root packet capture
sudo usermod -a -G wireshark $USER

echo "--> Installing Metasploit Framework..."
curl -fsSL https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
sudo ./msfinstall
rm msfinstall

echo "--> Downloading and Installing Burp Suite Community (Unattended)..."
# Downloads the latest Linux installer, makes it executable, runs silently, and cleans up
curl -fsSL "https://portswigger.net/burp/releases/download?product=community&version=&type=Linux" -o burpsuite_installer.sh
chmod +x burpsuite_installer.sh
sudo ./burpsuite_installer.sh -q
rm burpsuite_installer.sh

# --- 4. Professional Consulting Tools (Docker & VS Code) ---
echo "--> Installing Docker..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

echo "--> Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf install -y code

# --- 5. Daily Driver Apps ---
echo "--> Enabling Fedora Workstation third-party repositories..."
sudo dnf install -y fedora-workstation-repositories

echo "--> Enabling and Installing Google Chrome Stable..."
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install -y google-chrome-stable

# --- 6. Finalization ---
echo ""
echo "=============================================================================="
echo "Environment Setup Complete! System is ready for Engineering and Consulting."
echo "IMPORTANT: Please reboot your system to apply Docker and Wireshark permissions."
echo "=============================================================================="
