indexing

	description:

		"XPath nodes that lack a type"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TYPELESS_NODE

inherit

	XM_XPATH_NODE
	
feature -- Access

	type: XM_EXPANDED_QNAME is
			-- Type
		do
			Result := Void
		ensure then
			no_type: Result /= Void
		end
	
end

