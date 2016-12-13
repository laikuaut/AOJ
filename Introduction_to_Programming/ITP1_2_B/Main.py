#!/usr/bin/env python

import sys

def main():
    a, b, c= (int(c) for c in input().strip().split())
    if a < b < c:
        print('Yes')
    else:
        print('No')

if __name__ == '__main__':
    main()
