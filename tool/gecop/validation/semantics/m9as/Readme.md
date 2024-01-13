# Semantics M9AS

These [tests](.) are exercising the semantics rule below.

## M9AS: SCOOP Asynchronous Calls semantics

This semantics is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

However, SCOOP is described in the eiffel.org documentation [Concurrent programming with SCOOP](https://www.eiffel.org/doc/solutions/Concurrent_programming_with_SCOOP).

### Description of SCOOP in eiffel.org (version 23.09), [Asynchronous Calls](https://www.eiffel.org/doc/solutions/Asynchronous_Calls)

A separate call is a feature call whose target is of a separate type. Queries are always synchronous, because the caller has to wait for the result. Asynchronous calls can therefore only happen on commands with a separate target. Indeed, such calls are by default executed asynchronously, but there are some important exceptions to this rule. A command to a separate target is executed synchronously if any of the following applies:

1. The client (caller) and supplier (target) region are the same.
2. The target region is passive.
3. The callee needs a lock currently held by the caller (lock passing).
4. The caller holds the locks of the callee (separate callbacks).

A lock is an exclusive access to a SCOOP region and all objects therein, which is obtained when an object of this region is controlled (e.g. when it is attached to a formal argument of the enclosing feature, see definition of controlled [here](../m9sc/Readme.md)). Note that this also includes non-separate reference objects, because a processor always holds a lock over its own region. Lock passing happens for every synchronous call, in particular also for queries and passive processors.

### Notes

* The condition `3` means that one of the actual arguments of the call is in a region locked by the caller's region.

* The condition `4` is not quite true because the region of the caller of a separate call always holds a lock on the region of the callee since the target of the call needs to be controlled. So the condition `4` would mean that all separate calls are synchronous. What condition `4` wants to express instead is that in a call chain (nested calls) of synchronous calls if the region of the target of the next separate call is the region of target of another call in that call chain, then this call is synchronous as well.