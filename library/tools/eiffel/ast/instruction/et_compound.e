indexing

	description:

		"Eiffel instructions compounds"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COMPOUND

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (an_instruction: ET_INSTRUCTION) is
			-- Create a new compound.
		do
			!! instructions.make (10)
			put_last (an_instruction)
		ensure
			one_instruction: instructions.count = 1
			instruction_added: instructions.last = an_instruction
		end

feature -- Access

	instructions: DS_ARRAYED_LIST [ET_INSTRUCTION]
			-- Instructions

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := instructions.first.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := instructions.last.break
		end

feature -- Element change

	put_last (an_instruction: ET_INSTRUCTION) is
			-- Add `an_instruction' to compound.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			instructions.force_last (an_instruction)
		ensure
			one_more: instructions.count = old instructions.count + 1
			instruction_added: instructions.last = an_instruction
		end

invariant

	instructions_not_void: instructions /= Void
	instructions_not_empty: not instructions.is_empty
	no_void_instruction: not instructions.has (Void)

end -- class ET_COMPOUND
