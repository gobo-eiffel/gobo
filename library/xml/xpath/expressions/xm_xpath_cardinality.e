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

	multiply_cardinality (c1, c2: INTEGER): INTEGER is
			-- Multiply cardinalities
		do
			if c1 = Required_cardinality_empty or else c2 = Required_cardinality_empty then
				Result := Required_cardinality_empty
			elseif c2 = Required_cardinality_exactly_one then
				Result := c1
			elseif c1 = Required_cardinality_exactly_one then
				Result := c2
			elseif c1 = Required_cardinality_optional and then c2 = Required_cardinality_optional then
				Result := Required_cardinality_optional
			else
				Result := Required_cardinality_zero_or_more
			end
		ensure
			valid_cardinality: is_valid_required_cardinality (Result)
		end

			
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
	
