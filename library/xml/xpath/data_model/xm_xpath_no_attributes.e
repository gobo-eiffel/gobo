indexing

	description:

		"XPath nodes that are not elements"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NO_ATTRIBUTES


feature -- Status report

	is_nilled: DL_ARRAYED_LIST [BOOLEAN]
			-- True if "nilled".
			-- Change to a three-valued logic result?
		do
			create Result.make (0)
		ensure
			unknown_nilled: Result.is_empty
		end
	
invariant

	attributes_are_empty: attributes.is_empty
	namespaces_are_empty: namespaces.is_empty
	
end
