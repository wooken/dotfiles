#!/usr/bin/env python

from __future__ import print_function
import argparse
from subprocess import call
from os.path import abspath, expanduser

# Main ----------------------------------------------------
def main():
    flags = parse()
    SectionList = section_init(flags)
    bootstrap(SectionList)

# Helper Fuctions -----------------------------------------
def parse():
    parser = argparse.ArgumentParser(description='Bootstrap dotfiles')
    parser.add_argument("--i3",
                        default=False,
                        action="store_true",
                        help="i3wm")
    args = parser.parse_args()
    return args

def section_init(flags):
    SectionList = []
    if flags.i3:
        i3status = Section("i3status.conf", "i3wm/i3status.conf", "testing.conf")
        SectionList.append(i3status)
    return SectionList

def bootstrap(SectionList):
    for s in SectionList:
        s.create_symlink()

# Section class -------------------------------------------
class Section:
    def __init__(self, name, src, dest):
        self.name = name
        self.src = BASE + src
        self.dest = HOME + dest

    def create_symlink(self):
        print("ln -s", self.src, self.dest)
        call(["ln", "-s", self.src, self.dest])

if __name__ == '__main__':
    BASE = abspath("./..") + "/" + "/"
    HOME = expanduser("~") + "/"
    main()
