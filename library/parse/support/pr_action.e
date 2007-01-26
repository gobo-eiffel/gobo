indexing

	description:

		"Semantic actions"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_ACTION

inherit

	DP_COMMAND
		redefine
			out, is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			out, is_equal
		end

create

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

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		do
			if ANY_.same_types (Current, other) then
				Result := text.is_equal (other.text)
			end
		end

feature -- Output

	out: STRING is
			-- Textual representation
		do
			Result := text
		end

invariant

	text_not_void: text /= Void

end
