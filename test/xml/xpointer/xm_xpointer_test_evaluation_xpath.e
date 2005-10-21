indexing
	
	description:
	
		"Test xpointer evaluation for the XPath implementation"
		
	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPOINTER_TEST_EVALUATION_XPATH

inherit

	TS_TEST_CASE

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_RESOLVER_FACTORY

	XM_XPATH_TYPE

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
	
	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

feature -- Test

	test_shorthand is
			-- Test parsing shorthand pointer
		local
			a_processor: XM_XPATH_XPOINTER
			a_document: XM_XPATH_DOCUMENT
			system_id: STRING
			a_node_value: XM_XPATH_SINGLETON_NODE
			a_node: XM_XPATH_NODE
			an_element: XM_XPATH_ELEMENT
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			create a_processor.make (False)
			a_processor.evaluate ("S", a_document)
			assert ("Evaluated without error", a_processor.value /= Void and then not a_processor.value.is_error)
			a_node_value ?= a_processor.value
			assert ("Singleton node", a_node_value /= Void)
			a_node := a_node_value.node
			assert ("One element", a_node /= Void and then a_node.node_type = Element_node)
			an_element ?= a_node
			assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
			assert ("Science cataegory", STRING_.same_string (an_element.attribute_value_by_name ("", "DESC"), "Science"))
		end

	test_element_scheme is
			-- Test element() scheme and xmlns scheme gives no error
		local
			a_processor: XM_XPATH_XPOINTER
			a_document: XM_XPATH_DOCUMENT
			system_id: STRING
			a_node_value: XM_XPATH_SINGLETON_NODE
			a_node: XM_XPATH_NODE
			an_element: XM_XPATH_ELEMENT
			an_element_scheme: XM_XPATH_XPOINTER_ELEMENT_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			create a_processor.make (False)
			create an_element_scheme.make
			a_processor.register_scheme (an_element_scheme)
			create an_xmlns_scheme.make
			a_processor.register_scheme (an_xmlns_scheme)
			a_processor.evaluate ("xmlns(fred = urn:fred:jane) element(/1/2/1)", a_document)
			assert ("Evaluated without error", a_processor.value /= Void and then not a_processor.value.is_error)
			a_node_value ?= a_processor.value
			assert ("Singleton node", a_node_value /= Void)
			a_node := a_node_value.node
			assert ("One element", a_node /= Void and then a_node.node_type = Element_node)
			an_element ?= a_node
			assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
			assert ("Science cataegory", STRING_.same_string (an_element.attribute_value_by_name ("", "DESC"), "Science"))
		end

	test_gexslt_xpath_scheme is
			-- Test gexslt:xpath() scheme.
			local
			a_processor: XM_XPATH_XPOINTER
			a_document: XM_XPATH_DOCUMENT
			system_id: STRING
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			an_element: XM_XPATH_ELEMENT
			an_xpath_scheme: XM_XPATH_XPOINTER_XPATH_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			create a_processor.make (True)
			create an_xpath_scheme.make
			a_processor.register_scheme (an_xpath_scheme)
			create an_xmlns_scheme.make
			a_processor.register_scheme (an_xmlns_scheme)
			a_processor.evaluate ("xmlns(gexslt = " + Gexslt_eiffel_type_uri + ") gexslt:xpath(/BOOKLIST/CATEGORIES/CATEGORY[1])", a_document)
			assert ("Evaluated without error", a_processor.value /= Void and then not a_processor.value.is_error)
			a_sequence_extent ?= a_processor.value
			assert ("Sequence_extent", a_sequence_extent /= Void)
			assert ("One item", a_sequence_extent.count = 1)
			an_element ?= a_sequence_extent.item_at (1)
			assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
			assert ("Science cataegory", STRING_.same_string (an_element.attribute_value_by_name ("", "DESC"), "Science"))
		end

feature {NONE} -- Implementation

	make_parser is
		local
			entity_resolver: XM_URI_EXTERNAL_RESOLVER
		do
			entity_resolver := new_file_resolver_current_directory
			create parser.make
			parser.set_resolver (entity_resolver)
			create tree_pipe.make (parser, False)
			parser.set_callbacks (tree_pipe.start)
			parser.set_dtd_callbacks (tree_pipe.emitter)
			parser.set_string_mode_ascii
		end
		
	parser: XM_EIFFEL_PARSER
	tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE

	data_dirname: STRING is
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "xml", "xpath", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end
		
	books_xml_uri: UT_URI is
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
			
