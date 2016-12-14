#!/usr/bin/env python

import sys

def check():
    W, H, x, y, r = [ int(c) for c in input().strip().split() ]
    circle_L = x - r
    circle_R = x + r
    circle_T = y + r
    circle_B = y - r

    if not (0 <= circle_L <= W):
        return "No"
    if not (0 <= circle_R <= W):
        return "No"
    if not (0 <= circle_B <= H):
        return "No"
    if not (0 <= circle_T <= H):
        return "No"

    return "Yes"

def main():
    print(check())

if __name__ == '__main__':
    main()
