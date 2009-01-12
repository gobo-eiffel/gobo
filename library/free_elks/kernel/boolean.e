note
	description: "Truth values, with the boolean operations"
	external_name: "System.Boolean"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class BOOLEAN

inherit
	BOOLEAN_REF
		redefine
			conjuncted,
			conjuncted_semistrict,
			disjuncted,
			disjuncted_semistrict,
			disjuncted_exclusive,
			implication,
			negated
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({BOOLEAN_REF})

feature -- Basic operations

	conjuncted alias "and" (other: BOOLEAN): BOOLEAN
			-- Boolean conjunction with `other'
		external
			"built_in"
		end

	conjuncted_semistrict alias "and then" (other: BOOLEAN): BOOLEAN
			-- Boolean semi-strict conjunction with `other'
		external
			"built_in"
		end

	implication alias "implies" (other: BOOLEAN): BOOLEAN
			-- Boolean implication of `other'
			-- (semi-strict)
		external
			"built_in"
		end

	negated alias "not": BOOLEAN
			-- Negation
		external
			"built_in"
		end

	disjuncted alias "or" (other: BOOLEAN): BOOLEAN
			-- Boolean disjunction with `other'
		external
			"built_in"
		end

	disjuncted_semistrict alias "or else" (other: BOOLEAN): BOOLEAN
			-- Boolean semi-strict disjunction with `other'
		external
			"built_in"
		end

	disjuncted_exclusive alias "xor" (other: BOOLEAN): BOOLEAN
			-- Boolean exclusive or with `other'
		external
			"built_in"
		end

end
