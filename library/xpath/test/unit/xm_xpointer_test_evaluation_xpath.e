note

	description:

		"Test xpointer evaluation for the XPath implementation"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_TEST_EVALUATION_XPATH

inherit

	TS_TEST_CASE
		redefine
			make_default
		end

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_RESOLVER_FACTORY

	XM_XPATH_TYPE

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

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

	test_shorthand
			-- Test parsing shorthand pointer
		local
			a_processor: XM_XPATH_XPOINTER
			a_document:detachable XM_XPATH_DOCUMENT
			system_id: STRING
			a_node: XM_XPATH_NODE
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			check asserted_above: a_document /= Void then end
			create a_processor.make (False)
			a_processor.evaluate ("S", a_document)
			assert ("Evaluated without error", attached a_processor.value as l_value and then not l_value.is_error)
			if not attached {XM_XPATH_SINGLETON_NODE} a_processor.value as a_node_value then
				assert ("Singleton node", False)
			else
				a_node := a_node_value.node
				assert ("One element", a_node /= Void and then a_node.node_type = Element_node)
				if not attached {XM_XPATH_ELEMENT} a_node as an_element then
					assert ("an_element_not_void" , False)
				else
					assert ("Category element", STRING_.same_string (an_element.local_part, "CATEGORY"))
					assert ("Science cataegory", attached an_element.attribute_value_by_name ("", "DESC") as l_attribute_value and then STRING_.same_string (l_attribute_value, "Science"))
				end
			end
		end

	test_element_scheme
			-- Test element() scheme and xmlns scheme gives no error
		local
			a_processor: XM_XPATH_XPOINTER
			a_document: detachable XM_XPATH_DOCUMENT
			system_id: STRING
			a_node: XM_XPATH_NODE
			an_element_scheme: XM_XPATH_XPOINTER_ELEMENT_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			check asserted_above: a_document /= Void then end
			create a_processor.make (False)
			create an_element_scheme.make
			a_processor.register_scheme (an_element_scheme)
			create an_xmlns_scheme.make
			a_processor.register_scheme (an_xmlns_scheme)
			a_processor.evaluate ("xmlns(fred = urn:fred:jane) element(/1/2/1)", a_document)
			assert ("Evaluated without error", attached a_processor.value as l_value and then not l_value.is_error)
			if not attached {XM_XPATH_SINGLETON_NODE} a_processor.value as a_node_value then
				assert ("Singleton node", False)
			else
				a_node := a_node_value.node
				assert ("One element", a_node /= Void and then a_node.node_type = Element_node)
				if not attached {XM_XPATH_ELEMENT} a_node as an_element then
					assert ("an_element_not_void" , False)
				else
					assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
					assert ("Science cataegory", attached an_element.attribute_value_by_name ("", "DESC") as l_attribute_value and then STRING_.same_string (l_attribute_value, "Science"))
				end
			end
		end

	test_gexslt_xpath_scheme
			-- Test gexslt:xpath() scheme.
		local
			a_processor: XM_XPATH_XPOINTER
			a_document: detachable XM_XPATH_DOCUMENT
			system_id: STRING
			an_xpath_scheme: XM_XPATH_XPOINTER_XPATH_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			check asserted_above: a_document /= Void then end
			create a_processor.make (True)
			create an_xpath_scheme.make
			a_processor.register_scheme (an_xpath_scheme)
			create an_xmlns_scheme.make
			a_processor.register_scheme (an_xmlns_scheme)
			a_processor.evaluate ("xmlns(gexslt = " + Gexslt_eiffel_type_uri + ") gexslt:xpath(/BOOKLIST/CATEGORIES/CATEGORY[1])", a_document)
			assert ("Evaluated without error", attached a_processor.value as l_value and then not l_value.is_error)
			if not attached {XM_XPATH_SEQUENCE_EXTENT} a_processor.value as a_sequence_extent then
				assert ("Sequence_extent", False)
			else
				assert ("One item", a_sequence_extent.count = 1)
				if not attached {XM_XPATH_ELEMENT} a_sequence_extent.item_at (1) as an_element then
					assert ("an_element_not_void" , False)
				else
					assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
					assert ("Science cataegory", attached an_element.attribute_value_by_name ("", "DESC") as l_attribute_value and then STRING_.same_string (l_attribute_value, "Science"))
				end
			end
		end

	test_xpath_scheme
			-- Test W3C xpath() scheme.
		local
			a_processor: XM_XPATH_XPOINTER
			a_document: detachable XM_XPATH_DOCUMENT
			system_id: STRING
			an_xpath_scheme: XM_XPATH_XPOINTER_XPATH_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
		do
			conformance.set_basic_xslt_processor
			system_id := books_xml_uri.full_reference
			make_parser (system_id)
			parser.parse_from_system (system_id)
			assert ("No parsing error", not tree_pipe.tree.has_error)
			a_document := tree_pipe.document
			assert ("Document not void", a_document /= Void)
			check asserted_above: a_document /= Void then end
			create a_processor.make (True)
			create an_xpath_scheme.make_w3c
			a_processor.register_scheme (an_xpath_scheme)
			create an_xmlns_scheme.make
			a_processor.register_scheme (an_xmlns_scheme)
			a_processor.evaluate ("xpath2(/BOOKLIST/CATEGORIES/CATEGORY[1])", a_document)
			assert ("Evaluated without error", attached a_processor.value as l_value and then not l_value.is_error)
			if not attached {XM_XPATH_SEQUENCE_EXTENT} a_processor.value as a_sequence_extent then
				assert ("Sequence_extent", False)
			else
				assert ("Sequence_extent", a_sequence_extent /= Void)
				assert ("One item", a_sequence_extent.count = 1)
				if not attached {XM_XPATH_ELEMENT} a_sequence_extent.item_at (1) as an_element then
					assert ("an_element_not_void" , False)
				else
					assert ("Category element", an_element /= Void and then STRING_.same_string (an_element.local_part, "CATEGORY"))
					assert ("Science cataegory",attached an_element.attribute_value_by_name ("", "DESC") as l_attribute_value and then STRING_.same_string (l_attribute_value, "Science"))
				end
			end
		end

feature {NONE} -- Implementation

	make_parser (a_base_uri: STRING)
		require
			a_base_uri_not_void: a_base_uri /= Void
		local
			l_uri: UT_URI
		do
			create l_uri.make (a_base_uri)
			create parser.make
			parser.set_resolver (new_file_resolver_current_directory)
			create tree_pipe.make (parser, False, a_base_uri, l_uri)
			parser.set_callbacks (tree_pipe.start)
			parser.set_dtd_callbacks (tree_pipe.emitter)
			parser.set_string_mode_ascii
		end

	parser: XM_EIFFEL_PARSER
	tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE

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

