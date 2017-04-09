note
	Warning: "[
		If you are precompiling a subset of EiffelBase, it is 
		preferable NOT to remove this class from the subset. 
		If you remove it you may see unnecessary recompilations
		after changes.
		]"
	description: "[
		Class used to ensure proper precompilation of EiffelBase. 
		Not to be used otherwise.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	DECLARATOR

feature {NONE} -- Implementation

	s1: detachable SPECIAL [INTEGER]

	s1_2: detachable SPECIAL [INTEGER_8]

	s1_3: detachable SPECIAL [INTEGER_16]

	s1_4: detachable SPECIAL [INTEGER_64]

	s2: detachable SPECIAL [REAL_32]

	s3: detachable SPECIAL [REAL_64]

	s4: detachable SPECIAL [BOOLEAN]

	s5: detachable SPECIAL [CHARACTER]

	s6: detachable SPECIAL [POINTER]

	s7: detachable SPECIAL [ANY]

	s8: detachable SPECIAL [NATURAL_8]

	s8_2: detachable SPECIAL [NATURAL_16]

	s8_3: detachable SPECIAL [NATURAL_32]

	s8_4: detachable SPECIAL [NATURAL_64];

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
