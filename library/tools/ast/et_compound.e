indexing

	description:

		"Eiffel instructions compounds"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COMPOUND

creation

	make

feature {NONE} -- Initialization

	make (an_instruction: like instructions) is
			-- Create a new compound.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			instructions := an_instruction
		ensure
			instructions_set: instructions = an_instruction
		end

feature -- Access

	instructions: ET_INSTRUCTION
			-- Instructions

feature -- Element change

	add_instruction (an_instruction: like instructions) is
			-- Add `an_instruction' to compound.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			an_instruction.set_next (instructions)
			instructions := an_instruction
		ensure
			instruction_added: instructions = an_instruction
			one_more: instructions.next = old instructions
		end

invariant

	instructions_not_void: instructions /= Void

end -- class ET_COMPOUND
