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
			assert ("parsing error", not tree_pipe.error.has_error)
			
--			if not tree_pipe.error.has_error then
--				assert_has_element (tree_pipe.document, "doc")
--				a_root := tree_pipe.document.root_element
--				assert_equal ("root name", a_root.name, "doc")
--				assert_has_element (a_root, "a")
--				assert_has_element (a_root, "b")
--			end
		end
		
feature {NONE} -- Implementation

	make_parser is
		do
			create parser.make
			create tree_pipe.make
			parser.set_callbacks (tree_pipe.start)
			parser.set_string_mode_unicode
		end
		
	parser: XM_EIFFEL_PARSER
	tree_pipe: XM_TREE_CALLBACKS_PIPE
	
end
