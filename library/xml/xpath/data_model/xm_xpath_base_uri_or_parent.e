indexing

	description:

		"XPath nodes that can use the Base URI property or that of the parent."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BASE_URI_OR_PARENT

inherit

	XM_XPATH_BASE_URI
	
feature -- Access

	base_uri: DS_ARRAYED_LIST [ANY_URI] is
			-- Base URI.
			-- Algorithm:
			-- Use the base_uri_property if it is not Void.
			-- Otherwise, if the node has a parent,
			--  then use the parent's base_uri.
			-- Otherwise return an empty list.
		do
			if base_uri_property /= Void then
create Result.make (1)
	Result.put_first (base_uri_property)
			elseif not parent.is_empty then
				Result := parent.first.base_uri
			else
create Result.make (0)
			end
		end
	
end
