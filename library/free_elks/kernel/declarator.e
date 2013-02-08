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
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2009-03-15 17:53:42 +0100 (Sun, 15 Mar 2009) $"
	revision: "$Revision: 281 $"

class
	DECLARATOR

feature {NONE} -- Implementation

	s1: detachable SPECIAL [INTEGER]

	s1_2: detachable SPECIAL [INTEGER_8]

	s1_3: detachable SPECIAL [INTEGER_16]

	s1_4: detachable SPECIAL [INTEGER_64]

	s2: detachable SPECIAL [REAL]

	s3: detachable SPECIAL [DOUBLE]

	s4: detachable SPECIAL [BOOLEAN]

	s5: detachable SPECIAL [CHARACTER]

	s6: detachable SPECIAL [POINTER]

	s7: detachable SPECIAL [ANY]

	s8: detachable SPECIAL [NATURAL_8]

	s8_2: detachable SPECIAL [NATURAL_16]

	s8_3: detachable SPECIAL [NATURAL_32]

	s8_4: detachable SPECIAL [NATURAL_64]

end
