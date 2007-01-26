indexing

	description:

		"General finite-state automata"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_AUTOMATON

inherit

	ANY -- Needed for SE 2.1b1.

	KL_CLONABLE

feature -- Access

	start_state: LX_STATE is
			-- Automaton's start state
		deferred
		ensure
			start_state_not_void: Result /= Void
		end

end
