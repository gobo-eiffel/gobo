# Validity VSRP

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VSRP: Root Procedure rule

### ECMA 367-2, 8.3.10 page 32

It is valid to specify a name `pn` as root procedure name for a system `S` if and only if it satisfies the following conditions:

1. `pn` is the name of a creation procedure `p` of `S`'s root type.
2. `p` has no formal argument.
3. `p` is precondition-free.

### ECMA 367-3 (working version 3-108), 8.5.12 page 79

It is valid to specify a name `pn` as root procedure name for a system `S` if and only if it satisfies the following conditions:

1. [\[tests\]](../vsrp1) `pn` is the name of a general creation procedure `p` of `S`'s root type. `p` is called the **root procedure** of `S`.
2. [\[tests\]](../vsrp2) `p` has no formal argument.
3. [\[tests\]](../vsrp3) `p` is precondition-free.

### Notes

* The code of this validity rule was [`VSRC`](../vsrc/Readme.md) in ETL2, page 36.

* ISE Eiffel (as of 24.05.10.7822 and after) reports the violation of condition `1` using the code `VD27`.

* ISE Eiffel (as of 24.05.10.7822 and after) does not check whether the root creation procedure is exported to any clients.

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) accept cases where the root creation procedure has one formal argument and where `ARRAY [STRING]` conforms to the type of this formal argument. That way legacy code complying to the validity rule `VSRC` in ETL2 can still be compiled. `VSRC` was stating that the root creation procedure should have either no formal argument or a single argument of type `ARRAY [STRING]`.

* ISE Eiffel (as of 24.05.10.7822 and after) considers `require True` as precondition-free, but not `require True True`.

* ISE Eiffel (as of 24.05.10.7822 and after) fails to consider a root creation procedure as precondition-free if it has a precursor with a precondition, then redefined with `require True`, and redefined again with a precondition, even though the combined precondition has value `True`. 
