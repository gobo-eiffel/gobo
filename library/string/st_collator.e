indexing

	description:
	
		"Objects that collate strings"
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class ST_COLLATOR

inherit

	KL_COMPARATOR  [STRING]

feature -- Comparison

	compare (a_string, another_string: STRING): INTEGER is
			-- Compare `a_string' with `another_string'
		require
			first_string_not_void: a_string /= Void
			second_string_not_void: another_string /= Void
		do

			-- Default implementation is to compare using Unicode code points

			Result := a_string.three_way_comparison (another_string)
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

	less_than (u, v: STRING): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := compare (u, v) = -1
		end

end

	
