indexing

	description:

		"XSLT format-number() sub-pictures"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SUB_PICTURE

inherit

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_picture: STRING; a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Establish invariant.
		require
			picture_string_not_void:	 a_picture /= Void
			decimal_format_not_void: a_format /= Void
		do
			
			todo ("make", False)
		end

end
	
