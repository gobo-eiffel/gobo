indexing

	description:

		"XSLT patterns that matches a particular local name and node type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LOCAL_NAME_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			fingerprint, node_kind
		redefine
			default_priority
		end

	XM_XPATH_LOCAL_NAME_TEST

creation

	make

feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
				create Result.make_from_string ("-0.25")
		end

end
	
