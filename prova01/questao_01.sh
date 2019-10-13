#!/bin/bash
cp /etc/passwd ./passwd.new
sed -i 's/\/home\/alunos/\/srv\/students/g' ./passwd.new
