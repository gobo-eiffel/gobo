indexing

	description:

		"Constants for requesting cardinality"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CARDINALITY

feature -- Access

	Required_cardinality_empty, Required_cardinality_optional, Required_cardinality_exactly_one,
	Required_cardinality_one_or_more, Required_cardinality_zero_or_more: INTEGER is unique

feature -- Status report

	is_valid_required_cardinality (request: INTEGER): BOOLEAN is
			-- Is `request' a valid cardinality requirement?
		do
			Result := request = Required_cardinality_empty
				or else request = Required_cardinality_optional
				or else request = Required_cardinality_exactly_one
				or else request = Required_cardinality_one_or_more
				or else request = Required_cardinality_zero_or_more
		end

end
	
