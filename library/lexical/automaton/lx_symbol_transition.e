indexing

	description:

		"Symbol transitions to automaton states"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_SYMBOL_TRANSITION [G -> LX_STATE]

inherit

	LX_TRANSITION [G]
		rename
			make as make_transition
		redefine
			labeled, record, recordable
		end

creation

	make

feature {NONE} -- Initialization

	make (symbol: like label; state: like target) is
			-- Create a new transition to
			-- `target', labeled `symbol'.
		require
			state_not_void: state /= Void
		do
			label := symbol
			target := state
		ensure
			label_set: label = symbol
			target_set: target = state
		end

feature -- Access

	label: INTEGER
			-- Transition label

feature -- Setting

	set_label (symbol: like label) is
			-- Set `label' to `symbol'.
		do
			label := symbol
		ensure
			label_set: label = symbol
		end

feature -- Status report

	labeled (symbol: INTEGER): BOOLEAN is
			-- Is current transition labeled `symbol'?
		do
			Result := label = symbol
		end

feature -- Equivalence classes

	record (equiv_classes: LX_EQUIVALENCE_CLASSES) is
			-- Update set label equivalence classes `equiv_classes'
			-- with transition labels, if any.
		do
			equiv_classes.put (label)
		end

	recordable (equiv_classes: LX_EQUIVALENCE_CLASSES): BOOLEAN is
			-- May current transition be recorded in `equiv_classes'?
		do
			Result := equiv_classes.valid_symbol (label)
		end

end -- class LX_SYMBOL_TRANSITION
