Gobo Eiffel Structure Library

When this library has been developed, there was no data structure library
standard, and no portable library was publicly available. Each Eiffel
compiler provides its own data structure library, but none of them is
portable (see portability issues in "$GOBO\doc\portability"). This
library has hence been developed as a foundation for other portable
libraries provided in this package. The Gobo Eiffel Structure Library
contains the classic containers needed in everyday programming, such
as lists, stacks or tables, and provides different implementations such
as linked, bilinked, arrayed or hashed. There is nothing really new
in this library. Most ideas come from other existing data structure
libraries, such as EiffelBase from ISE or the Booch Components from
Tower Technology. It also follows the conventions specified in Dr Meyer's
book: "Reusable Software, the base object-oriented component libraries".

Clusters:

container
    All containers are descendant of class DS_CONTAINER. Classes are
    generic, the generic parameter representing the type of the items
    held in the containers. This cluster contains abstract notions
    such as traversable, resizable or sortable properties.
cursor
    Cursors for container traversal. Contrary to EiffelBase, cursors
    are external to the data structures. This makes it easier to have
    simultaneous traversals without any side-effects between different
    traversals. All features in the cursor classes have a precondition
    'is_valid' ensuring that the cursor is still synchronized with the
    structure. For example a cursor pointing to an item which has been
    removed from the container won't be valid any more.
list
    Traversable lists.
search
    Searchers are used to find out whether an object is held in a
    given container.
sort
    Algorithms to sort containers.
stack
    First-in Last-out containers.
support
    Support classes such as cells, pairs or linkable cells.
table
    Structures whose items are accessible through keys. One possible
    implementation of tables is hash tables. No optimization effort
    has been made when writing DS_HASH_TABLE. In particular it
    doesn't take advantage of the well known algorithm using prime
    numbers when collisions occur. The implementation used here is
    very simple and was deemed satisfactory enough for its usage in
    the Gobo Eiffel Lexical Library. It is likely though that this
    class will be improved in future releases.

A more detailed documentation for this library, in HTML format, is
provided in "$GOBO\doc\structure".

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
