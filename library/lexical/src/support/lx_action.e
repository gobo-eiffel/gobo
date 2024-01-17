note

	description:

		"Semantic actions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"

class LX_ACTION

inherit

	DP_COMMAND
		redefine
			out
		end

create

	make

feature {NONE} -- Initialization

	make (a_text: like text)
			-- Create a new semantic action.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Execution

	execute
			-- Execute current command.
		do
		end

feature -- Access

	text: STRING
			-- Textual representation

feature -- Setting

	set_text (a_text: like text)
			-- Set `text' to `a_text'.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Output

	out: STRING
			-- Textual representation
		do
			Result := text
		end

invariant

	text_not_void: text /= Void

end
