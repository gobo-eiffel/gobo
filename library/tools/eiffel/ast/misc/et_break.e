indexing

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BREAK

creation

	make

feature {NONE} -- Initialization

	make (a_text: like text; a_position: like position) is
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
			a_position_not_void: a_position /= Void
		do
			text := a_text
			position := a_position
		ensure
			text_set: text = a_text
			position_set: position = a_position
		end

feature -- Access

	text: STRING
			-- Text of break

	position: ET_POSITION
			-- Position in source code

invariant

	text_not_void: text /= Void
	position_not_void: position /= Void

end -- class ET_BREAK
