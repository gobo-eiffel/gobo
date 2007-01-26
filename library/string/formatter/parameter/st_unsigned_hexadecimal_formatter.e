indexing

	description:

		"Formatters for unsigned integer parameters, $x or $X"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNSIGNED_HEXADECIMAL_FORMATTER

inherit

	ST_UNSIGNED_INTEGER_FORMATTER

create

	make

feature -- Access

	base: INTEGER is 16
			-- Base used to format integer;
			-- 8 for octal, 10 for decimal, 16 for hexadecimal, ...

end
