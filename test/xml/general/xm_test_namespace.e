note

	description:

		"Test namespace resolving"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_NAMESPACE

inherit

	TS_TEST_CASE

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

create

	make_default

feature -- Test printed

	test_printed
		do
			assert_namespace_printed  ("element",
				"<ns:doc xmlns:ns='uri'/>",
				"<{uri}doc></{uri}doc>")
		end

	test_with_xmlns
		do
			assert_namespace_with_xmlns ("element",
				"<ns:doc xmlns:ns='uri'/>",
				"<{uri}doc {http://www.w3.org/2000/xmlns/}ns=%"uri%"></{uri}doc>")
			assert_namespace_with_xmlns ("attribute",
				"<ns:doc a='foo' xmlns:ns='uri' ns:b='bar'/>",
				"<{uri}doc a=%"foo%" {http://www.w3.org/2000/xmlns/}ns=%"uri%" {uri}b=%"bar%"></{uri}doc>")

		end

feature -- Test resolved

	test_simple
		do
			assert_namespace ("simple",
				"<a xmlns='uri1'/>",
				<<"uri1">>)
		end

	test_all
		do
			assert_namespace  ("all",
				"<a><b xmlns='uri1' xmlns:n2='uri2' n2:a='bar' c='foo'><z/></b><c/></a>",
				<<"", "uri1", "uri2", "", "uri1", "">>)
		end

	test_element
		do
			assert_namespace ("default ns",
				"<doc><a xmlns='uri1'/></doc>",
				<<"", "uri1">>)
			assert_namespace ("default hidden",
				"<doc xmlns='uri1'><a xmlns='uri2'/></doc>",
				<<"uri1", "uri2">>)
			assert_namespace ("sibling restore",
				"<doc xmlns='uri1'><a xmlns='uri2'/><b/></doc>",
				<<"uri1", "uri2", "uri1">>)
			assert_namespace ("child inherit",
				"<doc xmlns='uri1'><child/></doc>",
				<<"uri1", "uri1">>)
			assert_namespace ("named",
				"<doc><n1:a xmlns:n1='uri1'/></doc>",
				<<"", "uri1">>)
			assert_namespace ("named down",
				"<doc xmlns:n1='uri1'><n1:a/></doc>",
				<<"", "uri1">>)
			assert_namespace ("named hidden",
				"<doc xmlns:n1='uri1'><n1:a xmlns:n1='uri2'/></doc>",
				<<"", "uri2">>)
			assert_namespace ("named hidden down",
				"<doc xmlns:n1='uri1'><n1:a xmlns:n1='uri2'><n1:c/></n1:a></doc>",
				<<"", "uri2", "uri2">>)
			assert_namespace ("named restored",
				"<doc xmlns:n1='uri1'><n1:a xmlns:n1='uri2'/><n1:c/></doc>",
				<<"", "uri2", "uri1">>)
		end

	test_attribute
		do
			assert_namespace ("simple",
				"<doc xmlns='uri1' a='t'/>",
				<<"uri1", "">>)
			assert_namespace ("named",
				"<doc xmlns:n='uri1' n:a='t'/>",
				<<"", "uri1">>)
			assert_namespace ("default with named element",
				"<doc xmlns:n='uri1'><n:a c='t'/></doc>",
				<<"", "uri1", "">>)
			assert_namespace ("default down",
				"<doc xmlns='uri1' xmlns:n='uri2'><a n:a='t' a='t'/></doc>",
				<<"uri1", "uri1", "uri2", "">>)

			assert_namespace ("together",
				"<a xmlns:n1='uri1' xmlns:n2='uri2'><n2:b n1:a1='foo' n2:a1='bar' d='bar'/></a>",
				<<"", "uri2", "uri1", "uri2", "">>)
		end

	test_implicit
		do
			assert_namespace ("xml_prefix",
				"<doc xml:space='default'/>",
				<<"", Xml_prefix_namespace >>)
		end

feature {NONE} -- Implementation

	assert_namespace_with_xmlns (a_name: STRING; a_xml: STRING; a_parsed: STRING)
		do
			assert_namespace_impl (a_name, True, a_xml, a_parsed)
		end

	assert_namespace_printed (a_name: STRING; a_xml: STRING; a_parsed: STRING)
		do
			assert_namespace_impl (a_name, False, a_xml, a_parsed)
		end

	assert_namespace_impl (a_name: STRING; with_xmlns: BOOLEAN; a_xml: STRING; a_parsed: STRING)
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

	assert_namespace (a_name: STRING; a_in: STRING; a_ns: ARRAY[STRING])
			-- Test that an XML document sequence of namespace
			-- events (excluding xmlns, flattened) is correct.
		require
			a_name_not_void: a_name /= Void
			a_in_not_void: a_in /= Void
			a_ns_not_void: a_ns /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_checker: XM_NAMESPACE_CHECKER
		do
			create a_parser.make
			create a_checker.make_null
			a_checker.set (a_ns)
			a_parser.set_callbacks (standard_callbacks_pipe (<<a_checker>>))
			a_parser.parse_from_string (a_in)

			debug ("xml_parser")
				if a_checker.has_failed then
					std.output.put_string ("failed: "+ a_checker.failed)
					std.output.put_new_line
				end
			end

			assert ("parsing ok for "+a_name, a_parser.is_correct)
			assert (a_name, not a_checker.has_failed)
		end

end

