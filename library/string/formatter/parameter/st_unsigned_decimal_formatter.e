note

	description:

		"Formatters for unsigned integer parameters, $u"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNSIGNED_DECIMAL_FORMATTER

inherit

	ST_UNSIGNED_INTEGER_FORMATTER

create

	make

feature -- Access

	base: INTEGER is 10
			-- Base used to format integer;
			-- 8 for octal, 10 for decimal, 16 for hexadecimal, ...

end
