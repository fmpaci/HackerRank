#https://www.hackerrank.com/challenges/staircase/problem



#!/bin/python3

import os
import sys

#
# Complete the staircase function below.
#
def staircase(n):
    [print(' '*(n-x) + '#'*(x)) for x in range(1,n+1)]
    

if __name__ == '__main__':
    n = int(input())

    staircase(n)
