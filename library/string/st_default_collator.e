indexing

	description:
	
		"Objects that collate strings according to their three_way_comparison routine"
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class ST_DEFAULT_COLLATOR

inherit

	ST_COLLATOR

feature -- Comparison

	compare (a_string, another_string: STRING): INTEGER is
			-- Compare `a_string' with `another_string'
		do
			Result := a_string.three_way_comparison (another_string)
		end

end
