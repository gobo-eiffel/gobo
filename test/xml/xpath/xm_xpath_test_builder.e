indexing

	description:

		"Test building XPath tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_BUILDER

inherit
	TS_TEST_CASE
	
feature

	test_simple is
			-- Simple tree.
		do
			make_parser
			parser.parse_from_string ("<doc><a/><b/></doc>")
			assert ("No parsing error", not tree_pipe.error.has_error)
			
			if not tree_pipe.error.has_error then
--				assert_has_element (tree_pipe.document, "doc")
--				a_root := tree_pipe.document.root_element
--				assert_equal ("root name", a_root.name, "doc")
--				assert_has_element (a_root, "a")
--				assert_has_element (a_root, "b")
			end
		end

	test_with_dtd is
			-- Read a file with a DTD
		local
			input_stream: KL_TEXT_INPUT_FILE
		do
			make_parser
			-- TODO: restore to this line, when resolver architecture sorted: create input_stream.make ("./data/books.xml")
			create input_stream.make ("./books.xml")
			input_stream.open_read
			assert ("Inout file open", input_stream.is_open_read)
			parser.parse_from_stream (input_stream)
			assert ("No parsing error", not tree_pipe.error.has_error)
		end

feature {NONE} -- Implementation

	make_parser is
		local
			entity_resolver: XM_FILE_EXTERNAL_RESOLVER
		do
			create entity_resolver.make
			create parser.make
			parser.set_resolver (entity_resolver)
			create tree_pipe.make
			parser.set_callbacks (tree_pipe.start)
			parser.set_dtd_callbacks (tree_pipe.emitter)
			parser.set_string_mode_unicode
		end
		
	parser: XM_EIFFEL_PARSER
	tree_pipe: XM_XPATH_TINYTREE_CALLBACKS_PIPE
	
end
