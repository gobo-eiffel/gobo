indexing

	description:
	
		"Objects that collate strings"
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class ST_COLLATOR

feature -- Comparison

	compare (a_string, another_string: STRING): INTEGER is
			-- Compare `a_string' with `another_string'
		require
			first_string_not_void: a_string /= Void
			second_string_not_void: another_string /= Void
		deferred
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

end

	
