# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, feature `BB.g` has two separate arguments. The region of the second argument cannot be locked yet because it is busy executing some code which will eventually call some code on the region of the first argument. `BB.g` has two wait for those executions to be finished before aquiring the lock on both arguments.

### Notes

* With ISE Eiffel (as of 25.12.9.8922 and after), execution hangs because `BB.g` locked the region of the first argument before the region of the second argument was available. 
