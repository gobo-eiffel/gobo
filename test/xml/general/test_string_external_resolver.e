indexing

	description:
		
		"String resolver counting events for testing"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_STRING_EXTERNAL_RESOLVER

inherit
	
	XM_STRING_EXTERNAL_RESOLVER
		redefine
			resolve,
			resolve_finish
		end

create

	make

feature

	depth: INTEGER

	resolve (a: STRING) is
		do
			depth := depth + 1
			Precursor (a)
		end

	resolve_finish is
		do
			depth := depth - 1
		end

end
