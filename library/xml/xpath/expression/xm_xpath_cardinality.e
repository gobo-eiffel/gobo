note

	description:

		"Constants for requesting cardinality"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CARDINALITY

feature -- Access

	Required_cardinality_empty: INTEGER is 1
	Required_cardinality_optional: INTEGER is 2
	Required_cardinality_exactly_one: INTEGER is 3
	Required_cardinality_one_or_more: INTEGER is 4
	Required_cardinality_zero_or_more: INTEGER is 5
	Required_cardinality_many: INTEGER is 6

	multiply_cardinality (c1, c2: INTEGER): INTEGER is
			-- Multiply two cardinalities
		do
			if c1 = Required_cardinality_empty or  c2 = Required_cardinality_empty then
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

	add_cardinality (c1, c2: INTEGER): INTEGER is
			-- Addition of two cardinalities
		require
			valid_c1: is_valid_required_cardinality (c1)
			valid_c2: is_valid_required_cardinality (c2)
		local
			l_allows_zero: BOOLEAN
		do
			if c1 = Required_cardinality_empty then
				Result := c2
			elseif c2 = Required_cardinality_empty then
				Result := c1
			else
				l_allows_zero := is_cardinality_allows_zero (c1) and then is_cardinality_allows_zero (c2)
				if l_allows_zero then
					Result := Required_cardinality_zero_or_more
				else
					Result := Required_cardinality_one_or_more
				end
			end
		ensure
			valid_cardinality: is_valid_required_cardinality (Result)
		end

feature -- Status report

	is_valid_required_cardinality (a_request: INTEGER): BOOLEAN is
			-- Is `a_request' a valid cardinality requirement?
		do
			Result := a_request = Required_cardinality_empty or
				a_request = Required_cardinality_optional or
				a_request = Required_cardinality_exactly_one or
				a_request = Required_cardinality_one_or_more or
				a_request = Required_cardinality_zero_or_more or
				a_request = Required_cardinality_many
		end

	is_cardinality_allows_many (a_request: INTEGER): BOOLEAN is
			-- Does `a_request' subsume allows many?
		do
			Result := a_request = Required_cardinality_one_or_more or a_request = Required_cardinality_zero_or_more or a_request = Required_cardinality_many
		end

	is_cardinality_allows_zero (a_request: INTEGER): BOOLEAN is
			-- Does `a_request' subsume allow zero?
		do
			Result := a_request = Required_cardinality_empty or a_request = Required_cardinality_optional or a_request = Required_cardinality_zero_or_more
		end

feature -- Conversion

	cardinalities_to_integer (a_zero, a_one, a_many: BOOLEAN): INTEGER is
			-- Compressed cardinalities
		do
			if a_zero and a_one and a_many then
				Result :=  Required_cardinality_zero_or_more
			elseif a_zero and a_one then
				Result := Required_cardinality_optional
			elseif a_one and a_many then
				Result := Required_cardinality_one_or_more
			elseif a_one then
				Result := Required_cardinality_exactly_one
			elseif a_many then
				Result := Required_cardinality_many
			else
				Result := Required_cardinality_empty
			end
		ensure
			strictly_positive_result: Result > 0
		end

	cardinality_in_english (a_cardinality: INTEGER): STRING is
			-- English description
		require
			cardinality_in_range: Required_cardinality_empty <= a_cardinality and then a_cardinality <= Required_cardinality_zero_or_more
		do
			inspect
				a_cardinality
			when Required_cardinality_empty then
				Result := "exactly zero"
			when Required_cardinality_optional then
				Result := "zero or one"
			when Required_cardinality_exactly_one then
				Result := "exactly one"
			when Required_cardinality_one_or_more then
				Result := "one or more"
			when Required_cardinality_zero_or_more then
				Result := "zero or more"
			else
				Result := "more than one"
			end
		ensure
			description_not_void: Result /= Void
		end

end
	
