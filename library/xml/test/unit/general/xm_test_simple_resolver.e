note

	description:

		"Test XML simple resolver(s)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"

class XM_TEST_SIMPLE_RESOLVER

inherit

	TS_TEST_CASE

	XM_RESOLVER_FACTORY
		export {NONE} all end

create

	make_default

feature -- Test

	test_balanced
			-- Test resolve/resolve_finish calls are balanced.
		local
			string_resolver: TEST_STRING_EXTERNAL_RESOLVER
			parser: XM_EIFFEL_PARSER
		do
			create parser.make

			create string_resolver.make
			string_resolver.strings.put ("<!DOCTYPE doc SYSTEM 'dtd'><doc/>", "doc")
			string_resolver.strings.put ("<!ELEMENT doc EMPTY>", "dtd")
			parser.set_resolver (string_resolver)

			parser.parse_from_system ("doc")
			assert ("parsed", parser.is_correct)
			assert_integers_equal ("balanced resolver", 0, string_resolver.depth)

				-- Second time to check resolver left in a good state.
			parser.parse_from_system ("doc")
			assert ("parsed second time", parser.is_correct)
			assert_integers_equal ("balanced second time",  0, string_resolver.depth)
		end

	test_file
			-- Test file URI resolver.
		local
			parser: XM_EIFFEL_PARSER
		do
			create parser.make
			parser.set_resolver (new_file_resolver_with_uri (data_uri))

			parser.parse_from_system (Relative_data)
			assert ("parsed", parser.is_correct)

				-- Second time to check resolver left in a good state.
			parser.parse_from_system (Relative_data)
			assert ("parsed second time", parser.is_correct)
		end

	test_non_existing
			-- Test non existing.
		local
			parser: XM_EIFFEL_PARSER
		do
			create parser.make
			parser.set_resolver (new_file_resolver_with_uri (data_uri))

			parser.parse_from_system ("data/not.xml")
			assert ("fails", not parser.is_correct)

				--Second time to check resolver left in a good state.
			parser.parse_from_system (Relative_data)
			assert ("parsed second time", parser.is_correct)
		end

	test_file_error
			-- Test file error resolver.
		local
			parser: XM_EIFFEL_PARSER
		do
			create parser.make
			parser.set_resolver (new_file_resolver_with_uri (data_uri))

				-- Parse broken file
			parser.parse_from_system (Brokensub_data)
			assert ("not parsed", not parser.is_correct)
			assert_integers_equal ("position count", 2, parser.positions.count)
			assert_position ("top", parser.position, 1, 8)
			assert_position ("parent ", parser.positions.item (2), 6, 1)

				-- Parse correct file after error
				-- to check resolver left in a good state.
			parser.parse_from_system (Relative_data)
			assert ("ok", parser.is_correct)
		end

	test_stream
			-- Test parse_from_stream and resolver interaction.
		local
			a_stream: KL_STRING_INPUT_STREAM
			parser: XM_EIFFEL_PARSER
		do
			create parser.make
			parser.set_resolver (new_file_resolver_with_uri (data_uri))

			create a_stream.make (Relative_xml)
			parser.parse_from_stream (a_stream)
			assert ("parsed", parser.is_correct)

				-- Second time to check resolver left in a good state.
			create a_stream.make (Relative_xml)
			parser.parse_from_stream (a_stream)
			assert ("parsed second time", parser.is_correct)
		end

feature {NONE} -- Implementation

	assert_position (a_prefix: STRING; a_position: XM_POSITION; a_row: INTEGER; a_column: INTEGER)
			-- Test position.
		require
			a_prefix_not_void: a_prefix /= Void
			a_position_not_void: a_position /= Void
		do
			assert_integers_equal (a_prefix + " row", a_row, a_position.row)
			assert_integers_equal (a_prefix + " column", a_column, a_position.column)
		end

	Relative_xml: STRING = "<!DOCTYPE doc [ <!ELEMENT doc (child*)> <!ELEMENT child EMPTY> <!ENTITY e SYSTEM 'data/relative2.xml'> ]><doc>&e;</doc>"
			-- Top level doc for stream test.

	Relative_data: STRING = "data/relative.xml"
			-- Data filename "relative.xml"

	Brokensub_data: STRING = "data/brokensub.xml"
			-- Data filename "brokensub.xml"

	data_dirname: STRING
			-- Name of parent of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xml", "test", "unit", "general">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	data_uri: UT_URI
			-- Base URI for data files
		once
			Result := File_uri.filename_to_uri (file_system.pathname (data_dirname, "dummy.xml"))
		ensure
			data_uri_not_void: Result /= Void
		end

end
