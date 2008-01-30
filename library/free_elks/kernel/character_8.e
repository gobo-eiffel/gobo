indexing
	description: "Characters, with comparison operations and an ASCII code"
	external_name: "System.Char"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

end
