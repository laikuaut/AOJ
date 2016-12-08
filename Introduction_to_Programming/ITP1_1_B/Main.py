#!/usr/bin/env python

import sys

def main():
    for line in sys.stdin:
        print(int(line)**3)

if __name__ == '__main__':
    main()
