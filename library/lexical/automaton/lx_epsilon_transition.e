indexing

	description:

		"Epsilon transitions to automaton states"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_EPSILON_TRANSITION [G -> LX_STATE]

inherit

	LX_TRANSITION [G]

creation

	make

end -- class LX_EPSILON_TRANSITION
