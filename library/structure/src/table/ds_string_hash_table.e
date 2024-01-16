note

	description:

		"Hash tables of strings"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class DS_STRING_HASH_TABLE

inherit

	DS_HASH_TABLE [STRING, STRING]

	KL_STRING_VALUES
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
