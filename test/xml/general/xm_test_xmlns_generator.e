note

	description:

		"Test xmlns generation filter and pretty printing"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_XMLNS_GENERATOR

inherit

	TS_TEST_CASE

create

	make_default

feature -- Tests

	test_no_namespaces is
			-- No namespaces.
		do
			assert_formatted ("no_namespaces", 
						"<doc a='foo'/>", "<doc a=%"foo%"></doc>")
			assert_formatted ("simple_space", 
						"<doc ></doc>","<doc></doc>")
			assert_formatted ("whitespace_out_of_content_ignored",
						"  <doc/>   ", "<doc></doc>")
			assert_formatted ("newline",
						"<doc>%N</doc>", "<doc>%N</doc>")
			assert_formatted ("empty_tag",
						"<doc/>", "<doc></doc>")
		end
		
	test_implicit_namespace is
			-- Test xml:
		do
			assert_formatted ("xml",
				"<doc xml:space='default'/>",
				"<doc xml:space=%"default%"></doc>") -- stays undeclared
		end
		
	test_characters is
			-- Character escaping.
		do
			assert_formatted ("lt", "<doc>&lt;</doc>", "<doc>&lt;</doc>")
			assert_formatted ("gt", "<doc>></doc>", "<doc>&gt;</doc>")
			
				-- In attribute.
			assert_formatted ("lt_attr", "<doc a=%'&lt;%'/>", "<doc a=%"&lt;%"></doc>")
			assert_formatted ("gt_attr", "<doc a=%'&gt;%'/>", "<doc a=%"&gt;%"></doc>")
			assert_formatted ("quot", "<doc a=%'%"%'/>", "<doc a=%"&quot;%"></doc>")
			assert_formatted ("no_apos", "<doc a=%"%'%"/>", "<doc a=%"%'%"></doc>")
			
			assert_formatted ("at_end", "<doc>abc></doc>", "<doc>abc&gt;</doc>")
			assert_formatted ("at_end", "<doc>>abc</doc>", "<doc>&gt;abc</doc>")
			assert_formatted ("middle", "<doc>abc>de</doc>", "<doc>abc&gt;de</doc>")
			
				-- No escaping in comment/PI.
			assert_formatted ("in_comment", "<!-- < --><doc/>",  "<!-- < --><doc></doc>")
			assert_formatted ("in_proc_instruction", "<?ab <?><doc/>",  "<?ab <?><doc></doc>")
		end
		
	test_attribute is
			-- Namespaces and attributes.
		do
			assert_formatted ("simple_attribute",
						"<doc n1:a='foo' xmlns:n1='abc'/>",
						"<doc n1:a=%"foo%" xmlns:n1=%"abc%"></doc>")
			assert_formatted ("attribute_default",
						"<doc n1:a='foo' a='foo' xmlns:n1='abc'/>",
						"<doc n1:a=%"foo%" a=%"foo%" xmlns:n1=%"abc%"></doc>")
		end
		
	test_default is
			-- Default namespace declarations.
		do
			assert_formatted ("prefixed_root",
						"<n1:doc xmlns:n1='abc'/>",
						"<n1:doc xmlns:n1=%"abc%"></n1:doc>")

			assert_formatted ("children",
						"<doc><a xmlns='abc'/><b xmlns='def'/></doc>",
						"<doc><a xmlns=%"abc%"></a><b xmlns=%"def%"></b></doc>")
						
			assert_formatted ("unfold_children",
						"<doc xmlns='uri1'><c1 xmlns='uri2'/><c2/></doc>",
						"<doc xmlns=%"uri1%"><c1 xmlns=%"uri2%"></c1><c2></c2></doc>")
						 
			assert_formatted ("through",
						"<doc xmlns=%"uri1%"><n1:c xmlns:n1=%"uri2%"><leaf/></n1:c></doc>",
						"<doc xmlns=%"uri1%"><n1:c xmlns:n1=%"uri2%"><leaf></leaf></n1:c></doc>")
			
				-- Prefixes with same name for different ns become distinct.
			assert_formatted ("same_tag", 
						"<doc><lab:ele xmlns:lab='uri1'><lab:ele xmlns:lab='uri2'/></lab:ele></doc>",
						"<doc><lab:ele xmlns:lab=%"uri1%"><lab:ele xmlns:lab=%"uri2%"></lab:ele></lab:ele></doc>")
		end

feature -- Tree
	
	test_malformed is
			-- Coping with prefix-inconsistent trees.
		local
			a_doc: XM_DOCUMENT
		do
			create a_doc.make_with_root_named ("doc", default_ns)
			a_doc.root_element.add_attribute ("a1", new_ns ("pre", "uri1"), "v1")
			a_doc.root_element.add_attribute ("a2", new_ns ("pre", "uri2"), "v2")
			
			assert_document ("same_prefix", a_doc,
				"<doc pre:a1=%"v1%" ns1:a2=%"v2%" xmlns:pre=%"uri1%" xmlns:ns1=%"uri2%"></doc>")
			
			create a_doc.make_with_root_named ("doc", default_ns)
			a_doc.root_element.add_attribute ("a1", new_ns ("ns1", "uri1"), "v1")
			a_doc.root_element.add_attribute ("a2", new_ns ("ns1", "uri2"), "v2")
			
			assert_document ("generate_collision", a_doc,
				"<doc ns1:a1=%"v1%" ns2:a2=%"v2%" xmlns:ns1=%"uri1%" xmlns:ns2=%"uri2%"></doc>")
			
			create a_doc.make_with_root_named ("doc", new_ns ("ns1", "uri"))
			a_doc.root_element.add_attribute ("a1", new_ns ("", "uri1"), "v1")
			
			assert_document ("collide_with_empty", a_doc,
				"<ns1:doc ns2:a1=%"v1%" xmlns:ns1=%"uri%" xmlns:ns2=%"uri1%"></ns1:doc>")

			create a_doc.make_with_root_named ("doc", new_ns ("", "uri1"))
			a_doc.root_element.add_attribute ("a", new_ns ("", "uri2"), "v1")
			a_doc.root_element.add_attribute ("a", new_ns ("", "uri3"), "v2")
			a_doc.root_element.add_attribute ("a", default_ns, "v3")

			assert_document ("no_prefixes", a_doc,
				"<doc xmlns=%"uri1%" ns1:a=%"v1%" ns2:a=%"v2%" a=%"v3%" xmlns:ns1=%"uri2%" xmlns:ns2=%"uri3%"></doc>")
		end

feature {NONE} -- Implementation

	new_ns (a_prefix: STRING; a_uri: STRING): XM_NAMESPACE  is
			-- New XM_NAMESPACE instance.
		require
			uri_not_void: a_uri /= Void
		do
			create Result.make (a_prefix, a_uri)
		end
		
	default_ns: XM_NAMESPACE is
			-- Default XM_NAMESPACE
		do
			create Result.make_default
		end
		
	assert_document (a_tag: STRING; a_doc: XM_DOCUMENT; a_out: STRING) is
			-- Test with document tree.
		require
			a_tag_not_void: a_tag /= Void
			a_doc_not_void: a_doc /= Void
			a_out_not_void: a_out /= Void
		do
			make_parser
			a_doc.process_to_events (xmlns_generator)
			
			assert_equal (a_tag, a_out, pretty_print.last_output.string)	
		end
		
feature {NONE} -- Implementation
	
	assert_formatted (a_tag: STRING; a_in: STRING; a_out: STRING) is
			-- Assert input XML is formatted as output.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_out_not_void: a_out /= Void
		do
			make_parser
				-- Check formatted output is as expected.
			parser.parse_from_string (a_in)
			assert ("parsed_" + a_tag, not stop_on_error.has_error)		
			assert_equal (a_tag, a_out, pretty_print.last_output)
			
				-- Check output is valid XML and idempotent.
			make_parser

			parser.parse_from_string (a_out)
			assert ("output_parsed_" + a_tag, not stop_on_error.has_error)
			assert_equal ("output_idempotent_" + a_tag, a_out, pretty_print.last_output.string)
		end

feature {NONE} -- Implementation
				
	make_parser is
			-- Make parser.
		local
			namespace_resolver: XM_NAMESPACE_RESOLVER
		do
			create parser.make
			
			-- build filter chain
			-- ns resolver -> xmlns generator -> stop on error -> pretty print
			
			create pretty_print.make_null
			pretty_print.set_output_to_string
			create stop_on_error.set_next (pretty_print)
			create xmlns_generator.set_next (pretty_print)
			create namespace_resolver.set_next (xmlns_generator)
			
			parser.set_callbacks (namespace_resolver)
		end
			
	parser: XM_EIFFEL_PARSER
		-- Parser
		
	xmlns_generator: XM_XMLNS_GENERATOR
		-- Tested filter.
		
	pretty_print: XM_PRETTY_PRINT_FILTER
		-- Output 
		
	stop_on_error: XM_STOP_ON_ERROR_FILTER
		-- Error collector
		
end
