import psutil
import time
import os

UPDATE_DELAY = 60
DOWNLOAD_THRESHOLD_KB = 50
UPLOAD_THRESHOLD_KB = 50
KEEP_AWAKE_COMMAND = "nohup /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe e:/Tools/lightson.ps1 > /dev/null &"
STOP_AWAKE_COMMAND = "nohup /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe e:/Tools/lightsoff.ps1 > /dev/null &"
awake = False

# get the network I/O stats from psutil
io = psutil.net_io_counters()
# extract the total bytes sent and received
bytes_sent, bytes_recv = io.bytes_sent, io.bytes_recv

while True:
    # sleep for `UPDATE_DELAY` seconds
    time.sleep(UPDATE_DELAY)
    io_2 = psutil.net_io_counters()
    us, ds = (io_2.bytes_sent - bytes_sent) / UPDATE_DELAY / \
        1024, (io_2.bytes_recv - bytes_recv) / UPDATE_DELAY / 1024
    print(f"Upload: {us} KiB Download: {ds} KiB")
    if (ds < DOWNLOAD_THRESHOLD_KB and
            us < UPLOAD_THRESHOLD_KB):
        if awake:
            os.system(STOP_AWAKE_COMMAND)
            awake = False
            print("IDLE")
    elif not awake:
        os.system(KEEP_AWAKE_COMMAND)
        awake = True
        print("AWAKE")

    bytes_sent, bytes_recv = io_2.bytes_sent, io_2.bytes_recv
