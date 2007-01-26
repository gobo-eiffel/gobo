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
			Result := True
		end

	is_expat_available: BOOLEAN is
			-- Is Expat XML parser available?
		obsolete
			"[020812] Use `is_expat_parser_available' instead."
		do
			Result := is_expat_parser_available
		end

feature -- Access

	new_expat_parser: XM_PARSER is
			-- New Expat XML parser
		do
			create {XM_EXPAT_PARSER} Result.make
		end

end
