indexing
	
	description:
	
		"Test namespace resolution"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_TEST_NAMESPACE

inherit

	TS_TEST_CASE
	
	XM_CALLBACKS_FILTER_FACTORY
	
	KL_SHARED_STANDARD_FILES
	
feature -- Test

	test_simple is
		do
			assert_namespace ("simple",
				"<a xmlns='uri1'/>",
				<<"uri1">>)
		end
		
	test_all is
		do
			assert_namespace ("all",
				"<a><b xmlns='uri1' xmlns:n2='uri2' n2:a='bar' c='foo'><z/></b><c/></a>",
				<<"", "uri1", "uri2", "", "uri1", "">>)
		end
		
	test_element is
		do
			assert_namespace ("default ns",
				"<doc><a xmlns='uri1'/></doc>",
				<<"", "uri1">>)
			assert_namespace ("default hidden",
				"<doc xmlns='uri1'><a xmlns='uri2'/></doc>",
				<<"uri1", "uri2">>)
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
		
	test_attribute is
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

feature {NONE} -- Implementation

	assert_namespace (a_name: STRING; a_in: STRING; a_ns: ARRAY[STRING]) is
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
