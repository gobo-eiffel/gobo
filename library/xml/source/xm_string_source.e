indexing

	description:

		"Strings as source of XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_STRING_SOURCE

inherit

	XM_SOURCE
		redefine
			out
		end

feature -- Out

	out: STRING is 
			-- STRING.
		do
			Result := "STRING" 
		end
	
end
