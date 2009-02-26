indexing

	description:

		"Factories for Expat XML parsers"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EXPAT_PARSER_FACTORY

inherit

	XM_PARSER_FACTORY
		rename
			is_parser_available as is_expat_parser_available,
			new_parser as new_expat_parser
		end

feature -- Status report

	is_expat_parser_available: BOOLEAN is
			-- Is Expat XML parser available?
		do
			Result := False
		end

feature -- Access

	new_expat_parser: XM_PARSER is
			-- New Expat XML parser
		do
		ensure then
			not_possible: False
		end

end
