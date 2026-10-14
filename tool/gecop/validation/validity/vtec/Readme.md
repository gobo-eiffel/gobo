# Validity VTEC

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VTEC: Expanded Type rule

### ETL2, 12.12 page 209

It is valid to use an expanded type of base class `C` in th text of `B`
if and only if it satisfies the following two conditions:

1. `C` is not a deferred class.
2. [\[tests\]](../vtec2) `C` either has no *Creators* part, or has a
   *Creators* part containing exactly one creation procedure, with no argument,
   available to `B` for creation.

### Notes

* This validity rule has not been kept in the ECMA standard.

* Condition `2` should be adatped to talked about the version in `C` of
  procedure `default_create` inherited from `ANY`, instead of the unique
  argumentless creation procedure in `C`.
