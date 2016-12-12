#!/usr/bin/env python

import sys

def main():
    times = int(input().strip())

    h = int(times/(60*60))
    m = int((times - (h * 60 * 60)) / 60)
    s = int(times - (h * 60 * 60) - (m * 60))
    print('{}:{}:{}'.format(h,m,s))

if __name__ == '__main__':
    main()
