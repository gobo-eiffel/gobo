indexing

	description:
		
		"Test XML simple resolver(s)"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_SIMPLE_RESOLVER

inherit
	
	TS_TEST_CASE

feature

	test_balanced is
		
		do
			make_parser
			parser.parse_from_system ("doc")
			assert ("parsed", parser.is_correct)
			assert_equal ("balanced resolver", 0, string_resolver.depth)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
			-- Test parser.
	string_resolver: TEST_STRING_EXTERNAL_RESOLVER
			-- Resolver with debug info.

	make_parser is
			-- Create parser.
		do
			create parser.make
			
			create string_resolver.make
			string_resolver.strings.put ("<!DOCTYPE doc SYSTEM 'dtd'><doc/>", "doc")
			string_resolver.strings.put ("<!ELEMENT doc EMPTY>", "dtd")

			parser.set_resolver (string_resolver)
		end

end
