```rsc
# ============================================================
# MikroTik Automated Backup & Email Script
# Author: Sheikh Alamin Santo
# Description: Generates Backup & Sends to Admin Email
# ============================================================

# --- Configuration ---
:local emailAddress "admin@example.com"
:local deviceName [/system identity get name]
:local date [/system clock get date]
:local time [/system clock get time]

# Create File Names with Date (e.g., MikroTik-Jan/21/2026)
:local backupFile ("$deviceName" . "-" . "$date")
:local exportFile ("$deviceName" . "-" . "$date" . ".rsc")

# --- 1. Create Backups ---
:log info "Starting Backup Process..."

# Binary Backup (For Full Restore)
/system backup save name=$backupFile

# Script Export (For Reading Config)
/export file=$exportFile

:delay 5s

# --- 2. Send Email with Attachments ---
:log info "Sending Backup via Email to $emailAddress..."

/tool e-mail send to=$emailAddress subject="[$deviceName] Daily Backup - $date" \
    body="Attached are the daily backup files for router: $deviceName.\nDate: $date\nTime: $time\n\n- System Admin" \
    file=("$backupFile" . ".backup", $exportFile)

:delay 10s

# --- 3. Clean Up (Delete Files from Router) ---
:log info "Email Sent. Deleting local backup files..."

/file remove [find name=("$backupFile" . ".backup")]
/file remove [find name=$exportFile]

:log info "Backup Process Completed Successfully."
