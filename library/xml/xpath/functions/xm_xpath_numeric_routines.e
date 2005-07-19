indexing

	description:

		"Miscellaneous numeric support routines"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NUMERIC_ROUTINES

inherit

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

feature -- Conversion

	item_to_double (an_item: XM_XPATH_ITEM): XM_XPATH_DOUBLE_VALUE is
			-- `an_item' as a double
		local
			a_string: STRING
		do
			if an_item = Void then
				create Result.make_nan
			elseif an_item.is_error then
				create Result.make_nan
			else
				if an_item.is_boolean_value then
					Result := an_item.as_boolean_value.convert_to_type (type_factory.double_type).as_double_value
				elseif an_item.is_numeric_value then
					Result := an_item.as_numeric_value.convert_to_type (type_factory.double_type).as_double_value
				else
					a_string := an_item.string_value
					if a_string.is_double then
						create Result.make_from_string (a_string)
					else
						create Result.make_nan
					end
				end
			end
		ensure
			double_value_not_void: Result /= Void
		end

end
