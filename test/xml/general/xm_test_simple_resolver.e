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

	XM_RESOLVER_FACTORY
		export {NONE} all end

feature

	test_balanced is
			-- Test resolve/resolve_finish calls are balanced.
		local
			string_resolver: TEST_STRING_EXTERNAL_RESOLVER
		do
			create parser.make
			
			create string_resolver.make
			string_resolver.strings.put ("<!DOCTYPE doc SYSTEM 'dtd'><doc/>", "doc")
			string_resolver.strings.put ("<!ELEMENT doc EMPTY>", "dtd")
			parser.set_resolver (string_resolver)

			parser.parse_from_system ("doc")
			assert ("parsed", parser.is_correct)
			assert_equal ("balanced resolver", 0, string_resolver.depth)
		
				-- Second time to check resolver left in a good state.
			parser.parse_from_system ("doc")
			assert ("parsed second time", parser.is_correct)
			assert_equal ("balanced second time",  0, string_resolver.depth)
		end

	test_file is
			-- Test file URI resolver.
		do
			create parser.make
			parser.set_resolver (new_file_resolver_current_directory)
			
			parser.parse_from_system (Relative_data)
			assert ("parsed", parser.is_correct)
		
				-- Second time to check resolver left in a good state.
			parser.parse_from_system (Relative_data)
			assert ("parsed second time", parser.is_correct)
		end
	
	test_file_error is
			-- Test file error resolver.
		do
			create parser.make
			parser.set_resolver (new_file_resolver_current_directory)

				-- Parse broken file
			parser.parse_from_system (Brokensub_data)
			assert ("not parsed", not parser.is_correct)

				-- Parse correct file
			parser.parse_from_system (Relative_data)
			assert ("ok", parser.is_correct)
		end
		
	test_stream is
			-- Test parse_from_stream and resolver interaction.
		local
			a_stream: KL_STRING_INPUT_STREAM
		do
			create parser.make
			parser.set_resolver (new_file_resolver_current_directory)

			create a_stream.make (Relative_xml)
			parser.parse_from_stream (a_stream)
			assert ("parsed", parser.is_correct)
			
				-- Second time to check resolver left in a good state.
			create a_stream.make (Relative_xml)
			parser.parse_from_stream (a_stream)
			assert ("parsed second time", parser.is_correct)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
			-- Test parser.

	Relative_xml: STRING is "<!DOCTYPE doc [ <!ELEMENT doc (child*)> <!ELEMENT child EMPTY> <!ENTITY e SYSTEM 'data/relative2.xml'> ]><doc>&e;</doc>"
			-- Top level doc for stream test.

	Relative_data: STRING is "data/relative.xml"
	Brokensub_data: STRING is "data/brokensub.xml"

end
