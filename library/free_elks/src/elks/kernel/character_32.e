note
	description: "Unicode characters, with comparison operations"
	assembly: "mscorlib"
	external_name: "System.UInt32"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-10-30 16:32:46 +0100 (Tue, 30 Oct 2012) $"
	revision: "$Revision: 600 $"

frozen expanded class
	CHARACTER_32

inherit
	CHARACTER_32_REF
		redefine
			code,
			natural_32_code,
			to_character_8
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({CHARACTER_32_REF})

feature -- Access

	code: INTEGER
			-- Associated integer value
		external
			"built_in"
		end

	natural_32_code: NATURAL_32
			-- Associated natural value
		external
			"built_in"
		end

feature -- Conversion

	to_character_8: CHARACTER_8
			-- Convert current to CHARACTER_8
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
