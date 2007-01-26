indexing
	description: "[
		References to objects containing reference to object
		meant to be exchanged with non-Eiffel software.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class POINTER_REF
inherit
	HASHABLE
		redefine
			out, is_equal, is_hashable
		end
		
	REFACTORING_HELPER
		redefine
			out, is_equal
		end
		
feature -- Access

	item: POINTER is
			-- Pointer value
		external
			"built_in"
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := item.hash_code
		end

feature -- Element change

	frozen set_item (p: POINTER) is
			-- Make `p' the `item' value.
		external
			"built_in"
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Status report

	is_hashable: BOOLEAN is
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item /= default_pointer
		end

feature -- Operations

	infix "+" (offset: INTEGER): POINTER is
			-- Pointer moved by an offset of `offset' bytes.
		do
			Result := item + offset
		end

feature {NONE} -- Initialization

	make_from_reference (v: POINTER_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: POINTER_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_integer_32: INTEGER is
			-- Convert `item' into an INTEGER_32 value.
		require
--			not_too_small: item >= feature {INTEGER}.Min_value
--			not_too_big: item <= feature {INTEGER}.Max_value
		do
			fixme (once "Do not forget to add proper precondition to ensure we can convert pointer %
				%value into an INTEGER")
			fixme (once "Change return type to INTEGER_32")
			Result := item.to_integer_32
		end

feature -- Memory copy

	memory_copy (a_source: POINTER; a_size: INTEGER) is
			-- Copy `a_size' bytes from `a_source' to `Current'.
			-- `a_source' and `Current' should not overlap.
		require
			valid_size: a_size >= 0
			valid_source: a_source /= default_pointer
		do
			c_memcpy (item, a_source, a_size)
		end

	memory_move (a_source: POINTER; a_size: INTEGER) is
			-- Copy `a_size' bytes from `a_source' to `Current'.
			-- `a_source' and `Current' can overlap.
		require
			valid_size: a_size >= 0
			valid_source: a_source /= default_pointer
		do
			c_memmove (item, a_source, a_size)
		end

	memory_set (val, n: INTEGER) is
			-- Fill first `n' bytes of the memory pointed by `Current'
			-- with constant `val'.
		require
			valid_val: val >= 0
			valid_n: n >= 0
		do
			c_memset (item, val, n)
		end

feature -- Allocation/free

	memory_alloc (a_size: INTEGER): POINTER is
			-- Allocated `size' bytes using `malloc'.
		require
			valid_size: a_size > 0
		do
			Result := c_malloc (a_size)
		end

	memory_calloc (a_count, a_element_size: INTEGER): POINTER is
			-- Allocate `a_count' elements of size `a_element_size' bytes using `calloc.
		require
			valid_element_count: a_count > 0
			valid_element_size: a_element_size > 0
		do
			Result := c_calloc (a_count, a_element_size)
		end
		
	memory_realloc (a_size: INTEGER): POINTER is
			-- Realloc `Current'.
		require
			valid_size: a_size >= 0
		do
			Result := c_realloc (item, a_size)
		end

	memory_free is
			-- Free allocated memory with `malloc'.
		do
			c_free (item)
			set_item (default_pointer)
		end

feature -- Comparison

	memory_compare (other: POINTER; a_size: INTEGER): BOOLEAN is
			-- True if `Current' and `other' are identical on `a_size' bytes.
		require
			valid_size: a_size > 0
			valid_other: other /= default_pointer
		do
			Result := c_memcmp (item, other, a_size) = 0
		end

feature -- Output

	out: STRING is
			-- Printable representation of pointer value
		do
			Result := item.out
		end

feature {NONE} -- Implementation

	c_memcpy (destination, source: POINTER; count: INTEGER) is
			-- C memcpy
		external
			"C signature (void *, const void *, size_t) use <string.h>"
		alias
			"memcpy"
		end
	
	c_memmove (destination, source: POINTER; count: INTEGER) is
			-- C memmove
		external
			"C signature (void *, const void *, size_t) use <string.h>"
		alias
			"memmove"
		end

	c_memset (source: POINTER; val: INTEGER; count: INTEGER) is
			-- C memset
		external
			"C signature (void *, int, size_t) use <string.h>"
		alias
			"memset"
		end

	c_memcmp (source, other: POINTER; count: INTEGER): INTEGER is
			-- C memcmp
		external
			"C signature (void *, void *, size_t): EIF_INTEGER use <string.h>"
		alias
			"memcmp"
		end

	c_malloc (size: INTEGER): POINTER is
			-- C malloc
		external
			"C signature (size_t): EIF_POINTER use <stdlib.h>"
		alias
			"malloc"
		end

	c_calloc (nmemb, size: INTEGER): POINTER is
			-- C calloc
		external
			"C signature (size_t, size_t): EIF_POINTER use <stdlib.h>"
		alias
			"calloc"
		end

	c_realloc (source: POINTER; size: INTEGER): POINTER is
			-- C realloc
		external
			"C signature (void *, size_t): EIF_POINTER use <stdlib.h>"
		alias
			"realloc"
		end

	c_free (p: POINTER) is
			-- C free
		external
			"C signature (void *) use <stdlib.h>"
		alias
			"free"
		end

end
