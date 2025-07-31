# 💻 PowerShell Helpdesk Automation Toolkit

A collection of practical PowerShell scripts designed to streamline common IT helpdesk and system administration tasks. These scripts are ideal for local execution (no domain/Active Directory required) and are beginner-friendly, making them great for portfolios and practical use.

---

## 📂 Scripts Included

### ✅ `check_disk_space.ps1`
Displays the free and used space on each local drive and issues a warning if any drive has less than 10 GB of available space.

### ✅ `get_system_info.ps1`
Collects and displays essential system information including OS version, uptime, CPU, RAM, IP address, and MAC address.

### ✅ `list_installed_software.ps1`
Retrieves and formats a list of all installed programs from the system registry. Useful for auditing or support tasks.

### ✅ `memory_usage.ps1`
Displays the top 10 running processes by memory usage in a Task Manager-like format, helpful for diagnosing performance issues.

### ✅ `network_diagnostics.ps1`
Performs basic network checks including ping tests and DNS server listing to assist with troubleshooting connectivity issues.

### ✅ `reset_user_password.ps1`
Resets an Active Directory user’s password using the `Set-ADAccountPassword` cmdlet. (Requires domain access and appropriate privileges.)

---

## 🚀 Getting Started

### 🔧 Requirements
- Windows PowerShell 5.1+ or PowerShell Core
- Some scripts (like `reset_user_password.ps1`) require:
  - Admin privileges
  - Active Directory module
  - Domain access

### ▶️ Running a Script
```powershell
.\scripts\check_disk_space.ps1

If you encounter an issue, you can trobuleshoot with the following:
powershell -ExecutionPolicy Bypass -File .\scripts\your_script.ps1

## 📌 License

MIT License — Feel free to use, modify, and contribute.

---

## 🙋‍♂️ About the Author

Built by [sudojalen] as part of a practical toolkit to support IT operations and demonstrate hands-on scripting ability.
