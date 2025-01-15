# Validity VSRT

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VSRT: Root Type rule

### ECMA 367-2, 8.3.9 page 32

It is valid to designate a type `TN` as root type of a system of universe `U` if and only if it satisfies the following conditions:

1. `TN` is the name of a stand-alone type `T`.
2. `T` only involves classes in `U`.
3. `T`'s base class is not deferred.
4. The base class of any type on which `T` depends is in `U`.

### ECMA 367-3 (working version 3-108), 8.5.10 page 78

It is valid to designate a type `TN` as root type of a system `S` of universe `U` if and only if it satisfies the following conditions:

1. [\[tests\]](../vsrt1) `TN` is the name of a stand-alone type `T`, called the **root type** of `S`.
2. [\[tests\]](../vsrt2) `T` only involves classes in `U`.
3. [\[tests\]](../vsrt3) The base class of any type on which `T` depends is in `U`.
4. [\[tests\]](../vsrt4) `T`'s base class is effective.

### Notes

* The code of this validity rule was [`VSRC`](../vsrc/Readme.md) in ETL2, page 36.

* ISE Eiffel (as of 24.05.10.7822 and after) reports the violation of condition `1` using the code `VD00`.

* ISE Eiffel (as of 24.05.10.7822 and after) reports the violation of condition `2` using the code `VD20` when the class not in the universe is the base class of the root type.

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) report the violation of condition `3` using the code `VTCT`.

* ISE Eiffel (as of 24.05.10.7822 and after) reports the violation of condition `4` using the code `VSRT-3`.

* Another condition is needed:

  5. `G` [\[tests\]](../vsrt5g) `T` is generic-creation-ready.
  
  This is needed because an object of type `T`, the root object, will be created.
  
  This condition is not reported by ISE Eiffel 24.05.10.7822.
