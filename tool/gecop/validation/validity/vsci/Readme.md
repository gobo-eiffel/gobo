# Validity VSCI

These [tests](.) are exercising the validity rule below.

## VSCI: Class Identification rule

### ECMA 367-2, 8.3.5 page 31

It is valid for a universe to include a class if and only if no other class of the universe has the same upper name.

### ECMA 367-3 (working version 3-108), 8.5.5 page 76

Same as above.

### Notes

* The code of this validity rule was [VSCN](../vscn/Readme.md) in ECMA 367-2.

*  ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VD71`.
