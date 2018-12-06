note

	description:

		"Test XPath base-uri() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

		-- TODO: awaiting ability to properly calculate Base URI of PIs

class XM_XPATH_TEST_BASE_URI

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

feature -- Access

	document_uri: STRING
			-- Base-uri of books2.xml
		local
			a_uri: UT_URI
		once
			create a_uri.make_resolve (base_directory, "./data/base_uri_master.xml")
			Result := a_uri.full_reference
		end

	secondary_uri: STRING
			-- Base-uri of base_uri_a.xml
		local
			a_uri: UT_URI
		once
			create a_uri.make_resolve (base_directory, "./data/base_uri_a.xml")
			Result := a_uri.full_reference
		end

	nested_xml_base_uri: STRING
			-- Base-uri of nested element with xml:base
		once
			Result := "http://www.gobosoft.com/xml-tests/AAMilne-book"
		end

	xml_base_uri: STRING
			-- Base-uri of element with xml:base
		once
			Result := "urn:base-uri:element2"
		end

	base_directory: UT_URI
			-- URI of directory containing this class
		local
			l_uri: STRING
		once
			l_uri := file_system.nested_pathname ("${GOBO}", <<"library", "xpath", "test", "unit", "dummy.xml">>)
			l_uri := Execution_environment.interpreted_string (l_uri)
			Result := File_uri.filename_to_uri (l_uri)
		end

feature -- Tests

	test_implicit_document_root
			-- Test fn:base-uri().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri()")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_case_insensitive_equal ("Correct base-URI", document_uri, a_uri.string_value)
			end
		end

	test_context_item_not_a_node
			-- Test (1,2,3)[fn:base-uri() eq 'fred'].
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("(1,2,3)[base-uri() eq 'fred']")
			assert ("Evaluation error", an_evaluator.is_error)
			assert_strings_equal ("Error FORG0006", "FORG0006", an_evaluator.error_value.code)
		end

	test_empty_sequence
			-- Test fn:base-uri(()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("Empty sequence", evaluated_items.count = 0)
		end

	test_empty_sequence_tiny_tree
			-- Test fn:base-uri(()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("Empty sequence",  evaluated_items.count = 0)
		end

	test_element_with_xml_base
			-- Test fn:base-uri(/*[1]/*[2]/ITEM[2]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/ITEM[2])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", nested_xml_base_uri, a_uri.string_value)
			end
		end

	test_element_with_xml_base_tiny_tree
			-- Test fn:base-uri(/*[1]/*[2]/ITEM[2]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/ITEM[2])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", nested_xml_base_uri, a_uri.string_value)
			end
		end

	test_element
			-- Test fn:base-uri(/*[1]/*[2]/ITEM[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/ITEM[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_case_insensitive_equal ("Correct base-URI", secondary_uri, a_uri.string_value)
			end
		end

	test_element_tiny_tree
			-- Test fn:base-uri(/*[1]/*[2]/ITEM[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/ITEM[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_case_insensitive_equal ("Correct base-URI", secondary_uri, a_uri.string_value)
			end
		end

	test_nested_element
			-- Test fn:base-uri(/*[1]/*[2]/nested-element).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/nested-element)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", xml_base_uri, a_uri.string_value)
			end
		end

	test_nested_element_tiny_tree
			-- Test fn:base-uri(/*[1]/*[2]/nested-element).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[2]/nested-element)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", xml_base_uri, a_uri.string_value)
			end
		end

	test_pi_child_of_element_with_xml_base
			-- Test fn:base-uri(/*[1]/*[1]/ITEM[2]/processing-instruction()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[1]/ITEM[2]/processing-instruction())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", nested_xml_base_uri, a_uri.string_value)
			end
		end

	test_pi_child_of_element_with_xml_base_tiny_tree
			-- Test fn:base-uri(/*[1]/*[1]/ITEM[2]/processing-instruction()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[1]/ITEM[2]/processing-instruction())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_equal ("Correct base-URI", nested_xml_base_uri, a_uri.string_value)
			end
		end

	test_pi_at_top_level
			-- Test fn:base-uri(/*[1]/*[1]/processing-instruction()[2]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, False, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[1]/processing-instruction()[2])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item",  evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_case_insensitive_equal ("Correct base-URI", secondary_uri, a_uri.string_value)
			end
		end

	test_pi_at_top_level_tiny_tree
			-- Test fn:base-uri(/*[1]/*[1]/processing-instruction()[2]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: detachable DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (base_uri_master_xml_uri.full_reference, False, False, True, True)
			assert ("Build successful", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("base-uri(/*[1]/*[1]/processing-instruction()[2])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluation error 2", evaluated_items /= Void)
			check asserted_above: evaluated_items /= Void then end
			assert ("One evaluated item", an_evaluator /= Void and then evaluated_items.count = 1)
			if not attached {XM_XPATH_ANY_URI_VALUE} evaluated_items.item (1) as a_uri then
				assert ("AnyURI value", False)
			else
				assert_strings_case_insensitive_equal ("Correct base-URI", secondary_uri, a_uri.string_value)
			end
		end

	set_up
			-- <Precursor>.
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

	base_uri_master_xml_uri: UT_URI
			-- URI of file 'base_uri_master.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "base_uri_master.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			base_uri_master_xml_uri_not_void: Result /= Void
		end

end
