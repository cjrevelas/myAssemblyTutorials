#!/bin/bash
src_name=$1
nasm -f elf64 -o ${src_name}.o ${src_name}.s
gcc -no-pie -m64 -o ${src_name}.x ${src_name}.o
