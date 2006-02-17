indexing
	description: "Unicode characters, with comparison operations"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	WIDE_CHARACTER

inherit
	WIDE_CHARACTER_REF
		redefine
			code
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({WIDE_CHARACTER_REF}),
	to_reference: {WIDE_CHARACTER_REF, HASHABLE, COMPARABLE, PART_COMPARABLE, ANY}

feature -- Access

	code: INTEGER is
			-- Associated integer value
		external
			"built_in"
		end

end
