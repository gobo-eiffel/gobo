indexing

	description:

		"XPath nodes that can have a parent"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PARENT

feature -- Access

	parent: DS_ARRAYED_LIST [XM_XPATH_NODE] is
			-- Parent.
		do
			create Result.make (1)
	      Result.put_first (parent_property)
		ensure then
			parent: not Result.is_empty
		end

feature {NONE} -- Access
	
	parent_property: XM_XPATH_NODE
			-- Parent property from the infoset.
			
end -- class XM_XPATH_PARENT
