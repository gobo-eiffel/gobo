indexing

	description:

		"XPath nodes that may have a parent"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CHILD_NODE

inherit

	XM_XPATH_NODE
	
feature -- Access

	parent: XM_XPATH_NODE is
			-- Parent
		do
			Result := parent_property
		end

feature {NONE} -- Access

	parent_property: XM_XPATH_NODE
			-- Parent property from the infoset

end -- class XM_XPATH_CHILD_NODE
