# Creating and Maintaining a VHDX Drive in WSL	

This guide explains how to create, mount, and maintain a VHDX drive for use with WSL (Windows Subsystem for Linux).

## Prerequisites
- Windows 10/11 with WSL2 installed
- Administrative access
- PowerShell
- Sufficient disk space

## Creating the VHDX

1. First, check existing devices in your WSL distribution:
```bash
ls /dev/sd* -la
```

2. Create the VHDX file in PowerShell (run as Administrator):
```powershell
New-VHD -Path "Z:\Disks\wsl-ubuntu-2404\data_disk.vhdx" -SizeBytes 500GB -Dynamic
wsl --mount --vhd "Z:\Disks\wsl-ubuntu-2404\data_disk.vhdx" --bare
```

## Setting Up the Drive in WSL

1. Identify the new device:
```bash
ls /dev/sd* -la
```
Note: Compare with the previous listing to identify the new device (e.g., /dev/sdd)

2. Create a mount point:
```bash
sudo mkdir /mnt/data
```

3. Initialize the disk using fdisk:
```bash
sudo fdisk /dev/sdX  # Replace X with your disk letter
```
Enter these commands in sequence:
- `n` (new partition)
- `p` (primary partition)
- `1` (partition number)
- Enter (default first sector)
- Enter (default last sector)
- `w` (write changes)

4. Format the partition:
```bash
sudo mkfs.ext4 /dev/sdX1  # Replace X with your disk letter
```

## Configuring Persistent Mounting

1. Get the partition UUID:
```bash
sudo blkid
```

2. Mount the partition:
```bash
sudo mount UUID="YOUR-UUID" /mnt/data
```

3. Add to /etc/fstab:
```bash
echo 'UUID="YOUR-UUID" /mnt/data ext4 defaults 0 0' | sudo tee -a /etc/fstab
```

4. Configure WSL automount by adding to /etc/wsl.conf:
```bash
sudo tee -a /etc/wsl.conf << EOF
[automount]
enabled=true
mountFsTab=true
EOF
```

## Automatic Mounting on Windows Startup and WSL Shutdown/Restart

1. Create a startup script (mount-wsl-vhdx.bat):
```batch
wsl --mount --vhd "Z:\Disks\wsl-ubuntu-2404\data_disk.vhdx" --bare
```

2. Create a scheduled task:
- Open Task Scheduler
- Create a new task with these triggers:
  - At system startup
  - On event: Log: Microsoft-Windows-Hyper-V-Worker/Admin
    - Source: Hyper-V-Worker
    - Event ID: 18500

This ensures the disk is mounted when:
- Windows starts
- WSL restarts after shutdown
- Any Hyper-V VM starts
    
