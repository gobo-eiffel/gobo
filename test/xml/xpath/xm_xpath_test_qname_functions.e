indexing

	description:

		"Test XPath QName functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_QNAME_FUNCTIONS

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

feature -- Tests

	test_qname_in_null_namespace is
			-- Test fn:resolve-QName('hello', /*[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context ("./data/qnames.xml", False, False, False, True)
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
			an_evaluator.build_static_context ("./data/qnames.xml", False, False, False, True)
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
			an_evaluator.build_static_context ("./data/qnames.xml", False, False, False, True)
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
			an_evaluator.build_static_context ("./data/qnames.xml", False, False, False, True)
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
			an_evaluator.build_static_context ("./data/qnames.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("namespace-uri-from-QName(QName('http://www.example.com/example', 'person'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert ("Correct namespace", STRING_.same_string (evaluated_items.item (1).as_any_uri.string_value, "http://www.example.com/example"))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
