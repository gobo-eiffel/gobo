indexing
	
	description:
	
		"Test namespace resolving"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_NAMESPACE

inherit

	TS_TEST_CASE

feature

	test_simple is
		do
			assert_namespace ("element",
				"<ns:doc xmlns:ns='uri'/>",
				"<{uri}doc></{uri}doc>")
		end

	test_with_xmlns is
		do
			assert_namespace_with_xmlns ("element",
				"<ns:doc xmlns:ns='uri'/>",
				"<{uri}doc {http://www.w3.org/2000/xmlns/}ns=%"uri%"></{uri}doc>")
			assert_namespace_with_xmlns ("attribute",
				"<ns:doc a='foo' xmlns:ns='uri' ns:b='bar'/>",
				"<{uri}doc a=%"foo%" {http://www.w3.org/2000/xmlns/}ns=%"uri%" {uri}b=%"bar%"></{uri}doc>")

		end

feature {NONE} -- Implementation

	assert_namespace_with_xmlns (a_name: STRING; a_xml: STRING; a_parsed: STRING) is
		do
			assert_namespace_impl (a_name, True, a_xml, a_parsed)
		end
		
	assert_namespace (a_name: STRING; a_xml: STRING; a_parsed: STRING) is
		do
			assert_namespace_impl (a_name, False, a_xml, a_parsed)
		end
	
	assert_namespace_impl (a_name: STRING; with_xmlns: BOOLEAN; a_xml: STRING; a_parsed: STRING) is
			-- Test resolved namespaces and pretty printed as expected.
		require
			a_name_not_void: a_name /= Void
			a_xml_not_void: a_xml /= Void
			a_parser_not_void: a_parsed /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_printer: XM_NAMESPACE_PRETTY_PRINT_FILTER
			a_stop: XM_STOP_ON_ERROR_FILTER
			a_resolver: XM_NAMESPACE_RESOLVER
		do
			-- filter pipe
			create a_printer.make_null
			a_printer.set_output_to_string
			create a_stop.set_next (a_printer)
			create a_resolver.set_next (a_stop)
			a_resolver.set_forward_xmlns (with_xmlns)
			
			create a_parser.make
			a_parser.set_callbacks (a_resolver)
			
			a_parser.parse_from_string (a_xml)
			
			assert ("parsing ok for "+a_name, a_parser.is_correct)
			assert_equal (a_name, a_parsed, a_printer.last_output)
		end

end

