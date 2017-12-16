note
	description: "Truth values, with the boolean operations"
	external_name: "System.Boolean"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

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
