indexing

	description: "Format ?x or ?X to produce hexadecimal output"

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class

	ST_HEX_FORMATTER

inherit

	ST_UNSIGNED_INTEGER_FORMATTER
		rename
			make as make_integer
		end

creation

	make

feature -- Initialization

	make (a_uppercase_digits: BOOLEAN) is
			-- If `a_uppercase_digits' then uppercase digits are used,
			-- else lowercase digits.
		do
			make_integer
			base := 16
			use_uppercase_digits := a_uppercase_digits
		end

invariant

	base_is_hex: base = 16

end
