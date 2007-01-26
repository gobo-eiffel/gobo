indexing

	description:

		"Unicode constants"

	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEUC_CONSTANTS

inherit

	UC_UNICODE_CONSTANTS

feature -- Access

	Field_count: INTEGER is 15
			-- Number of fields in UnicodeData.txt

	Bad_decimal_value: INTEGER_8 is 127
			-- Decimal value for code points which are not category Nd

end
