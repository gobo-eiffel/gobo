note

	description:

	"[
		Test building XPath tree.
		These tests test the ability to build a standard tree,
		and exercise the DOM-like navigation features,
		and the XPath axes.
	]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2001-2018, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TEST_BUILDER

inherit

	TS_TEST_CASE
		redefine
			make_default
		end

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_ANY_NODE_TEST

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

create

	make_default

feature {NONE} -- Initialization

	make_default
			-- <Precursor>
		do
			precursor
			make_parser ("inline:")
		end

feature -- Test

	test_simple
			-- Simple tree.
		local
			document: detachable XM_XPATH_TREE_DOCUMENT
			a_name: STRING
		do
			conformance.set_basic_xslt_processor
			make_parser ("inline:")
			parser.parse_from_string ("<doc><a/><b/></doc>")
			assert ("No parsing error", not tree_pipe.tree.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)
			check asserted_above: document /= Void then end

			-- Test document_element

			if not attached {XM_XPATH_TREE_ELEMENT} document.document_element as document_element then
				assert ("Document element not void", False)
			else
				a_name := document_element.node_name
				assert_strings_equal ("root name", "doc", a_name)

				-- Test last_child

				if not attached {XM_XPATH_TREE_ELEMENT} document_element.last_child as an_element_1 then
					assert ("Last child not void", False)
				else
					a_name := an_element_1.node_name
					assert_strings_equal ("Last child name", "b", a_name)
				end

				-- Test first_child

				if not attached {XM_XPATH_TREE_ELEMENT} document_element.first_child as an_element_2 then
					assert ("First child not void", False)
				else
					a_name := an_element_2.node_name
					assert_strings_equal ("First child name", "a", a_name)

					-- Test next_sibling

					if not attached {XM_XPATH_TREE_ELEMENT} an_element_2.next_sibling as an_element_3 then
						assert ("Second child not void", False)
					else
						a_name := an_element_3.node_name
						assert_strings_equal ("Second child name", "b", a_name)

						-- Test previous_sibling

						if not attached {XM_XPATH_TREE_ELEMENT} an_element_3.previous_sibling as an_element_4 then
							assert ("Previous sibling not void", False)
						else
							a_name := an_element_4.node_name
							assert_strings_equal ("Previous sibling name", "a", a_name)
						end
					end
				end
			end
		end

	test_with_dtd
			-- Read a file with a DTD
		local
			system_id: STRING
			document: detachable XM_XPATH_TREE_DOCUMENT
			an_element: XM_XPATH_TREE_ELEMENT
			a_node: XM_XPATH_NODE
			a_name: STRING
			a_fingerprint, counter: INTEGER
			element_list_1, element_list_2: DS_ARRAYED_LIST [XM_XPATH_TREE_ELEMENT]
			descendants: XM_XPATH_TREE_DESCENDANT_ENUMERATION
			ancestors: XM_XPATH_TREE_ANCESTOR_ENUMERATION
			attributes: XM_XPATH_TREE_ATTRIBUTE_ENUMERATION
			following: XM_XPATH_TREE_FOLLOWING_ENUMERATION
			preceding: XM_XPATH_TREE_PRECEDING_ENUMERATION
			element_test, attribute_test: XM_XPATH_NAME_TEST
			any_pi_test, any_element_test: XM_XPATH_NODE_KIND_TEST
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)
			check asserted_above: document /= Void then end

			-- Test document_element

			if not attached {XM_XPATH_TREE_ELEMENT} document.document_element as document_element then
				assert ("Document element not void", False)
			else
				a_name := document_element.node_name
				assert_strings_equal ("root name", "BOOKLIST", a_name)

				-- Test first_child

				if not attached {XM_XPATH_TREE_ELEMENT} document_element.first_child as books_element then
					assert ("First child not void", False)
				else
					a_name := books_element.node_name
					assert_strings_equal ("First child name", "BOOKS", a_name)

					-- Test parent

					assert ("Parent", attached books_element.parent as l_books_element_parent and then document_element.is_same_node (l_books_element_parent))

					-- Test first_child of first child

					if not attached {XM_XPATH_TREE_ELEMENT} books_element.first_child as item_element then
						assert ("First child not void", False)
					else
						a_name := item_element.node_name
						assert_strings_equal ("First child 2 name", "ITEM", a_name)

						-- Test next_sibling loop to last child

						from
							counter := 1
							a_node := item_element
								check
									initial_node_not_void: a_node /= Void
								end
						until
							a_node = Void
						loop
							a_node := a_node.next_sibling
							if attached {XM_XPATH_TREE_ELEMENT} a_node as an_element_1 then
								a_name := an_element_1.node_name
								assert_strings_equal ("Sibling name", "ITEM", a_name)
								counter := counter + 1
							end
						end
						assert ("Eight Items 1", counter = 8)

						-- Test descendant axis - look for "ITEM" descendants of the document_element

						a_fingerprint := shared_name_pool.fingerprint ("", "ITEM")
						create element_test.make (Element_node, a_fingerprint, "ITEM")
						create descendants.make (document_element, element_test, False)

						from
							descendants.start
							counter := 1
						until
							descendants.after
						loop
							counter := counter + 1
							descendants.forth
						end
						assert ("Eight descendants", counter = 9)

						-- Test ancestor axis - look for "BOOKLIST" ancestor of "ITEM"

						create ancestors.make (item_element, any_node_test, False)

						ancestors.start
						ancestors.forth
						a_node := ancestors.item
							check
								ancestor_node_not_void: a_node /= Void
							end
						if not attached {XM_XPATH_TREE_ELEMENT} a_node as an_element_2 then
							assert ("element_ancestor", False)
						else
							assert_strings_equal ("BOOKLIST ancestor", "BOOKLIST", an_element_2.node_name)
						end

						-- Test all_elements

						a_fingerprint := shared_name_pool.fingerprint ("", "CATEGORY")
						element_list_1 := document.all_elements (a_fingerprint)
						assert ("Element list not void", element_list_1 /= Void)
						assert ("Five items", element_list_1.count = 5)

						-- Test preceding axis - find all PI's prior to CATEGORIES element

						if not attached {XM_XPATH_TREE_ELEMENT} document_element.last_child as categories_element then
							assert ("categories_element_not_void", False)
						else
							create any_pi_test.make (Processing_instruction_node)
							create preceding.make (categories_element, any_pi_test)
								check
									preceding_before: preceding.before
								end
							from
								counter := 1
								preceding.start
							until
								preceding.after
							loop
								a_node := preceding.item
									check
										preceding_node_not_void: a_node /= Void
									end
								assert ("processing_instruction_node", attached {XM_XPATH_TREE_PROCESSING_INSTRUCTION} a_node)
								preceding.forth
								counter := counter + 1
							end
							assert ("Three preceding processing-instructions", counter = 4)
						end

						-- Test following axis - look for elements following the BOOKS element

						create any_element_test.make (Element_node)
						create following.make (books_element, any_element_test)
							check
								following_before: following.before
							end
						from
							counter := 1
							following.start
						until
							following.after
						loop
							a_node := following.item
								check
									following_node_not_void: a_node /= Void
								end
							assert ("tree_element", attached {XM_XPATH_TREE_ELEMENT} a_node)
							following.forth
							counter := counter + 1
						end
						assert ("Six following elements", counter = 7)

						-- Test attributes axis - look for NOTE attribute on CATEGORY element

						a_fingerprint := shared_name_pool.fingerprint ("", "NOTE")
						an_element := element_list_1.item (2)

						create attribute_test.make (Attribute_node, a_fingerprint, "NOTE")
						create attributes.make (an_element, attribute_test)
							check
								attributes_before: attributes.before
							end
						attributes.start
						a_node := attributes.item
							check
								attribute_node_not_void: a_node /= Void
							end
						if not attached {XM_XPATH_TREE_ATTRIBUTE} a_node as an_attribute_1 then
							assert ("tree_attribute", False)
						else
							assert_strings_equal ("NOTE attribute", "NOTE", an_attribute_1.node_name)
							assert_strings_equal ("NOTE attribute value", "Limited Stock", an_attribute_1.string_value)
						end

						-- Test all_elements - cached result

						a_fingerprint := shared_name_pool.fingerprint ("", "CATEGORY")
						element_list_2 := document.all_elements (a_fingerprint)
						assert ("Element list 2 not void", element_list_2 /= Void)
						assert_equal ("Cached list", element_list_1, element_list_2)
					end
				end
			end
		end

	test_with_namespaces
			-- Read a file with namespaces
		local
			system_id: STRING
			document: detachable XM_XPATH_TREE_DOCUMENT
			a_name: STRING
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)
			check asserted_above: document /= Void then end

			-- Test document_element

			if not attached {XM_XPATH_TREE_ELEMENT} document.document_element as document_element then
				assert ("Document element not void", False)
			else
				a_name := document_element.node_name
				assert_strings_equal ("root name", "BOOKLIST", a_name)
			end
		end

	test_document_in_error
			-- Test production of error messages.
		do
			conformance.set_basic_xslt_processor
			make_parser ("inline:")
			parser.parse_from_string ("<doc><a><b/></doc>")
			assert ("Parsing error", tree_pipe.tree.has_error)
		end

feature {NONE} -- Implementation

	make_parser (a_base_uri: STRING)
			-- Create XML parser.
		require
			a_base_uri_not_void: a_base_uri /= Void
		local
			l_uri: UT_URI
			l_entity_resolver: XM_URI_EXTERNAL_RESOLVER
		do
			l_entity_resolver := new_file_resolver_current_directory
			create parser.make
			parser.set_resolver (l_entity_resolver)
			create l_uri.make (a_base_uri)
			create tree_pipe.make (parser, False, a_base_uri, l_uri)
			parser.set_callbacks (tree_pipe.start)
			parser.set_dtd_callbacks (tree_pipe.emitter)
			parser.set_string_mode_ascii
		ensure
			parser_not_void: parser /= Void
		end

	parser: XM_EIFFEL_PARSER
			-- XML parser

	tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE
			-- Tree pipe

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xpath", "test", "unit", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	books_xml_uri: UT_URI
			-- URI of file 'books.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "books.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			books_xml_uri_not_void: Result /= Void
		end

end
