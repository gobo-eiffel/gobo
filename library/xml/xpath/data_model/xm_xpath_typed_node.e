indexing

	description:

		"XPath nodes that have the type property"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TYPED_NODE

inherit

	XM_XPATH_NODE

feature -- Access

	type: INTEGER is
			-- Type
		do
			Result := type_property
		end

feature {NONE} -- Access

	type_property: INTEGER
			-- Type property from the infoset

end
