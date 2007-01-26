indexing

	description:

		"Objects that compare numeric strings"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMERIC_COMPARER

inherit
	
	KL_COMPARATOR [XM_XPATH_ITEM]

feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN is
			-- Is `u' considered less than `v'?
		local
			a_string: STRING
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_double, another_double: DOUBLE
			is_first_nan, is_second_nan: BOOLEAN
		do
			if u.is_numeric_value then
				a_numeric_value := u.as_numeric_value
				if a_numeric_value.is_double then
				a_double := a_numeric_value.as_double
				else
					is_first_nan := True
				end
			else
				a_string := u.string_value
				if a_string.is_double then
					a_double := a_string.to_double
				else
					is_first_nan := True
				end	
			end

			if v.is_numeric_value then
				a_numeric_value := v.as_numeric_value
				if a_numeric_value.is_double then
				another_double := a_numeric_value.as_double
				else
					is_second_nan := True
				end
			else
				a_string := v.string_value
				if a_string.is_double then
					another_double := a_string.to_double
				else
					is_second_nan := True
				end	
			end			

			if is_first_nan then
				Result := not is_second_nan
			elseif is_second_nan then
				Result := False
			else
				Result := a_double < another_double
			end
		end

end
