indexing

	description:

		"Skeletons for parsers implemented with tables"

	remark:

		"To be used with 'geyacc --old_typing'. Use YY_NEW_PARSER_SKELETON and %
		%'geyacc --new_typing' instead, or switch to YY_OLD_PARSER_SKELETON."

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_PARSER_SKELETON [G]

obsolete

	"[030409] Use YY_OLD_PARSER_SKELETON or 'geyacc --new_typing' instead."

inherit

	YY_OLD_PARSER_SKELETON [G]

end
