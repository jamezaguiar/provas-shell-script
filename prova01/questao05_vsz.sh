#!/bin/bash
ps aux | sed -e 's/[[:space:]]\+/\t/g' | grep nginx | grep -v grep | cut -f5 | tr '\n' '+' | sed 's/+$/\n/g' | bc
