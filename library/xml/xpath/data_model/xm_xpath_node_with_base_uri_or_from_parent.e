indexing

	description:

		"XPath nodes that can use the Base URI property or that of the parent."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_WITH_BASE_URI_OR_FROM_PARENT

inherit

	XM_XPATH_NODE
	
	XM_XPATH_BASE_URI
	
feature -- Access

	base_uri: UC_UTF8_STRING is
			-- Base URI
			-- Algorithm:
			-- Use the base_uri_property if it is not Void.
			-- Otherwise, if the node has a parent,
			--  then use the parent's base_uri.
			-- Otherwise return Void.
		do
			if base_uri_property /= Void then
				Result := base_uri_property
			elseif parent /= Void then
				Result := parent.base_uri
			else
				Result := Void
			end
		end

end

