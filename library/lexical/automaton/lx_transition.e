indexing

	description:

		"Transitions to automaton states"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_TRANSITION [G -> LX_STATE]

creation

	make

feature -- Access

	target: G
			-- State reachable through current transition

feature -- Setting

	make, set_target (state: like target) is
			-- Set `target' to `state'.
		require
			state_not_void: state /= Void
		do
			target := state
		ensure
			target_set: target = state
		end

feature -- Status report

	labeled (symbol: INTEGER): BOOLEAN is
			-- Is current transition labeled `symbol'?
		do
		end

feature -- Equivalence classes

	record (equiv_classes: LX_EQUIVALENCE_CLASSES) is
			-- Update set label equivalence classes `equiv_classes'
			-- with transition labels, if any.
		require
			equiv_classes_not_void: equiv_classes /= Void
			not_built: not equiv_classes.built
			recordable: recordable (equiv_classes)
		do
		end

	recordable (equiv_classes: LX_EQUIVALENCE_CLASSES): BOOLEAN is
			-- May current transition be recorded in `equiv_classes'?
		require
			equiv_classes_not_void: equiv_classes /= Void
		do
			Result := True
		end

invariant

	target_not_void: target /= Void

end -- class LX_TRANSITION
