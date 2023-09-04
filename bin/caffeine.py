import psutil
import time
import os

UPDATE_DELAY = 60
DOWNLOAD_THRESHOLD_KB = 10
UPLOAD_THRESHOLD_KB = 10
KEEP_AWAKE_COMMAND = "/mnt/e/Tools/lightson.ps1"
STOP_AWAKE_COMMAND = "/mnt/e/Tools/lightsoff.ps1"
awake = False


def byte_to_kb(bytes):
    """
    Returns size of bytes in a nice format
    """
    return bytes/1024


# get the network I/O stats from psutil
io = psutil.net_io_counters()
# extract the total bytes sent and received
bytes_sent, bytes_recv = io.bytes_sent, io.bytes_recv

while True:
    # sleep for `UPDATE_DELAY` seconds
    time.sleep(UPDATE_DELAY)
    io_2 = psutil.net_io_counters()
    us, ds = io_2.bytes_sent - bytes_sent, io_2.bytes_recv - bytes_recv
    if (byte_to_kb(ds) < DOWNLOAD_THRESHOLD_KB and
            byte_to_kb(us) < UPLOAD_THRESHOLD_KB and awake):
        os.system(STOP_AWAKE_COMMAND)
        awake = False
    elif not awake:
        awake = True

    bytes_sent, bytes_recv = io_2.bytes_sent, io_2.bytes_recv
