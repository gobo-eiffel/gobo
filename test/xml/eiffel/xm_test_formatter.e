indexing

	description:
	
		"Test XM_FORMATTER"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_FORMATTER

inherit
	TS_TEST_CASE
	
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
			
			assert_formatted ("at_end", "<doc>abc%"</doc>", "<doc>abc&quot;</doc>")
			assert_formatted ("at_end", "<doc>%"abc</doc>", "<doc>&quot;abc</doc>")
			assert_formatted ("middle", "<doc>abc%"de</doc>", "<doc>abc&quot;de</doc>")
			
				-- No escaping in comment/PI.
			assert_formatted ("in_comment", "<!-- < --><doc/>",  "<!-- < --><doc></doc>")
			assert_formatted ("in_proc_instruction", "<?ab <?><doc/>",  "<?ab <?><doc></doc>")
		end
		
	test_attribute is
			-- Namespaces and attributes.
		do
			assert_formatted ("simple_attribute",
						"<doc n1:a='foo' xmlns:n1='abc'/>",
						"<doc xmlns:n1=%"abc%" n1:a=%"foo%"></doc>")
			assert_formatted ("attribute_default",
						"<n1:doc n1:a='foo' xmlns:n1='abc'/>",
						"<n1:doc xmlns:n1=%"abc%" n1:a=%"foo%"></n1:doc>")
		end
		
	test_flattening is
			-- Flattening of namespace declarations.
		do
			assert_formatted ("root_ns",
						"<n1:doc xmlns:n1='abc'/>",
						"<n1:doc xmlns:n1=%"abc%"></n1:doc>")

				-- Default declarations become labels.
			assert_formatted ("flat_children",
						"<doc><a xmlns='abc'/><b xmlns='def'/></doc>",
						"<doc xmlns:ns1=%"abc%" xmlns:ns2=%"def%"><ns1:a></ns1:a><ns2:b></ns2:b></doc>")
			assert_formatted ("flat_hierachy",
						"<doc xmlns=%"abc%"><child xmlns=%"def%"/></doc>",
						"<ns1:doc xmlns:ns1=%"abc%" xmlns:ns2=%"def%"><ns2:child></ns2:child></ns1:doc>")
			
				-- Prefixes with same name for different ns become distinct.
			assert_formatted ("tag_collision", 
						"<doc><lab:ele xmlns:lab='abc'><lab:ele xmlns:lab='def'/></lab:ele></doc>",
						"<doc xmlns:lab=%"abc%" xmlns:ns1=%"def%"><lab:ele><ns1:ele></ns1:ele></lab:ele></doc>")
			
				-- Collision with generated names.
			assert_formatted ("collision_with_generated",
						"<doc xmlns='root' xmlns:ns1='abc'><ns1:ele/></doc>", -- ns1 allocated to anon 'root', so taken
						"<ns1:doc xmlns:ns1=%"root%" xmlns:ns2=%"abc%"><ns2:ele></ns2:ele></ns1:doc>")
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
			assert ("parsed_" + a_tag, not tree_pipe.error.has_error)
			
			tree_pipe.document.process (formatter)
			assert_equal (a_tag, a_out, output.string)
			
				-- Check output is valid XML and idempotent.
			output.string.wipe_out
			
			parser.parse_from_string (a_out)
			assert ("output_parsed_" + a_tag, not tree_pipe.error.has_error)
			
			tree_pipe.document.process (formatter)
			assert_equal ("output_idempotent_" + a_tag, a_out, output.string)
		end

feature {NONE} -- Implementation
				
	make_parser is
		do
			create parser.make
			create tree_pipe.make
			parser.set_callbacks (tree_pipe.start)
			
			create formatter.make
			create output.make_empty
			formatter.set_output (output)
		end
		
	parser: XM_EIFFEL_PARSER
		-- Parser
	tree_pipe: XM_TREE_CALLBACKS_PIPE
		-- Tree builder
		
	formatter: XM_FORMATTER
		-- Formatter
	output: KL_STRING_OUTPUT_STREAM
		-- Formatter output
		
end
