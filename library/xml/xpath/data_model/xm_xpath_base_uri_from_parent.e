indexing

	description:

		"XPath nodes that use the Base URI of the parent."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BASE_URI_FROM_PARENT

feature -- Access

	base_uri: DS_ARRAYED_LIST [ANY_URI] is
			-- Base URI.
		do
			if not parent.is_empty then
create Result.make (1)
	Result := parent.first.base_uri
			else
create Result.make (0)
			end
		end
	
end
