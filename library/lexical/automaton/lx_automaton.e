indexing

	description:

		"General finite-state automata"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_AUTOMATON

feature -- Access

	start_state: LX_STATE is
			-- Automaton's start state
		deferred
		ensure
			start_state_not_void: Result /= Void
		end

end -- class LX_AUTOMATON
