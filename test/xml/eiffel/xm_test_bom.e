indexing

	description:

		"Test XML byte order marker (BOM)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
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
		do
			create parser.make
			parser.set_resolver (new_file_resolver_current_directory)
			parser.parse_from_system ("data/utf8bom.xml")
			assert ("utf8_bom", parser.is_correct)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER

end
