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
			a_node: XM_XPATH_NODE
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
			document_element, books_element, an_element, item_element, categories_element: XM_XPATH_TINY_ELEMENT
			an_attribute: XM_XPATH_TINY_ATTRIBUTE
			a_pi: XM_XPATH_TINY_PROCESSING_INSTRUCTION
			a_node: XM_XPATH_NODE
			a_name: STRING
			a_fingerprint, counter: INTEGER
			element_list_1, element_list_2: DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT]
			descendants: XM_XPATH_TINY_DESCENDANT_ENUMERATION
			ancestors: XM_XPATH_TINY_ANCESTOR_ENUMERATION
			attributes: XM_XPATH_TINY_ATTRIBUTE_ENUMERATION
			following: XM_XPATH_TINY_FOLLOWING_ENUMERATION
			preceding: XM_XPATH_TINY_PRECEDING_ENUMERATION
			element_test, attribute_test: XM_XPATH_NAME_TEST
			any_pi_test, any_element_test: XM_XPATH_NODE_KIND_TEST
			found: BOOLEAN
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

			-- Test document_element
			
			document_element ?= document.document_element
			assert ("Document element not void", document_element /= Void)
			a_name := document_element.node_name
			assert("root name", STRING_.same_string (a_name, "BOOKLIST"))

			-- Test first_child

			books_element ?= document_element.first_child
			assert ("First child not void", books_element /= Void)
			a_name := books_element.node_name
			assert("First child name", STRING_.same_string (a_name, "BOOKS"))

			-- Test parent

			assert ("Parent", document_element.is_same_node (books_element.parent))
			
			-- Test first_child of first child

			item_element ?= books_element.first_child
			assert ("First child not void", item_element /= Void)
			a_name := item_element.node_name
			assert("First child 2 name", STRING_.same_string (a_name, "ITEM"))
			
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
				an_element ?= a_node
				if an_element /= Void then
					a_name := an_element.node_name
					assert("Sibling name", STRING_.same_string (a_name, "ITEM"))
					counter := counter + 1
				end
			end
			assert ("Eight Items 1", counter = 8)

			-- Test descendant axis - look for "ITEM" descendants of the document_element

			a_fingerprint := document.name_pool.fingerprint ("", "ITEM")
			create element_test.make (Element_node, a_fingerprint)
			create descendants.make (document, document_element, element_test, False)

			from
				descendants.start
				counter := 1
			until
				descendants.after
			loop
				counter := counter + 1
				descendants.forth
			end

			assert ("Eight descendants", counter = 8)
			
			-- Test ancestor axis - look for "BOOKLIST" ancestor of "ITEM"

			a_fingerprint := document.name_pool.fingerprint ("", "BOOKLIST")
			create element_test.make (Element_node, a_fingerprint)
			create ancestors.make (document, item_element, element_test, False)

			if ancestors.before then ancestors.forth	end
			a_node := ancestors.item
				check
					ancestor_node_not_void: a_node /= Void
				end
			an_element ?= a_node
				check
					element_ancestor: an_element /= Void
				end
			assert ("BOOKLIST ancestor", STRING_.same_string (an_element.node_name, "BOOKLIST"))

			-- Test all_elements

			a_fingerprint := document.name_pool.fingerprint ("", "CATEGORY")
			element_list_1 := document.all_elements (a_fingerprint)
			assert ("Element list not void", element_list_1 /= Void)
			assert ("Eight items 2", element_list_1.count = 5)

			-- Test preceding axis - find all PI's prior to CATEGORIES element

			categories_element ?= document_element.last_child
				check
					categories_element_not_void: categories_element /= Void
				end
			create any_pi_test.make (Processing_instruction_node)
			create preceding.make (document, categories_element, any_pi_test, False)
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
				a_pi ?= a_node
					check
						processing_instruction_node: a_pi /= Void
					end
				preceding.forth
				counter := counter + 1
			end
			assert ("Three preceding processing-instructions", counter = 3)

			-- Test following axis - look for elements following the BOOK element

			create any_element_test.make (Element_node)
			create following.make (document, books_element, any_element_test, False)
				check
					following_before: following.before
				end
			from
				counter := 0
				following.forth
			until
				following.after
			loop
				a_node := following.item
					check
						following_node_not_void: a_node /= Void
					end
				an_element ?= a_node
					check
						element_node: an_element /= Void
					end
				following.forth
				counter := counter + 1
			end
			assert ("Five following elements", counter = 5)
			
			-- Test attributes axis - look for NOTE attribute on CATEGORY element

			a_fingerprint := document.name_pool.fingerprint ("", "NOTE")
			an_element := element_list_1.item (2)
					
			create attribute_test.make (Attribute_node, a_fingerprint)
			create attributes.make (document, an_element.node_number, attribute_test)
				check
					attributes_before: attributes.before
				end
			attributes.start
			a_node := attributes.item
				check
					attribute_node_not_void: a_node /= Void
				end
			an_attribute ?= a_node
				check
					attribute_node: an_attribute /= Void
				end

			assert ("NOTE attribute", STRING_.same_string (an_attribute.node_name, "NOTE"))
			assert ("NOTE attribute value", STRING_.same_string (an_attribute.string_value, "Limited Stock"))

			-- Test all_elements - cached result

			a_fingerprint := document.name_pool.fingerprint ("", "CATEGORY")
			element_list_2 := document.all_elements (a_fingerprint)
			assert ("Element list 2 not void", element_list_2 /= Void)
			assert_equal ("Cached list", element_list_1, element_list_2)

		end

	test_with_namespaces is
			-- Read a file with namespaces
		local
			input_stream: KL_TEXT_INPUT_FILE
			document: XM_XPATH_TINY_DOCUMENT
			document_element: XM_XPATH_TINY_ELEMENT
			a_name: STRING
		do
			make_parser
			-- TODO: move this file
			create input_stream.make ("./books.xsl")
			input_stream.open_read
			assert ("Inout file open", input_stream.is_open_read)
			parser.parse_from_stream (input_stream)
			assert ("No parsing error", not tree_pipe.error.has_error)
			document := tree_pipe.document
			assert ("Document not void", document /= Void)

			-- Test document_element
			
			document_element ?= document.document_element
			assert ("Document element not void", document_element /= Void)
			a_name := document_element.node_name
			assert("root name", STRING_.same_string (a_name, "xsl:transform"))
		end

	test_document_in_error is
			-- Test production of error messages.
		do
			make_parser
			parser.parse_from_string ("<doc><a><b/></doc>")
			assert ("Parsing error", tree_pipe.error.has_error)
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
