indexing

	description:

		"Error: No XML parser available"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_NO_PARSER_AVAILABLE_ERROR

inherit

	ET_XACE_ERROR

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new "no parser available" error.
		do
			!! parameters.make (1, 0)
		end

feature -- Access

	default_template: STRING is "No XML parser available"
			-- Default template used to built the error message

	code: STRING is "XA0006"
			-- Error code

end
