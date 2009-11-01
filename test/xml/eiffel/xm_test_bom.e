indexing

	description:

		"Test XML byte order marker (BOM)"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_BOM

inherit

	TS_TEST_CASE
	
	XM_RESOLVER_FACTORY
		export {NONE} all end

create

	make_default

feature -- Test(s)

	test_utf_bom is
			-- Test BOM used as UTF-8 file marker.
		local
			l_uri: UT_URI
		do
			create parser.make
			l_uri := File_uri.filename_to_uri (file_system.pathname (data_dirname, "dummy.xml"))
			parser.set_resolver (new_file_resolver_with_uri (l_uri))
			parser.parse_from_system ("data/utf8bom.xml")
			assert ("utf8_bom", parser.is_correct)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
			-- XML parser

	data_dirname: STRING is
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "xml", "eiffel">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

end
