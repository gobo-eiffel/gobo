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

feature -- Conversion

	item_to_double (an_item: XM_XPATH_ITEM): XM_XPATH_DOUBLE_VALUE is
			-- `an_item' as a double
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_string: STRING
		do
			if an_item = Void then
				create Result.make_nan
			elseif an_item.is_error then
				create Result.make_nan
			else
				a_boolean_value ?= an_item
				if a_boolean_value /= Void then
					Result ?= a_boolean_value.convert_to_type (type_factory.double_type)
				else
					a_numeric_value ?= an_item
					if a_numeric_value /= Void then
						Result ?= a_numeric_value.convert_to_type (type_factory.double_type)
					else
						 a_string := an_item.string_value
						if a_string.is_double then
							create Result.make_from_string (a_string)
						else
							create Result.make_nan
						end
					end
				end
			end
		ensure
			double_value_not_void: Result /= Void
		end

end
