#!/bin/env python3

import os
import argparse
import subprocess
from pathlib import Path

FROM_EXT = ".m4a"
TO_EXT = ".flac"
POLLING_SECS = 5

def run_fast_scandir(dir, ext):    # dir: str, ext: list
    subfolders, files = [], []

    for f in os.scandir(dir):
        if f.is_dir():
            subfolders.append(f.path)
        if f.is_file():
            if os.path.splitext(f.name)[1].lower() in ext:
                files.append(f.path)


    for dir in list(subfolders):
        sf, f = run_fast_scandir(dir, ext)
        subfolders.extend(sf)
        files.extend(f)
    return subfolders, files


def transcode_dirs(in_dir, out_dir):
    subfolders, files = run_fast_scandir(in_dir, [FROM_EXT])

    processes = set()
    max_processes = 5

    for subfolder in subfolders:
        Path(subfolder.replace(in_dir, out_dir)).mkdir(parents=True, exist_ok=True)
    
    for name in files:
        out_name = (name.replace(in_dir, out_dir)).rpartition(".")[0] + TO_EXT
        if not Path(out_name).exists():
            cmd = ["ffmpeg", "-i", name, out_name, "-loglevel", "quiet"]
            proc = subprocess.Popen(cmd)
            processes.add(proc)
            print(" ".join(cmd))
            if len(processes) >= max_processes:
                os.wait()
                processes.difference_update(
                    [p for p in processes if p.poll() is not None])

    for p in processes:
        if p.poll() is None:
            p.wait()



def main():
    parser = argparse.ArgumentParser(
        prog="alac2flac", description="Transcode recursively"
    )
    parser.add_argument("in_dir")
    parser.add_argument("out_dir")
    args = parser.parse_args()

    transcode_dirs(os.path.join(args.in_dir, ""), os.path.join(args.out_dir, ""))


if __name__ == "__main__":
    main()
