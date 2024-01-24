note

	description:

		"Test XPath node-name() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TEST_NODE_NAME

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_SHARED_CONFORMANCE

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_empty_sequence
			-- Test fn:node-name(()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_type_error
			-- Test fn:node-name("").
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name('')")
			assert ("Evaluation error", an_evaluator.is_error)
		end

	test_pi
			-- Test fn:node-name(/*[1]/processing-instruction()[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (booklist_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1]/processing-instruction()[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_QNAME_VALUE} evaluated_items.item (1) as a_qname then
				assert ("QName", False)
			else
				assert ("Empty prefix", a_qname.optional_prefix.count = 0)
				assert ("Empty namespace", a_qname.namespace_uri.count = 0)
				assert ("correct name", STRING_.same_string (a_qname.local_name, "testpi3"))
			end
		end

	test_element
			-- Test fn:node-name(/*[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (booklist_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_QNAME_VALUE} evaluated_items.item (1) as a_qname then
				assert ("QName", False)
			else
				assert ("Empty prefix", a_qname.optional_prefix.count = 0)
				assert ("Empty namespace", a_qname.namespace_uri.count = 0)
				assert ("correct name", STRING_.same_string (a_qname.local_name, "BOOKS"))
			end
		end

	test_attribute_node
			-- Test fn:node-name(/*/*[6]/attribute::*[local-name() eq 'base']).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (booklist_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/BOOKS/ITEM[6]/attribute::*[local-name() eq 'base'])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			check asserted_above: evaluated_items /= Void then end
			if not attached {XM_XPATH_QNAME_VALUE} evaluated_items.item (1) as a_qname then
				assert ("QName", False)
			else
				assert ("Xml prefix",  STRING_.same_string (a_qname.optional_prefix, "xml"))
				assert ("Xml namespace",  STRING_.same_string (a_qname.namespace_uri, "http://www.w3.org/XML/1998/namespace"))
				assert ("correct name", STRING_.same_string (a_qname.local_name, "base"))
			end
		end

	test_text_node
			-- Test fn:node-name(/*[1]/*[1]/*[1]/text()[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1]/*[1]/*[1]/text()[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	set_up
		do
			conformance.set_basic_xslt_processor
		end

feature {NONE} -- Implementation

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

	booklist_xml_uri: UT_URI
			-- URI of file 'booklist.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "booklist.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			booklist_xml_uri_not_void: Result /= Void
		end

end


