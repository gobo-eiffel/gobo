indexing

	description:

		"XSLT patterns that matches a particular name and node type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAME_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			item_type, fingerprint
		redefine
			default_priority
		end

	XM_XPATH_NAME_TEST

creation

	make, make_same_type

feature -- Access

		frozen default_priority: DOUBLE is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			Result := 0.0
		end

end
	
