# Enterprise-Windows-Server-Lab
Enterprise Windows Server Infrastructure Lab
Windows ServerActive DirectoryPowerShell

📌 Project Overview
This repository documents a fully functional, end-to-end Enterprise IT Infrastructure lab built on VMware Workstation. Unlike basic tutorials that focus only on server configuration, this lab simulates a real corporate environment by enforcing central security policies on a domain-joined Windows 10 client.

🗺️ Network Topology
graph TD    subgraph "VMware Workstation Network (VMnet8)"        DC[Domain Controller<br>server1.network.local<br>IP: 192.168.1.120<br>Roles: AD DS, DHCP, DNS, FSRM, WDS]        Client[Domain Client<br>win10.network.local<br>IP: 192.168.1.232 (DHCP)]    end        DC -- "GPO Enforcement & Auth" --> Client    DC -- "Assigns IP via DHCP" --> Client    Client -- "Auto Register in DNS" --> DC
🛠️ Configured Services & Features
1. Identity & Access Management (AD DS)
Configured network.local domain with SERVER1 as the Global Catalog Domain Controller.
Created Organizational Units (OUs): HR, IT, Computers, Users for logical structure.
Created a test domain user (ashraf@network.local) within the HR OU.
2. Network Services (DHCP & DNS)
DHCP: Configured scope 192.168.1.0/24. Implemented MAC-based Allow/Deny filters for network access control.
DNS: Created Forward Lookup Zones (network.local, ahmed.local). Verified Dynamic DNS (DDNS) registration from the Windows 10 client.
3. Endpoint Security & Group Policy (GPO)
Linked two GPOs to the IT OU to demonstrate processing order (LSDOU): no wallpaper (Order 1) overrides wallpaper (Order 2).
Corporate Workstation Lockdown: Enforced the following restrictions on win10.network.local centrally:
❌ Blocked: Command Prompt (CMD)
❌ Blocked: PowerShell
❌ Blocked: Wallpaper modification & Password changes by user
✅ Allowed: Shared folder access & Corporate logon
4. Data Management (File Server & FSRM)
Configured File Server Resource Manager (FSRM).
Applied a 100 MB Hard Quota on E:\quota.
Implemented File Screening to block *.pdf uploads using a custom file group.
5. OS Deployment (WDS)
Configured Windows Deployment Services for PXE network boot.
Added Windows 10 x64 Boot & Install images. Content hosted via REMINST share.
⚡ Automation (PowerShell Scripts)
To make this environment easily reproducible and to demonstrate automation skills, I have included PowerShell scripts that perform the core configurations:

1-Create-OUs.ps1: Automates the creation of the HR, IT, Computers, and Users OUs.
2-Create-Users.ps1: Bulk creates domain users with specific passwords and profile paths.
3-DHCP-Report.ps1: Extracts active DHCP leases and exports them to a CSV file for auditing.
🔍 Click to view sample script: Create-OUs.ps1
✅ Validation & Testing
All services were verified on the live domain-joined Windows 10 client:

ipconfig /all confirmed DHCP server (192.168.1.120) and DNS resolution.
User ashraf@network.local successfully authenticated.
Access restrictions (CMD, PS, Wallpaper) actively blocked with standard Windows restriction dialogs.
🚀 How to Use This Repo
Clone the repository: git clone https://github.com/YOUR_USERNAME/Windows-Server-Enterprise-Lab.git
Review the Diagrams folder to understand the network layout.
Check the Screenshots folder for visual proof of configurations.
Use the scripts in PowerShell-Scripts to rapidly deploy a similar environment in your own VMware lab (Run PowerShell as Administrator on the DC).
