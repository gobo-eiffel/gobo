indexing

	description:

		"Eiffel conditional parts of if instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CONDITIONAL

creation

	make

feature {NONE} -- Initialization

	make (a_condition: like condition; a_compound: like compound) is
			-- Create a new conditional part.
		require
			a_condition_not_void: a_condition /= Void
		do
			condition := a_condition
			compound := a_compound
		ensure
			condition_set: condition = a_condition
			compound_set: compound = a_compound
		end

feature -- Access

	condition: ET_EXPRESSION
			-- Boolean condition

	compound: ET_COMPOUND
			-- Then part

	next: ET_CONDITIONAL
			-- Next conditional part in if-instruction

feature -- Setting

	set_next (a_conditional: like next) is
			-- Set `next' to `a_conditional'.
		do
			next := a_conditional
		ensure
			next_set: next = a_conditional
		end

invariant

	condition_not_void: condition /= Void

end -- class ET_CONDITIONAL
