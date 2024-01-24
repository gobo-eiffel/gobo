note

	description:

		"XPath error value types and codes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ERROR_TYPES

inherit

	ANY -- For SE 2.x, so that `is_equal' is exported

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

feature -- Access

	Static_error: INTEGER = 1
	Type_error: INTEGER = 2
	Dynamic_error: INTEGER = 3

end

