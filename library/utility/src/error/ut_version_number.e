note

	description:

		"Program version number message"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_VERSION_NUMBER

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (version: STRING)
			-- Create a new program version number message.
		require
			version_not_void: version /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (version, 1)
		end

feature -- Access

	default_template: STRING = "$0 version $1"
			-- Default template used to built the error message

	code: STRING = "UT0006"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = version number

end
