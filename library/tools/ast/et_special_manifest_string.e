indexing

	description:

		"Eiffel manifest strings with special characters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SPECIAL_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

creation

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_position: like position) is
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*\"
			a_position_not_void: a_position /= Void
		do
			literal := a_literal
			position := a_position
		ensure
			literal_set: literal = a_literal
			position_set: position = a_position
		end

feature -- Access

	literal: STRING
			-- Literal value

feature -- Status report

	computed: BOOLEAN is
			-- Has manifest string been succesfully computed?
		do
			Result := value /= Void
		end

feature -- Compilation

	compute (error_handler: ET_ERROR_HANDLER) is
			-- Compute manifest string, expand special characters.
			-- Make result available in `value'.
		do
			-- TO DO.
			value := ""
		end

invariant

	-- valid_literal: regexp: \"([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*\"

end -- class ET_SPECIAL_MANIFEST_STRING
