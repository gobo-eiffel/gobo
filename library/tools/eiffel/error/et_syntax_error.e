indexing

	description:

		"Eiffel syntax errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYNTAX_ERROR

inherit

	ET_ERROR

creation

	make

feature {NONE} -- Initialization

	make (a_position: ET_POSITION) is
			-- Create a new Eiffel syntax error at position `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (a_position.to_string, 1)
		end

feature -- Access

	default_template: STRING is
			-- Default template used to built the error message
		once
			Result := "Syntax error.%N$1%N"
		end

	code: STRING is
			-- Error code
		once
			Result := "SERR"
		end

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = position

end
