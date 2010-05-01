note
	
	description:
	
		"Objects that select the preferred xml-stylsheet PI"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_PREFERRED_PI_CHOOSER

inherit

	XM_XSLT_PI_CHOOSER

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	selected_index (a_list: DS_LIST [STRING]): INTEGER is
			-- Index of chosen xml-stylesheet from within `a_list'
		do
			Result := 1
		end

end
	
