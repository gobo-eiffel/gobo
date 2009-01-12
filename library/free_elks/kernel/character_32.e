note
	description: "Unicode characters, with comparison operations"
	assembly: "mscorlib"
	external_name: "System.UInt32"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

end
