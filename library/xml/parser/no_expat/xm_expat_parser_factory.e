indexing

	description:

		"Factory for expat parser, allows client code to be compiled when expat is not available"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EXPAT_PARSER_FACTORY

inherit

	XM_EXPAT_PARSER_FACTORY_INTERFACE

feature -- Factory

	is_expat_available: BOOLEAN is
			-- Is expat parser available?
		do
		end

	new_expat_parser: XM_PARSER is
			-- Create expat parser.
		do
		ensure then
			not_possible: false
		end

end
