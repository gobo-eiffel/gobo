indexing
	description: "Characters, with comparison operations and an ASCII code"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	CHARACTER

inherit
	CHARACTER_REF
		redefine
			code
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({CHARACTER_REF}),
	to_reference: {CHARACTER_REF, HASHABLE, COMPARABLE, PART_COMPARABLE, ANY}

feature -- Access

	code: INTEGER is
			-- Associated integer value
		external
			"built_in"
		end

end
