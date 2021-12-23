# Definition DIFO

This [test](.) is exercising the definition [DIFO](../../difo/Readme.md).

### Description

In this test, the sequence of characters `~~` is used as *free operator*. It satisfies `DIFO` because even though `~` is a *special symbol* (used for object equality), it is also a *predefined operator* (hence satisfying property `3`) and an *operator symbol* (hence satisfying property `2`), and the sequence of characters `~~` is not a *special symbol*, a *standard operator* nor a *predefined operator* (hence satisfying property `1`).

### Notes

* ISE Eiffel (as of 19.12.10.3842 and after) erroneously reports a syntax error.
* ISE Eiffel (as of 20.11.10.5048 and after) erroneously reports a validity error `VFAV-1`.
