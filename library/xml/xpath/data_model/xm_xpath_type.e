indexing

	description:

		"XPath nodes that have the type propert"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TYPE

feature -- Access

	type: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Type.
		do
         create Result.make (1)
	      Result.put_first (type_property)
		ensure then
			type: not Result.is_empty
		end

feature {NONE} -- Access
	
	type_property: XM_EXPANDED_QNAME
			-- Type property from the infoset.
			
end -- class XM_XPATH_TYPE
