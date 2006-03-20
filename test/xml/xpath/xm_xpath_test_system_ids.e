indexing

	description:

		"Test system ids and line numbers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_SYSTEM_IDS

inherit

	TS_TEST_CASE

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

	KL_SHARED_FILE_SYSTEM

	XM_XPATH_STANDARD_NAMESPACES

		-- These tests check the system_id and base_uri rotuines

feature

	test_with_dtd_using_tiny_tree is
			-- Test using tiny tree
		do
			main_routine (True)
		end

	test_with_dtd_using_standard_tree is
			-- Test using tiny tree
		do
			main_routine (False)
		end

	main_routine (is_tiny: BOOLEAN) is
			-- Read a file with a DTD and entities
		local
			system_id: STRING
			document: XM_XPATH_TREE_DOCUMENT
			tiny_document: XM_XPATH_TINY_DOCUMENT
			document_element, books_element, item_element: XM_XPATH_ELEMENT
			a_tiny_element: XM_XPATH_TINY_ELEMENT
			a_tree_element: XM_XPATH_TREE_ELEMENT
			an_element: XM_XPATH_TREE_ELEMENT
			a_pi: XM_XPATH_PROCESSING_INSTRUCTION
			a_base_uri: STRING
			a_fingerprint, counter: INTEGER
			tiny_descendants: XM_XPATH_TINY_DESCENDANT_ENUMERATION
			descendants: XM_XPATH_TREE_DESCENDANT_ENUMERATION
			element_test: XM_XPATH_NAME_TEST
		do
			conformance.set_basic_xslt_processor
			system_id := books2_xml_uri.full_reference
			make_parser (system_id, is_tiny)
			parser.parse_from_system (system_id)
			if is_tiny then
				assert ("No parsing error", not tiny_tree_pipe.tree.has_error)
				tiny_document := tiny_tree_pipe.document
				assert ("Document not void", tiny_document /= Void)
				assert ("Line number zero", tiny_document.line_number = 0)
				assert_strings_equal ("Base-URI equals SYSTEM ID for document", tiny_document.system_id, tiny_document.base_uri)
			else
				assert ("No parsing error", not tree_pipe.tree.has_error)
				document := tree_pipe.document
				assert ("Document not void", document /= Void)
				assert ("Line number zero", document.line_number = 0)
				assert_strings_equal ("Base-URI equals SYSTEM ID for document", document.system_id, document.base_uri)

			end
			a_base_uri := resolved_uri_string ("data/books2.xml")
			if is_tiny then
				assert_strings_case_insensitive_equal ("SYSTEM ID for document", a_base_uri, tiny_document.system_id)
			else
				assert_strings_case_insensitive_equal ("SYSTEM ID for document", a_base_uri, document.system_id)
			end

			-- Test document_element
			if is_tiny then
				a_tiny_element ?= tiny_document.document_element
				document_element := a_tiny_element
			else
				a_tree_element ?= document.document_element
				document_element := a_tree_element
			end
			assert ("Document element not void", document_element /= Void)
			assert ("Document element line number is 7", document_element.line_number = 7)
			books_element ?= document_element.first_child
			assert ("Books", books_element /= Void)
			assert ("Books element line number is 2", books_element.line_number = 2)
			a_base_uri := resolved_uri_string ("data/booklist.xml")
			assert_strings_case_insensitive_equal ("SYSTEM ID for BOOKS", a_base_uri, books_element.base_uri)

			-- look for "ITEM" number 6 descendant of the document_element

			if is_tiny then
				a_fingerprint := shared_name_pool.fingerprint ("", "ITEM")
			else
				a_fingerprint := shared_name_pool.fingerprint ("", "ITEM")
			end
			create element_test.make (Element_node, a_fingerprint, "ITEM")
			if is_tiny then
				a_tiny_element ?= document_element
				create tiny_descendants.make (tiny_document.tree, a_tiny_element, element_test, False)
				from
					tiny_descendants.start
					counter := 1
				until
					counter = 6
				loop
					counter := counter + 1
					tiny_descendants.forth
				end
				a_tiny_element ?= tiny_descendants.item
				item_element := a_tiny_element
			else
				an_element ?= document_element
				create descendants.make (an_element, element_test, False)
				from
					descendants.start
					counter := 1
				until
					counter = 6
				loop
					counter := counter + 1
					descendants.forth
				end
				a_tree_element ?= descendants.item
				item_element := a_tree_element
			end
			assert ("sixth item", item_element /= Void)
			assert_strings_case_insensitive_equal ("SYSTEM ID for ITEM", a_base_uri, item_element.system_id)
			assert_strings_equal ("Base URI for ITEM", "http://www.gobosoft.com/xml-tests/AAMilne-book", item_element.base_uri)
			assert ("Item element line number is 35", item_element.line_number = 35)
			a_pi ?= item_element.first_child
			assert ("PI child 1 not_void", a_pi /= Void)
			assert_strings_equal ("PI child 1", "testpi1", a_pi.node_name)
			assert_strings_equal ("Base URI for PI 1", "http://www.gobosoft.com/xml-tests/AAMilne-book", a_pi.base_uri)
			assert ("PI1 line number is 36", a_pi.line_number = 36)
			if is_tiny then
				tiny_descendants.forth
				tiny_descendants.forth
				a_tiny_element ?= tiny_descendants.item
				item_element := a_tiny_element
			else
				descendants.forth
				descendants.forth
				a_tree_element ?= descendants.item
				item_element := a_tree_element
			end
			assert ("eighth item", item_element /= Void)
			assert_strings_case_insensitive_equal ("SYSTEM ID for ITEM 2", a_base_uri, item_element.system_id)
			assert_strings_case_insensitive_equal ("Base URI for ITEM 2", a_base_uri, item_element.base_uri)
			a_pi ?= item_element.first_child
			assert ("PI child 2 not_void", a_pi /= Void)
			assert_strings_equal ("PI child 2", "testpi2", a_pi.node_name)
			assert_strings_case_insensitive_equal ("Base URI for PI 2", a_base_uri, a_pi.base_uri)
			a_pi ?= item_element.next_sibling
			assert ("PI sibling not_void", a_pi /= Void)
			assert_strings_equal ("PI sibling", "testpi3", a_pi.node_name)
			assert_strings_case_insensitive_equal ("Base URI for PI 3", a_base_uri, a_pi.base_uri)
			assert ("PI3 line number is 57", a_pi.line_number = 57)
		end

feature {NONE} -- Implementation

	make_parser (a_system_id: STRING; is_tiny: BOOLEAN) is
		require
			system_id_not_void: a_system_id /= Void
		local
			entity_resolver: XM_URI_EXTERNAL_RESOLVER
		do
			entity_resolver := new_file_resolver_current_directory
			create parser.make
			parser.set_resolver (entity_resolver)
			if is_tiny then
				create tiny_tree_pipe.make (parser, True)
				parser.set_callbacks (tiny_tree_pipe.start)
				parser.set_dtd_callbacks (tiny_tree_pipe.emitter)
			else
				create tree_pipe.make (parser, True)
				parser.set_callbacks (tree_pipe.start)
				parser.set_dtd_callbacks (tree_pipe.emitter)
			end
			parser.set_string_mode_ascii
		end

	parser: XM_EIFFEL_PARSER
	tiny_tree_pipe: XM_XPATH_TINYTREE_CALLBACKS_PIPE
	tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE

	data_dirname: STRING is
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "xml", "xpath", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	books2_xml_uri: UT_URI is
			-- URI of file 'books2.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "books2.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			books2_xml_uri_not_void: Result /= Void
		end

	resolved_uri_string (a_relative_uri: STRING): STRING is
			-- Resolved path for `a_relative_uri' relative to
			-- `current_directory_base'
		require
			a_relative_uri_not_void: a_relative_uri /= Void
		local
			a_uri: UT_URI
		do
			create a_uri.make_resolve (current_directory_base, a_relative_uri)
			Result := a_uri.full_reference
		ensure
			resolved_uri_string_not_void: Result /= Void
		end

	current_directory_base: UT_URI is
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
		end

end
