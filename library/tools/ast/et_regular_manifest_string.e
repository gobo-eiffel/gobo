indexing

	description:

		"Eiffel manifest strings with no special character"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_REGULAR_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

creation

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_position: like position) is
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"[^"%\n]*\"
			a_position_not_void: a_position /= Void
		do
			value := a_literal
			position := a_position
		ensure
			literal_set: literal = a_literal
			position_set: position = a_position
		end

feature -- Access

	literal: STRING is
			-- Literal value
		do
			Result := value
		end

feature -- Status report

	computed: BOOLEAN is True
			-- Has manifest string been succesfully computed?

feature -- Compilation

	compute (error_handler: ET_ERROR_HANDLER) is
			-- Compute manifest string, expand special characters.
			-- Make result available in `value'.
		do
			-- Do nothing.
		end

invariant

	-- valid_literal: regexp: \"[^"%\n]*\"

end -- class ET_REGULAR_MANIFEST_STRING
