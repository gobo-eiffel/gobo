indexing

	description:
	
		"Equality tester between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
		
	
class UC_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER[STRING]
		undefine
			test
		end
		
	KL_STRING_ROUTINES
		rename
			same_unicode_string as test
		export
			{NONE} all
		end

end
