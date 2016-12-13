#!/usr/bin/env python

import sys

def main():
    nums = sorted([int(c) for c in input().strip().split()])
    print(" ".join([str(c) for c in nums]))

if __name__ == '__main__':
    main()
