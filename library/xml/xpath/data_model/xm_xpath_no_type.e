indexing

	description:

		"XPath nodes that lack a type"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NO_TYPE

feature -- Access

	type: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Type.
		do
         create Result.make (0)
		ensure
			no_type: Result.is_empty
		end		
end -- class XM_XPATH_NO_TYPE
