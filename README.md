# 📧 MikroTik Automated Daily Backup to Email

![MikroTik](https://img.shields.io/badge/Platform-MikroTik%20RouterOS-red)
![License](https://img.shields.io/badge/License-MIT-blue)
![Function](https://img.shields.io/badge/Function-Disaster%20Recovery-orange)

## 📖 Overview
Network disasters happen. Routers fail, updates break configs, or human errors wipe data. This repository contains a script for **Zero-Touch Backup Automation**.

It automatically generates a system backup (`.backup`) and an export file (`.rsc`), emails them to the System Administrator, and cleans up the local storage to prevent memory overflow.

## 🛠 Features
- 🕒 **Scheduled Execution:** Runs automatically at 3:00 AM (or any scheduled time).
- 📦 **Dual Backup Mode:** Sends both Binary Backup (Full Restore) and Script Export (Readable Config).
- 📧 **SMTP Integration:** Works with Gmail, Outlook, or Custom SMTP servers.
- 🧹 **Auto-Cleanup:** Deletes old backup files from the router to save space.

## ⚙️ How It Works
1.  **Backup:** Creates files named with the current date (e.g., `backup-2026-01-21`).
2.  **Email:** Connects to the SMTP server and attaches the files.
3.  **Delete:** Removes the files from the router's local disk after successful sending.

## 🚀 Installation Guide

### Step 1: Configure Email (Tools > Email)
Before using the script, configure your SMTP settings in MikroTik.
*If using Gmail, use an App Password, not your login password.*

```terminal
/tool e-mail
set address=smtp.gmail.com port=587 from="your-router@gmail.com" user="your-email@gmail.com" password="your-app-password" start-tls=yes

Step 2: Create the Script
Copy the code from auto_backup.rsc and create a new script named email_backup.

Step 3: Schedule the Script
Go to System > Scheduler and set it to run daily.
/system scheduler add name="DailyBackup" on-event="email_backup" start-time=03:00:00 interval=1d

Author: Sheikh Alamin Santo

Cloud Infrastructure Specialist & System Administrator
