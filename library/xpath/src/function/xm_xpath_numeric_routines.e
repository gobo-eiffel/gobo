note

	description:

		"Miscellaneous numeric support routines"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NUMERIC_ROUTINES

inherit

	ANY

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

feature -- Conversion

	item_to_double (a_item: detachable XM_XPATH_ITEM): XM_XPATH_DOUBLE_VALUE
			-- `an_item' as a double
		do
			if a_item = Void then
				create Result.make_nan
			elseif attached a_item.error_value as l_error_value then
				check is_error: a_item.is_error end
				create Result.make_nan
				Result.set_last_error (l_error_value)
			else
				if a_item.is_boolean_value then
					a_item.as_boolean_value.convert_to_type (type_factory.double_type)
					check postcondition_of_convert_to_type: attached a_item.as_boolean_value.converted_value as l_converted_value then
						Result := l_converted_value.as_double_value
					end
				elseif a_item.is_numeric_value then
					a_item.as_numeric_value.convert_to_type (type_factory.double_type)
					check postcondition_of_convert_to_type: attached a_item.as_numeric_value.converted_value as l_converted_value then
						Result := l_converted_value.as_double_value
					end
				else
					create Result.make_from_string (a_item.string_value)
				end
			end
		ensure
			double_value_not_void: Result /= Void
		end

end

