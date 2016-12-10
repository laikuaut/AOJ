#!/usr/bin/env python

import sys

def main():
    height, width = (int(c) for c in input().strip().split())
    s = height * width
    c = (height + width) * 2
    print("{} {}".format(s, c))

if __name__ == '__main__':
    main()
