#!/bin/bash
ps aux | grep -v '^root' | tail -n +2 | wc -l
