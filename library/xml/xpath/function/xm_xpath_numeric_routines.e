indexing

	description:

		"Miscellaneous numeric support routines"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NUMERIC_ROUTINES

inherit

	ANY

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

feature -- Conversion

	item_to_double (a_item: XM_XPATH_ITEM): XM_XPATH_DOUBLE_VALUE is
			-- `an_item' as a double
		do
			if a_item = Void then
				create Result.make_nan
			elseif a_item.is_error then
				create Result.make_nan
				Result.set_last_error (a_item.error_value)
			else
				if a_item.is_boolean_value then
					a_item.as_boolean_value.convert_to_type (type_factory.double_type)
					Result := a_item.as_boolean_value.converted_value.as_double_value
				elseif a_item.is_numeric_value then
					a_item.as_numeric_value.convert_to_type (type_factory.double_type)
					Result := a_item.as_numeric_value.converted_value.as_double_value
				else
					create Result.make_from_string (a_item.string_value)
				end
			end
		ensure
			double_value_not_void: Result /= Void
		end

end

