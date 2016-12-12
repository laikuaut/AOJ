#!/usr/bin/env python

import sys

def main():
    a, b = (int(c) for c in input().strip().split())
    if a < b:
        print('a < b')
    elif a > b:
        print('a > b')
    else:
        print('a == b')

if __name__ == '__main__':
    main()
