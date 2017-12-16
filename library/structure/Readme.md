# Gobo Eiffel Structure Library

When this library has been developed, there was no data structure library
standard, and no portable library was publicly available. Each Eiffel
compiler provides its own data structure library, but none of them is
portable (see portability issues in `$GOBO/library/common/doc/portability`).
This library has hence been developed as a foundation for other portable
libraries provided in this package. The *Gobo Eiffel Structure Library*
contains the classic containers needed in everyday programming, such
as lists, stacks or tables, and provides different implementations such
as linked, bilinked, arrayed or hashed. There is nothing really new
in this library. Most ideas come from other existing data structure
libraries, such as EiffelBase from ISE or the Booch Components from
Tower Technology. It also follows the conventions specified in Dr Meyer's
book: "Reusable Software, the base object-oriented component libraries".

**Included in this library:**

* `doc`: this folder contains the documentation for this library,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the clusters and classes making up this library.
  * `container`: All containers are descendant of class `DS_CONTAINER`.
    Classes are generic, the generic parameter representing the type of
    the items held in the containers. This cluster contains abstract notions
    such as traversable, resizable or sortable properties.
  * `dispenser`: FIFO (e.g. queues) and LIFO (e.g. stacks) containers.
  * `list`: Traversable lists.
  * `set`: Structures containing at most one occurrence of each item.
  * `sort`: Algorithms to sort containers.
  * `support`: Support classes such as cells, pairs or linkable cells.
  * `table`: Structures whose items are accessible by keys.
    One possible implementation of tables is hash tables.
* `test`: this folder contains the unit tests for this library.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
