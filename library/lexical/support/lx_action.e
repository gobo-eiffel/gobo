indexing

	description:

		"Semantic actions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_ACTION

inherit

	UT_COMMAND
		redefine
			out
		end

creation

	make

feature {NONE} -- Initialization

	make (a_text: like text) is
			-- Create a new semantic action.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Execution

	execute is
			-- Execute current command.
		do
		end

feature -- Access

	text: STRING
			-- Textual representation

feature -- Setting

	set_text (a_text: like text) is
			-- Set `text' to `a_text'.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Output

	out: STRING is
			-- Textual representation
		do
			Result := text
		end

invariant

	text_not_void: text /= Void

end -- class LX_ACTION
