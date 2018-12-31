note

	description:

		"Error: Invalid regular expression"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_INVALID_REGULAR_EXPRESSION_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_regexp: STRING)
			-- Create a new error reporting that the regular
			-- expression `a_regexp' is_invalid.
		require
			a_regexpe_not_void: a_regexp /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (a_regexp, 1)
		end

feature -- Access

	default_template: STRING = "$0: invalid regular expression '$1'"
			-- Default template used to built the error message

	code: STRING = "UT0013"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = dirname

end
