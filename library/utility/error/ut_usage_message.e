indexing

	description:

		"Command-line usage messages"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_USAGE_MESSAGE

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (msg: STRING) is
			-- Create a new command-line usage message.
		require
			msg_not_void: msg /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (msg, 1)
		end

feature -- Access

	default_template: STRING is "usage: $0 $1"
			-- Default template used to built the error message

	code: STRING is "UT0005"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = message

end -- class UT_USAGE_MESSAGE
