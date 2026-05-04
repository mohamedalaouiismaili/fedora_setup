# Fedora Workstation Provisioning Script
**Author:** Mohammed Ismaili Alaoui  
**OS Target:** Fedora Linux (Workstation)

## Overview
This repository contains an automated bash provisioning script designed to bootstrap a fresh Fedora Linux installation into a fully-fledged workstation. It is engineered specifically for Data Engineering, C++ Software Development, and Cybersecurity Consulting. 

By running a single script, the system is securely updated and configured with industry-standard toolchains, network diagnostic tools, and containerization frameworks, ensuring a standardized and reproducible development environment.

## What This Script Installs

### 1. C/C++ Data Engineering Toolchain
* **Compilers & Build Systems:** `gcc`, `gcc-c++`, `cmake`, `make`
* **Debugging & Profiling:** `gdb`, `valgrind`
* **Version Control:** `git`

### 2. Cybersecurity & Penetration Testing Tools
* **Network Analysis:** `nmap`, `wireshark` *(Automatically configures user group permissions for secure, non-root packet capture)*
* **Wireless Auditing:** `aircrack-ng`
* **Exploitation Framework:** `Metasploit` *(via official Rapid7 Omnibus installer)*
* **Web Vulnerability Scanning:** `Burp Suite Community` *(via Flathub)*

### 3. Professional Consulting & DevOps Tools
* **Containerization:** `Docker CE` *(Automatically configures Docker daemon and user group permissions)*
* **IDE:** `Visual Studio Code` *(via official Microsoft RPM repository)*

### 4. Core Utilities & Daily Drivers
* `curl`, `wget`, `htop`, `flatpak`
* **Web Browser:** `Google Chrome Stable`

## Usage Instructions

1. Clone this repository or download the `fedora_workstation_setup.sh` script to your local machine.
2. Open your terminal and navigate to the directory containing the script.
3. Make the script executable:
   ```bash
   chmod +x fedora_workstation_setup.sh
## System Requirements & Storage Footprint

Running this provisioning script requires approximately **4 GB to 5 GB of free disk space** on your Fedora machine. 

This storage is allocated to industry-standard tools, heavy exploit databases, and isolated application runtimes. Here is the approximate breakdown of the space utilization:

* **C++ Toolchain & Core System Utilities:** ~500 MB
* **Professional Consulting Tools (Docker CE, VS Code, Google Chrome):** ~1 GB
* **Metasploit Framework:** ~1.2 GB *(Includes extensive Rapid7 exploit databases)*
* **Burp Suite Community (via Flatpak):** ~1.5 GB to 2 GB *(Includes isolated Flathub runtime environments for secure execution)*   
