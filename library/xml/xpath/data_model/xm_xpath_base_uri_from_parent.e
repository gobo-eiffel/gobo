indexing

	description:

		"XPath nodes that use the Base URI of the parent"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BASE_URI_FROM_PARENT

inherit

	XM_XPATH_NODE
	
feature -- Access

	base_uri: UC_UTF8_STRING is
			-- Base URI
		do
			if parent /= Void then
				Result := parent.base_uri
			else
				Result := Void
			end
		end

end

