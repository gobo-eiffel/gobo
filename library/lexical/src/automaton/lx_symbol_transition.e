﻿note

	description:

		"Symbol transitions to automaton states"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"

class LX_SYMBOL_TRANSITION [G -> LX_STATE]

inherit

	LX_TRANSITION [G]
		rename
			make as make_transition
		redefine
			labeled,
			record,
			recordable
		end

create

	make

feature {NONE} -- Initialization

	make (symbol: like label; state: like target)
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

	set_label (symbol: like label)
			-- Set `label' to `symbol'.
		do
			label := symbol
		ensure
			label_set: label = symbol
		end

feature -- Status report

	labeled (symbol: INTEGER): BOOLEAN
			-- Is current transition labeled `symbol'?
		do
			Result := label = symbol
		end

feature -- Equivalence classes

	record (equiv_classes: LX_EQUIVALENCE_CLASSES)
			-- Update set label equivalence classes `equiv_classes'
			-- with transition labels, if any.
		do
			equiv_classes.put (label)
		end

	recordable (equiv_classes: LX_EQUIVALENCE_CLASSES): BOOLEAN
			-- May current transition be recorded in `equiv_classes'?
		do
			Result := equiv_classes.valid_symbol (label)
		end

end
