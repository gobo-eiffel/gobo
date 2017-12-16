note
	description: "References to objects meant to be exchanged with non-Eiffel software."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

frozen expanded class POINTER inherit

	POINTER_REF
		redefine
			hash_code,
			plus,
			to_integer_32,
			is_default_pointer,
			out
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({POINTER_REF})

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		external
			"built_in"
		end

feature -- Status report

	is_default_pointer: BOOLEAN
			-- <Precursor>
		external
			"built_in"
		end

feature -- Operations

	plus alias "+" (offset: INTEGER): POINTER
			-- Pointer moved by an offset of `offset' bytes.
		external
			"built_in"
		end

feature -- Conversion

	to_integer_32: INTEGER_32
			-- Convert `item' into an INTEGER_32 value.
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of pointer value
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
