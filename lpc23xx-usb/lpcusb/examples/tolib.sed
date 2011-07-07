#!/bin/sed -f

s/\#include \"type\.h\"/\#include \"lpc23xx-types\.h\"/g
s/\#include \"debug\.h\"//g
s/U8/uint8_t/g
s/U16/uint16_t/g
s/U32/uint32_t/g

