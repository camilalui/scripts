#!/usr/bin/python

import re
import os
import sys


def getFilesystems():
    filesystems = []
    for line in open('/proc/mounts', 'ro').readlines():
        if re.match('^/dev/.*', line):
            filesystems.append((line.split()[0], line.split()[1]))
    return filesystems


def checkFile(mountpoint, device):
    try:
        open(mountpoint + '/fscheck.txt', 'a').close()
        os.remove(mountpoint + '/fscheck.txt')
        print 'Read-Write Filesystem, device: %s' % device
        return True

    except IOError:
        print 'Read-Only Filesystem, device: %s' % device
        return False


error = False

for x,y in getFilesystems():
    if not checkFile(y, x):
        error = True

if error is True: sys.exit(1)
