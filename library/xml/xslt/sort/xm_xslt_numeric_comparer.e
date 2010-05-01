note

	description:

		"Objects that compare numeric strings"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMERIC_COMPARER

inherit
	
	KL_PART_COMPARATOR [XM_XPATH_ITEM]

feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN is
			-- Is `u' considered less than `v'?
		local
			l_string: STRING
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_double, l_other_double: DOUBLE
			l_first_nan, l_second_nan: BOOLEAN
		do
			if u.is_numeric_value then
				l_numeric_value := u.as_numeric_value
				if l_numeric_value.is_double and not l_numeric_value.is_nan then
					l_double := l_numeric_value.as_double
				else
					l_first_nan := True
				end
			else
				l_string := u.string_value
				if l_string.is_double then
					l_double := l_string.to_double
				else
					l_first_nan := True
				end	
			end

			if v.is_numeric_value then
				l_numeric_value := v.as_numeric_value
				if l_numeric_value.is_double and not l_numeric_value.is_nan then
				l_other_double := l_numeric_value.as_double
				else
					l_second_nan := True
				end
			else
				l_string := v.string_value
				if l_string.is_double then
					l_other_double := l_string.to_double
				else
					l_second_nan := True
				end	
			end			

			if l_first_nan then
				Result := not l_second_nan
			elseif l_second_nan then
				Result := False
			else
				Result := l_double < l_other_double
			end
		end

end
