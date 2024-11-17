#!/bin/bash
src_name=$1
nasm -f elf64 -o ${src_name}.o ${src_name}.s
gcc -no-pie -m64 -o ${src_name}.x ${src_name}.o

#nasm -f elf -o ${src_name}.o ${src_name}.s
#ld -m elf_i386 -s -o ${src_name}.x ${src_name}.o
