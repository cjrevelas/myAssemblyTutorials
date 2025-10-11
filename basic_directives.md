### DEFINE directive
- `db` -> allocates 1 byte
- `dw` -> allocates 2 bytes = 1 word
- `dd` -> allocates 4 bytes = 1 doubleword
- `dq` -> allocates 8 bytes = 1 quadword
- `dt` -> allocates 10 bytes

### RESERVE directives
They are used for statically allocating memory for uninitialized data. In fact, every variable is
initialized to zero and according to the declared size.

They require a single operand that specifies the number of units of space to be reserved.

They are as follows:
- `resb` -> reserve a byte
- `resw` -> reserve a word
- `resd` -> reserve a doubleword
- `resq` -> reserve a quadword
- `rest` -> reserve a ten bytes

### Other directives

The TIMES directive is useful in defining arrays and tables.

    marks TIMES 9 dw 0  ; define an array named marks of size 9 and initialize it to zero


The `EQU` directive is used for defining constants.


The `%ASSIGN` directive can be used to define numeric constants like the `EQU` directive, but also allows redefinition (this directive is case-sensitive).


The `%DEFINE` directive allows definition of both numeric and string constants (similar to `#DEFINE` in C). Also allows redefinition and is case-sensitive.

### Notes:
- Each byte of character is stored as its ASCII value in hexadecimal
- Each decimal value is automatically converted to its 16-bit binary equivalent and stored as a hexadecimal number
- Processor uses the little endian byte ordering
- Negative numbers are converted to their 2's complement representation
- Short and long floating point numbers are represented using 32 or 64 bits, respectively
