indexing
	description: "References to objects containing a unicode character value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	WIDE_CHARACTER_REF

inherit
	COMPARABLE
		redefine
			is_equal, out
		end

	HASHABLE
		redefine
			is_hashable, is_equal, out
		end

feature -- Access

	item: WIDE_CHARACTER is
			-- Unicode character value
		external
			"built_in"
		end

	code: INTEGER is
			-- Associated integer value
		do
			Result := item.code
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := code
		end

feature -- Status report

	is_hashable: BOOLEAN is True
			-- May current object be hashed?

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current character?
		do
			Result := code < other.code
		ensure then
			definition: Result = (code < other.code)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Element change

	set_item (c: WIDE_CHARACTER) is
			-- Make `c' the `item' value.
		external
			"built_in"
		end

feature -- Output

	out: STRING is
			-- Printable representation of wide character
		do
			create Result.make (6)
			Result.append_character ('U')
			Result.append_character ('+')
			Result.append_string (code.to_hex_string)
		end

feature {NONE} -- Initialization

	make_from_reference (v: WIDE_CHARACTER_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v)
		ensure
			item_set: item = v.item	
		end

feature -- Conversion

	to_reference: WIDE_CHARACTER_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

end
