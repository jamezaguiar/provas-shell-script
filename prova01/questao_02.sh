#!/bin/bash
who | cut -f1 -d' ' | sort | uniq -u
