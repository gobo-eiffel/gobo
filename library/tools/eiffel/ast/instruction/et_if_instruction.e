indexing

	description:

		"Eiffel if instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_IF_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_condition: ET_EXPRESSION; a_compound: ET_COMPOUND) is
			-- Create a new if instruction.
		require
			a_condition_not_void: a_condition /= Void
		do
			!! conditionals.make (a_condition, a_compound)
		ensure
			condition_set: conditionals.condition = a_condition
			compound_set: conditionals.compound = a_compound
		end

feature -- Access

	conditionals: ET_CONDITIONAL
			-- Conditional parts

	else_part: ET_COMPOUND
			-- Else part

feature -- Setting

	set_else_part (an_else_part: like else_part) is
			-- Set `else_part' to `an_else_part'.
		do
			else_part := an_else_part
		ensure
			else_part_set: else_part = an_else_part
		end

feature -- Element change

	add_conditional (a_condition: ET_EXPRESSION; a_compound: ET_COMPOUND) is
			-- Add a new conditional clause.
		require
			a_condition_not_void: a_condition /= Void
		local
			a_conditional: ET_CONDITIONAL
		do
			!! a_conditional.make (a_condition, a_compound)
			a_conditional.set_next (conditionals)
			conditionals := a_conditional
		ensure
			condition_set: conditionals.condition = a_condition
			compound_set: conditionals.compound = a_compound
			one_more: conditionals.next = old conditionals
		end

invariant

	conditionals_not_void: conditionals /= Void

end -- class ET_IF_INSTRUCTION
