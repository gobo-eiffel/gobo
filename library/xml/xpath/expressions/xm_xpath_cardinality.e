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

	is_valid_required_cardinality (a_request: INTEGER): BOOLEAN is
			-- Is `a_request' a valid cardinality requirement?
		do
			Result := a_request = Required_cardinality_empty
				or else a_request = Required_cardinality_optional
				or else a_request = Required_cardinality_exactly_one
				or else a_request = Required_cardinality_one_or_more
				or else a_request = Required_cardinality_zero_or_more
		end

	is_cardinality_allows_many (a_request: INTEGER): BOOLEAN is
			-- Does `a_request' subsume allows many?
		do
			Result := a_request = Required_cardinality_one_or_more or else a_request = Required_cardinality_zero_or_more
		end

	is_cardinality_allows_zero (a_request: INTEGER): BOOLEAN is
			-- Does `a_request' subsume allow zero?
		do
			Result := a_request = Required_cardinality_empty or else a_request = Required_cardinality_optional or else a_request = Required_cardinality_zero_or_more
		end

feature -- Conversion

	cardinalities_to_integer (a_cardinality_set:  ARRAY [BOOLEAN]): INTEGER is
			-- Compressed cardinalities
		require
			cardinalities_not_void: a_cardinality_set /= Void and then a_cardinality_set.count = 3
		do
			if a_cardinality_set.item (1) then
				if a_cardinality_set.item (2) then
					if a_cardinality_set.item (3) then

						-- All 3 `True'
						
						Result :=  Required_cardinality_zero_or_more
					else
						Result := Required_cardinality_optional
					end
				else
						check
							zero_or_many_not_allowed: not a_cardinality_set.item (3)
						end
					Result := Required_cardinality_empty
				end
			else
				if a_cardinality_set.item (2) then
					if a_cardinality_set.item (3) then
						Result := Required_cardinality_one_or_more
					else
						Result := Required_cardinality_exactly_one
					end	
				else

					--All 3 `False'

						check
							all_three_cardinalities_false_disallowed: False
						end
				end
			end
		ensure
			strictly_positive_result: Result > 0
		end

end
	
