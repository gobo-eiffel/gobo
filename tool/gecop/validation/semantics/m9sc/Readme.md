# Semantics M9SC

These [tests](.) are exercising the semantics rule below.

## M9SC: SCOOP Regions and Processors Creation semantics

This semantics is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

However, SCOOP is described in the eiffel.org documentation [Concurrent programming with SCOOP](https://www.eiffel.org/doc/solutions/Concurrent_programming_with_SCOOP).

### Description of SCOOP in eiffel.org (version 23.09), [Creating regions and processors](https://www.eiffel.org/doc/solutions/Regions_and_Processors#Creating_regions_and_processors)

In order to turn a sequential program into a concurrent program one has to create new regions and put objects into them. The means to achieve this is the creation instruction on an entity whose type is separate.

```
my_x: separate X
	-- ...
create my_x.make
```

The instruction `create my_x.make` does a lot of things at the same time:

* It creates a new region.
* It creates a new processor for the new region.
* It creates a new object of type `X` which is placed into the newly created region.

## Notes

* The call to the creation procedure also follows the semantics of synchronous vs. asynchronous calls.