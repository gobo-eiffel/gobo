indexing

	description:

		"XPath nodes that do not have children"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NO_CHILDREN

invariant

	children_are_empty: children.is_empty
	
end -- class XM_XPATH_NO_CHILDREN
