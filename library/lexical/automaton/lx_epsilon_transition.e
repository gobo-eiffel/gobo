indexing

	description:

		"Epsilon transitions to automaton states"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_EPSILON_TRANSITION [G -> LX_STATE]

inherit

	LX_TRANSITION [G]

creation

	make

end -- class LX_EPSILON_TRANSITION
