note

	description:

		"Hash tables of strings"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_STRING_8_HASH_TABLE

inherit

	DS_HASH_TABLE [STRING_8, STRING_8]

	KL_STRING_8_VALUES
		undefine
			is_equal,
			copy
		end

create

	make,
	make_equal,
	make_default,
	make_map,
	make_map_equal,
	make_map_default,
	make_with_equality_testers

end
