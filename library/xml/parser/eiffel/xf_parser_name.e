
indexing

	description:
		
		"Parser name: optimised for  namespaces but still allowing XML 1.0 names"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	todo: "Review how to handle strict XML 1.0 with namespaces"

class XF_PARSER_NAME

inherit
	
	HASHABLE
		redefine
			is_equal,
			out
		end

creation

	make
			
feature -- Any

	is_equal (other: like Current): BOOLEAN is
			-- Equality.
		do
			if count = other.count then
				if count = 0 then
					Result := True
				elseif count = 1 then
					Result := first.is_equal (other.first)
				elseif count = 2 then
					Result := first.is_equal (other.first) and second.is_equal (other.second)
				else
					Result := first.is_equal (other.first)
							and second.is_equal (other.second)
							and tail.is_equal (other.tail)
				end
			end
		end
		
	out: STRING is
			-- Colon separated name.
		local
			i: INTEGER
		do
			if i > 0 then
				Result := clone (item (1))
			end
			from
				i := 2
			until
				i > count
			loop
				Result.append_string (item(i))
				i := i + 1
			end
		end
		
	hash_code: INTEGER is
			-- Hashable.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				-- never overflow
				Result := (Result // 3) + (item (i).hash_code // 3)
				i := i + 1
			end
		end

feature -- Data

	count: INTEGER
			-- Number of items.
			
	first: STRING
			-- First item (name or namespace)

feature -- XML

	is_name: BOOLEAN is
		do
			Result := is_simple_name or is_namespace_name
		end
		
	is_simple_name: BOOLEAN is
			-- Is this simple name?
		do
			Result := count = 1 and then first.count > 0
		end
		
	is_namespace_name: BOOLEAN is
			-- Is name with namespace?
		do
			Result := count = 2 and then 
				(first.count > 0 and second.count > 0)
		end
		
	is_namespace_declaration: BOOLEAN is
			-- Is this an XML namespace declaration?
		do
			Result := (count = 1 or count = 2) and then first.is_equal (Xmlns)
		end
		
	is_named_namespace_declaration: BOOLEAN is
			-- Is this an XML declaration for a named namespace?
		do
			Result := is_namespace_declaration and is_namespace_name
		end
					
feature 

	ns_prefix: STRING is
			-- Namesapce prefix.
		do
			if is_namespace_name then
				Result := first
			end
		end
	
	local_part: STRING is
			-- Local part.
			-- (including tail)
		local
			it: DS_LINEAR_CURSOR[STRING]
		do
			if count <= 2 then
				Result := last
			else
				Result := clone (second)
				from
					it := tail.new_cursor
					it.start
				until
					it.after
				loop
					Result.append_string (it.item)
					it.forth
				end
			end
		end
		
feature {XF_PARSER_NAME} -- Data

	second: STRING
			-- Second (name).
			
	tail: DS_BILINKED_LIST[STRING]
			-- Inefficient(?) tail, because "a:b:c:d" is valid XML 1.0 but 
			-- it is supposed to be rare in practice.
	
feature -- DS_LIST like features

	is_empty: BOOLEAN is
			-- Empty?
		do
			Result := count = 0
		end
		
	last: STRING is
			-- Last item.
		require
			not_empty: count > 0		
		do
			if count = 1 then
				Result := first
			elseif count = 2 then
				Result := second
			else
				Result := tail.last
			end
		end
		
	item (i: INTEGER): STRING is
			-- Item at position i.
		require
			positive: i > 0
			count: i <= count
		do
			if i = 1 then
				Result := first
			elseif i = 2 then
				Result := second
			else
				Result := tail.item (i-2)
			end
		end
		
	make, wipe_out is
			-- Remove all.
		do
			count := 0
			first := Void
			second := Void
			tail := Void
		end
		
	force_last (a_string: STRING) is
			-- Add item at end.
		require
			not_void: a_string /= Void
		do
			count := count + 1
			if count = 1 then
				first := a_string
			elseif count = 2 then
				second := a_string
			else
				if count = 3 then
					!! tail.make_equal
				end
				tail.force_last (a_string)
			end
		ensure
			count_done: count = ((old count) + 1)
			at_last: item (count) = a_string
		end
		
feature {NONE} -- Constants

	Xmlns: STRING is "xmlns"
	
end
