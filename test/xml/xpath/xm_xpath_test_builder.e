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

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES

		-- These tests test the ability to build a tiny-tree,
		-- and exercise the DOM-like navigation features,
		-- and the XPath axes.

feature

	test_simple is
			-- Simple tree.
		local
			document: XM_XPATH_TINY_DOCUMENT
			document_element, an_element: XM_XPATH_TINY_ELEMENT
			a_name: STRING
		do
			make_parser
			parser.parse_from_string ("<doc><a/><b/></doc>")
			assert ("No parsing error", not tree_pipe.error.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)

			-- Test document_element

			document_element ?= document.document_element
			assert ("Document element not void", document_element /= Void)
			a_name := document_element.node_name
			assert("root name", STRING_.same_string (a_name, "doc"))

			-- Test last_child

			an_element ?= document_element.last_child
			assert ("Last child not void", an_element /= Void)
			a_name := an_element.node_name
			assert("Last child name", STRING_.same_string (a_name, "b"))

			-- Test first_child

			an_element ?= document_element.first_child
			assert ("First child not void", an_element /= Void)
			a_name := an_element.node_name
			assert("First child name", STRING_.same_string (a_name, "a"))

			-- Test next_sibling

			an_element ?= an_element.next_sibling
			assert ("Second child not void", an_element /= Void)			
			a_name := an_element.node_name
			assert("Second child name", STRING_.same_string (a_name, "b"))

			-- Test previous_sibling

			an_element ?= an_element.previous_sibling
			assert ("Previous sibling not void", an_element /= Void)			
			a_name := an_element.node_name
			assert("Previous sibling name", STRING_.same_string (a_name, "a"))						
		end

	test_with_dtd is
			-- Read a file with a DTD
		local
			input_stream: KL_TEXT_INPUT_FILE
			document: XM_XPATH_TINY_DOCUMENT
			document_element, an_element: XM_XPATH_TINY_ELEMENT
			a_node: XM_XPATH_ABSTRACT_NODE
			a_name: STRING
			a_fingerprint, counter: INTEGER
			element_list_1, element_list_2: DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT]
			descendants: XM_XPATH_TINY_DESCENDANT_ENUMERATION
			element_test: XM_XPATH_NAME_TEST
		do
			make_parser
			-- TODO: restore to this line, when resolver architecture sorted: create input_stream.make ("./data/books.xml")
			create input_stream.make ("./books.xml")
			input_stream.open_read
			assert ("Inout file open", input_stream.is_open_read)
			parser.parse_from_stream (input_stream)
			assert ("No parsing error", not tree_pipe.error.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)

			document.diagnostic_dump
			-- Test document_element
			
			document_element ?= document.document_element
			assert ("Document element not void", document_element /= Void)
			a_name := document_element.node_name
			assert("root name", STRING_.same_string (a_name, "BOOKLIST"))

			-- Test first_child

			an_element ?= document_element.first_child
			assert ("First child not void", an_element /= Void)
			a_name := an_element.node_name
			assert("First child name", STRING_.same_string (a_name, "BOOKS"))

			-- Test first_child of first child

			an_element ?= an_element.first_child
			assert ("First child not void", an_element /= Void)
			a_name := an_element.node_name
			assert("First child 2 name", STRING_.same_string (a_name, "ITEM"))
			
			-- Test next_sibling loop to last child

			from
				counter := 1
				a_node := an_element
					check
						initial_node_not_void: a_node /= Void
					end
			until
				a_node = Void
			loop
				a_node := a_node.next_sibling
				an_element ?= a_node
				if an_element /= Void then
					a_name := an_element.node_name
					assert("Sibling name", STRING_.same_string (a_name, "ITEM"))
					counter := counter + 1
				end
				print ("once round loop ")
			end
			print (counter)
			assert ("Eight Items 1", counter = 8)

			-- Test descendant axis - look for "ITEM" descendants of the document_element

			a_fingerprint := document.name_pool.fingerprint ("", "ITEM")
			create element_test.make (Element_node, a_fingerprint)
			create descendants.make (document, document_element, element_test, False)

			from
				if descendants.before then
					counter := 0
				else
					counter := 1
				end
			until
				descendants.after
			loop
				descendants.forth
				counter := counter + 1
			end
			print (counter.out); print ("%N")
			assert ("Eight descendants", counter = 8)
			
			-- Test all_elements

			element_list_1 := document.all_elements (a_fingerprint)
			assert ("Element list not void", element_list_1 /= Void)
			assert ("Eight items 2", element_list_1.count = 8)

			-- Test all_elements - cached result

			element_list_2 := document.all_elements (a_fingerprint)
			assert ("Element list 2 not void", element_list_2 /= Void)
			assert ("Cached list", element_list_1 = element_list_2)
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
