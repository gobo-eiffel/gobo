indexing
	description: "Truth values, with the boolean operations"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class BOOLEAN

inherit
	BOOLEAN_REF
		redefine
			infix "and",
			infix "and then",
			infix "or",
			infix "or else",
			infix "xor",
			infix "implies",
			prefix "not"
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({BOOLEAN_REF}),
	to_reference: {BOOLEAN_REF, HASHABLE, ANY}

feature -- Basic operations

	infix "and" (other: like Current): BOOLEAN is
			-- Boolean conjunction with `other'
		external
			"built_in"
		end

	infix "and then" (other: like Current): BOOLEAN is
			-- Boolean semi-strict conjunction with `other'
		external
			"built_in"
		end

	infix "implies" (other: like Current): BOOLEAN is
			-- Boolean implication of `other'
			-- (semi-strict)
		external
			"built_in"
		end

	prefix "not": like Current is
			-- Negation
		external
			"built_in"
		end

	infix "or" (other: like Current): BOOLEAN is
			-- Boolean disjunction with `other'
		external
			"built_in"
		end

	infix "or else" (other: like Current): BOOLEAN is
			-- Boolean semi-strict disjunction with `other'
		external
			"built_in"
		end

	infix "xor" (other: like Current): BOOLEAN is
			-- Boolean exclusive or with `other'
		external
			"built_in"
		end

end
