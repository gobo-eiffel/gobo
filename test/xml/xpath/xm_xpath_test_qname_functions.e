note

	description:

		"Test XPath QName functions."

	test_status: "ok_to_run"
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_QNAME_FUNCTIONS

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

	test_qname_in_null_namespace is
			-- Test fn:resolve-QName('hello', /*[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-QName('hello', /*[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("QName value", evaluated_items.item (1).is_qname_value)
			assert ("No prefix", evaluated_items.item (1).as_qname_value.optional_prefix.count = 0)
			assert ("No namespace", evaluated_items.item (1).as_qname_value.namespace_uri.count = 0)
			assert ("correct name", STRING_.same_string (evaluated_items.item (1).as_qname_value.local_name, "hello"))
		end

	test_qname_in_declared_namespace is
			-- Test fn:resolve-QName('eg:myFunc', /*[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-QName('eg:myFunc', /*[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("QName value", evaluated_items.item (1).is_qname_value)
			assert ("Prefix is eg", STRING_.same_string (evaluated_items.item (1).as_qname_value.optional_prefix, "eg"))
			assert ("Correct namespace", STRING_.same_string (evaluated_items.item (1).as_qname_value.namespace_uri, "http://www.gobosoft.com/xpath-tests/eg"))
			assert ("correct name", STRING_.same_string (evaluated_items.item (1).as_qname_value.local_name, "myFunc"))
		end

	test_qname is
			-- Test fn:QName("http://www.example.com/example", "ht:person").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("QName('http://www.example.com/example', 'ht:person')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("QName value", evaluated_items.item (1).is_qname_value)
			assert ("Prefix is eg", STRING_.same_string (evaluated_items.item (1).as_qname_value.optional_prefix, "ht"))
			assert ("Correct namespace", STRING_.same_string (evaluated_items.item (1).as_qname_value.namespace_uri, "http://www.example.com/example"))
			assert ("correct name", STRING_.same_string (evaluated_items.item (1).as_qname_value.local_name, "person"))
		end

	test_qname_no_prefix is
			-- Test fn:QName("http://www.example.com/example", "person").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("QName('http://www.example.com/example', 'person')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("QName value", evaluated_items.item (1).is_qname_value)
			assert ("No prefix", evaluated_items.item (1).as_qname_value.optional_prefix.count = 0)
			assert ("Correct namespace", STRING_.same_string (evaluated_items.item (1).as_qname_value.namespace_uri, "http://www.example.com/example"))
			assert ("correct name", STRING_.same_string (evaluated_items.item (1).as_qname_value.local_name, "person"))
		end

	test_namespace_uri_from_qname is
			-- Test fn:namespace-uri-from-QName(fn:QName("http://www.example.com/example", "person")).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("namespace-uri-from-QName(QName('http://www.example.com/example', 'person'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert ("Correct namespace", STRING_.same_string (evaluated_items.item (1).as_any_uri.string_value, "http://www.example.com/example"))
		end

	test_local_name_from_qname is
			-- Test fn:local-name-from-QName(fn:QName("http://www.example.com/example", "person")).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("local-name-from-QName(QName('http://www.example.com/example', 'person'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value (basic- XSLT support)", evaluated_items.item (1).is_string_value)
			assert ("Correct name", STRING_.same_string (evaluated_items.item (1).string_value, "person"))
		end

	test_no_prefix_from_qname is
			-- Test fn:prefix-from-QName(fn:QName("http://www.example.com/example", "person")).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("prefix-from-QName(QName('http://www.example.com/example', 'person'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_prefix_from_qname is
			-- Test fn:prefix-from-QName(fn:QName("http://www.example.com/example", "people:person")).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (qnames_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("prefix-from-QName(QName('http://www.example.com/example', 'people:person'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value (basic- XSLT support)", evaluated_items.item (1).is_string_value)
			assert ("Correct name", STRING_.same_string (evaluated_items.item (1).string_value, "people"))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

feature {NONE} -- Implementation

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
		
	qnames_xml_uri: UT_URI is
			-- URI of file 'qnames.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "qnames.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			qnames_xml_uri_not_void: Result /= Void
		end
		
end

			
