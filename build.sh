#!/bin/bash
src_name=$1

nasm -g -f elf64 -o ${src_name}.o ${src_name}.s  # nasm assembler of 64-bit program with debug information
#nasm -g -f elf -o ${src_name}.o ${src_name}.s   # nasm assembler of 32-bit program with debug information
#yasm -g dwarf2 -f elf64 ${src_name}.s           # yasm assembler of 64-bit program with debug information

gcc -g -no-pie -m64 -o ${src_name}.x ${src_name}.o    # gcc 64-bit linker to create debug executable 
#ld -g -o ${src_name}.x ${src_name}.o                 # ld  64-bit linker to create debug executable
#ld -g -m elf_i386 -s -o ${src_name}.x ${src_name}.o  # ld  32-bit linker to create debug executable