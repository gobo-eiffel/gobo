# Semantics M9SE

These [tests](.) are exercising the semantics rule below.

## M9SE: SCOOP Exceptions semantics

This semantics is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

However, SCOOP is described in the eiffel.org documentation [Concurrent programming with SCOOP](https://www.eiffel.org/doc/solutions/Concurrent_programming_with_SCOOP).

### Description of SCOOP in eiffel.org (version 23.09), [Exceptions in SCOOP](https://www.eiffel.org/doc/solutions/Exceptions_in_SCOOP)

 In the context of SCOOP, exceptions are handled as follows:

1. An exception occuring during a synchronous separate call is propagated to the client region.
2.  An exception occuring during an asynchronous separate call is not propagated, because the client is busy executing something else. Instead, the supplier region is marked as dirty.
3. All calls logged to a dirty region, whether synchronous or asynchronous, are ignored.
4. A synchronous separate call to a dirty region immediately triggers an exception in the client. Afterwards, the region is clean again.
5. Upon lock passing, the dirtyness of a region is preserved.
6. After releasing a lock on a dirty region, the region is clean again.

### Notes

* The condition `2` means that if there is no subsequent synchronous separate call while the region is still lock, the exception will be silently ignored. Thos might be unacceptable in some kinds of applications where it's better to crash than continuing the execution as if nothing failed.

  Gobo Eiffel provides an compiler option so that an unhandled exception during an asynchronous separate call will make the application exit with an exception trace, just like what happens with unhandled exceptions in the root creation procedure.

* ISE Eiffel (as of 23.09.10.7341 and after) fails to show the full exception trace when an exception occurs during a synchronous separate call. Only the part in the client region is shown.