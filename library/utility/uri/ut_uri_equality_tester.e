indexing

	description:

		"Equality tester for UT_URI, based on full_reference equality"
	
	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004, Eric Bezault and others"
	revision: "$Revision$"
	date: "$Date$"

class UT_URI_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [UT_URI]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature

	test (v, g: UT_URI): BOOLEAN is
			-- Compare UT_URIs based on `full_reference'
		do
			Result := (v = g) or else 
				((v /= Void and g /= Void) 
					and then STRING_.same_string (v.full_reference, g.full_reference))
		end

end
