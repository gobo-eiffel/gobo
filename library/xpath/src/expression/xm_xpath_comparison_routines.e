note

	description:

		"Objects that provide comparison routines"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_COMPARISON_ROUTINES

inherit

	ANY

	XM_XPATH_TOKENS
		export {NONE} all end

feature -- Status report

	is_general_comparison_operator (an_operator: INTEGER): BOOLEAN
			-- is `an_operator' a general comparison operator
		do
			inspect
				an_operator
			when Equals_token, Greater_equal_token, Not_equal_token, Less_than_token, Greater_than_token, Less_equal_token then
				Result := True
			else
				Result := False
			end
		end

	is_value_comparison_operator (an_operator: INTEGER): BOOLEAN
			-- is `an_operator' a value comparison operator
		do
			inspect
				an_operator
			when Fortran_equal_token, Fortran_greater_equal_token, Fortran_not_equal_token, Fortran_less_than_token, Fortran_greater_than_token, Fortran_less_equal_token then
				Result := True
			else
				Result := False
			end
		end

feature -- Conversion

	singleton_value_operator (an_operator: INTEGER): INTEGER
			-- Singleton form of the general comparison operator, e.g. Fortran_equal_token for Equals_token, etc
		require
			valid_comparison_operator: is_general_comparison_operator (an_operator) or else is_value_comparison_operator (an_operator)
		do
			inspect
				an_operator
			when Equals_token  then
				Result := Fortran_equal_token
			when Greater_equal_token then
				Result := Fortran_greater_equal_token
			when Greater_than_token then
				Result := Fortran_greater_than_token
			when Not_equal_token then
				Result := Fortran_not_equal_token
			when Less_than_token then
				Result := Fortran_less_than_token
			when Less_equal_token then
				Result := Fortran_less_equal_token
			else

				-- Must already be a value comparsion operator

				Result := an_operator
			end
		ensure
			value_comparsion: is_value_comparison_operator (Result)
		end

	inverse_operator (an_operator: INTEGER): INTEGER
			-- Inverse of `an_operator'
		require
			valid_comparison_operator: is_general_comparison_operator (an_operator) or else is_value_comparison_operator (an_operator)
		do
			inspect
				an_operator
			when Equals_token, Fortran_equal_token, Not_equal_token, Fortran_not_equal_token then
				Result := an_operator -- symmetrical operators
			when Greater_equal_token then
				Result := Less_equal_token
			when Greater_than_token then
				Result := Less_than_token
			when Less_than_token then
				Result := Greater_than_token
			when Less_equal_token then
				Result := Greater_equal_token
			when Fortran_greater_equal_token then
				Result := Fortran_less_equal_token
			when Fortran_greater_than_token then
				Result := Fortran_less_than_token
			when Fortran_less_than_token then
				Result := Fortran_greater_than_token
			when Fortran_less_equal_token then
				Result := Fortran_greater_equal_token
			end
		end

end

