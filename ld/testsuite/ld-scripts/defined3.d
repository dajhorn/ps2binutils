#ld: -Tdefined3.t
#nm: -B
#source: phdrs.s
#source: defined.s

# Check that DEFINED matches only symbols defined before its location.
# The ellipsis account for target-specific symbols.  Matching both A and T
# accounts for formats that can't tell a .text symbol from an absolute
# symbol (mmo), but matches whatever section that contains an address
# matching the value.

#...
0+1 [AT] defined
0+200 A defined1
0+201 A defined2
0+100 A defined3
0+ [AT] defined4
0+2a A defined5
0+ [AT] defined6
0+1 [AT] defined7
0+1 [AT] defined8
#...
0+2a A sym1
[0-9a-f]+ T sym2
#pass
