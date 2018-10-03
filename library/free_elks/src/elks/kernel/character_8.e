note
	description: "Characters, with comparison operations and an ASCII code"
	external_name: "System.Char"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class
	CHARACTER_8

inherit
	CHARACTER_8_REF
		redefine
			code,
			to_character_32
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({CHARACTER_8_REF}),
	to_character_32: {CHARACTER_32}

feature -- Access

	code: INTEGER
			-- Associated integer value
		external
			"built_in"
		end

feature -- Conversion

	to_character_32: CHARACTER_32
			-- Associated character in 32 bit version
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
