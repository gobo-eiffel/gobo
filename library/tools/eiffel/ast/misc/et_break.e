indexing

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BREAK

create

	make

feature {NONE} -- Initialization

	make (a_text: like text) is
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Access

	text: STRING
			-- Text of break

feature -- Status report

	has_comment: BOOLEAN is
			-- Does current break contain a comment?
		do
			Result := text.has ('-')
		end

invariant

	text_not_void: text /= Void

end
