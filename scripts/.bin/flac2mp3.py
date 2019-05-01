#!/usr/bin/env python3
"""
Clones all the repos in a github organization.
"""

import argparse
import subprocess
import sys
import glob
import os
import shlex


def get_flacs(folder=None):
    """
    Gets a list of FLACs in the specified folder
    """
    if folder:
        folder = os.path.realpath(folder)
        return glob.glob("{0}/*flac".format(folder))
    return False


def convert_to_mp3(flac_file=None, output_dir=None):
    """
    Convert the specified flac to mp3 in the output_dir.
    """
    file_name = os.path.basename(flac_file).replace('.flac', '.mp3')
    out_file = os.path.join(output_dir, file_name)
    ffmpeg = ("ffmpeg -i {0} -codec:a libmp3lame"
              " -aq 0 -ab 320k -ar 48000 -codec:v mjpeg {1}")
    ffmpeg = ffmpeg.format(
        shlex.quote(flac_file),
        shlex.quote(out_file))

    try:
        return subprocess.call(ffmpeg, shell=True)
    except KeyboardInterrupt:
        print("Quitting...")
        return subprocess.call(['rm', '-fv', out_file])
    return 255


def cli():
    """
    CLI Launcher that calls the rest of the functions

    Returns:
        Error codes that will be transferred to the system
    """
    parser = argparse.ArgumentParser(add_help=False, prog="flac2mp3")
    parser.add_argument("--input", "-i", type=str, required=True)
    parser.add_argument("--output", "-o", type=str, required=True)
    arguments = parser.parse_known_args()[0]

    flac_list = get_flacs(arguments.input)
    flac_dir = os.path.basename(os.path.abspath(arguments.input))
    out_dir = os.path.realpath(os.path.join(arguments.output, flac_dir))
    os.makedirs(out_dir, exist_ok=True)

    if flac_list:
        fail = False
        for a_flac in flac_list:
            my_flac = os.path.realpath(a_flac)
            err = convert_to_mp3(my_flac, out_dir)
            if err:
                fail = True
                break
        if fail:
            return 255
    print("Possibly no flac file in the input directory.")
    return 255


if __name__ == "__main__":
    sys.exit(cli())
