# Semantics M9EA

These [tests](.) are exercising the semantics rule below.

## M9EA: SCOOP Region Exclusive Access semantics

This semantics is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

However, SCOOP is described in the eiffel.org documentation [Concurrent programming with SCOOP](https://www.eiffel.org/doc/solutions/Concurrent_programming_with_SCOOP).

### Description of SCOOP in eiffel.org (version 23.09), [Exclusive Access](https://www.eiffel.org/doc/solutions/Exclusive_Access)

Exclusive access to a SCOOP region and all objects therein, which is obtained when an object of this region is controlled (e.g. when it is attached to a formal argument of the enclosing feature, see definition of controlled [here](../../validity/vuta/Readme.md)). Note that this also includes non-separate reference objects, because a processor always holds a lock over its own region. Lock passing happens for every synchronous call, in particular also for queries and passive processors.

Exclusive access to a region guarantees that no intervening features logged by other processors are executed. There is also a guarantee that, between any two regions, the order of separate feature calls logged by one region is the same as the order of feature applications by the other region.

When there are several separate formal arguments (or several separate expressions in an inline separate instruction), the exclusive access to these multiple regions is granted atomically. This ensures that no deadlock can occur when two regions want to gain access to the same regions.

Gaining exclusive access, also to multiple regions, is always non-blocking. An asynchronous call is also non-blocking. Only a synchronous call may be blocking.

### Notes

* In case of exclusive access to multiple regions, even if gaining the exclusive access to these regions is not blocking, the first region ready to execute the first separate call (even when asynchronous) will have to wait for all other regions to be ready to execute other potential separate calls logged from the current region. This is to guantee the atomicity of gaining exclusive access to multiple regions and hence avoid deadlock. Indeed, as soon as a region starts to execute as separate call (even when asynchronous), this region will not be available to execute separate calls logged from another region before the lock is released.

* ISE Eiffel (as of 23.09.10.7341 and after) does not grant exclusive access to multiple regions atomically when the exclusive access to one of these regions has already been granted from a feature with only one separate formal argument. See [test_two_separate_arguments_4](./test_two_separate_arguments_4).
