indexing
	
	description:
	
		"Objects that select from alternate xml-stylsheet PIs"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_PI_CHOOSER

feature -- Access

	selected_index (a_list: DS_LIST [STRING]): INTEGER is
			-- Index of chosen xml-stylesheet from within `a_list';
			-- The first entry in the list is the preferred stylesheet.
		require
			multiple_choices: a_list /= Void and then a_list.count > 1
		deferred
		ensure
			valid_choice: Result >= 1 and then Result <= a_list.count
		end

end
	
