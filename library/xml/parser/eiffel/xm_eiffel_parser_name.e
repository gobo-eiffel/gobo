indexing

	description:

		"Parser name: optimised for namespaces but still allowing XML 1.0 names"

	todo: "Review how to handle strict XML 1.0 with namespaces"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_PARSER_NAME

inherit

	HASHABLE
		redefine
			is_equal, out
		end

	XM_MARKUP_CONSTANTS
		export
			{NONE} all
		undefine
			is_equal, out
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export
			{NONE} all
		undefine
			is_equal, out
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, out
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new empty name.
		do
			count := 0
			first := Void
			second := Void
			tail := Void
		end

feature -- Status report

	is_name: BOOLEAN is
			-- Is `Current' a name?
		do
			Result := is_simple_name or is_namespace_name
		end

	is_simple_name: BOOLEAN is
			-- Is current name a simple name?
		do
			Result := count = 1 and then first.count > 0
		end

	is_namespace_name: BOOLEAN is
			-- Is current name with a namespace?
		do
			Result := count = 2 and then 
				(first.count > 0 and second.count > 0)
		end

	is_namespace_declaration: BOOLEAN is
			-- Is current name an XML namespace declaration?
		do
			Result := (count = 1 or count = 2) and then same_string (Xmlns, first)
		end

	is_named_namespace_declaration: BOOLEAN is
			-- Is current name an XML declaration for a named namespace?
		do
			Result := is_namespace_declaration and is_namespace_name
		end

	is_empty: BOOLEAN is
			-- Is name empty?
		do
			Result := count = 0
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	ns_prefix: STRING is
			-- Namesapce prefix
		do
			if is_namespace_name then
				Result := first
			end
		end

	local_part: STRING is
			-- Local part
			-- (including tail)
		local
			it: DS_LIST_CURSOR [STRING]
		do
			if count <= 2 then
				Result := last
			else
				Result := clone (second)
				it := tail.new_cursor
				from it.start until it.after loop
					Result := STRING_.appended_string (Result, it.item)
					it.forth
				end
			end
		end

	item (i: INTEGER): STRING is
			-- Item at position i.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			if i = 1 then
				Result := first
			elseif i = 2 then
				Result := second
			else
				Result := tail.item (i - 2)
			end
		end

	first: STRING
			-- First item (name or namespace)

	last: STRING is
			-- Last item
		require
			not_empty: not is_empty
		do
			if count = 1 then
				Result := first
			elseif count = 2 then
				Result := second
			else
				Result := tail.last
			end
		ensure
			definition: Result = item (count)
		end

	hash_code: INTEGER is
			-- Hash code value
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
					-- Never overflow.
				Result := (Result // 3) + (item (i).hash_code // 3)
				i := i + 1
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items

feature -- Element change

	force_last (a_string: STRING) is
			-- Add `a_string' at end.
		require
			a_string_not_void: a_string /= Void
		do
			count := count + 1
			if count = 1 then
				first := a_string
			elseif count = 2 then
				second := a_string
			else
				if count = 3 then
					tail := new_string_bilinked_list
				end
				tail.force_last (a_string)
			end
		ensure
			one_more: count = old count + 1
			at_last: last = a_string
		end

feature -- Removal

	wipe_out is
			-- Remove all.
		do
			count := 0
			first := Void
			second := Void
			tail := Void
		ensure
			wiped_out: is_empty
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		do
			if count = other.count then
				if count = 0 then
					Result := True
				elseif count = 1 then
					Result := same_string (first, other.first)
				elseif count = 2 then
					Result := same_string (first, other.first) 
						and same_string (second, other.second)
				else
					Result := same_string (first, other.first)
						and same_string (second, other.second)
						and tail.is_equal (other.tail)
				end
			end
		end

feature -- Output

	out: STRING is
			-- Colon-separated name
		local
			i, nb: INTEGER
		do
			nb := count
			if nb > 0 then
				Result := clone (item (1))
			end
			from
				i := 2
			until
				i > nb
			loop
				Result := STRING_.appended_string (Result, item (i))
				i := i + 1
			end
		end

feature {XM_EIFFEL_PARSER_NAME} -- Implementation

	second: STRING
			-- Second (name).

	tail: DS_LIST [STRING]
			-- Inefficient(?) tail, because "a:b:c:d" is valid XML 1.0 but 
			-- it is supposed to be rare in practice.

invariant

	count_positive: count >= 0

end
