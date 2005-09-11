indexing

	description:

		"Test XPath node-name() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_NODE_NAME

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

	test_empty_sequence is
			-- Test fn:node-name(()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_type_error is
			-- Test fn:node-name("").
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name('')")
			assert ("Evaluation error", an_evaluator.is_error)
		end

	test_pi is
			-- Test fn:node-name(/*[1]/processing-instruction()[1])..
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_qname: XM_XPATH_QNAME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/booklist.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1]/processing-instruction()[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_qname ?= evaluated_items.item (1)
			assert ("QName", a_qname /= Void)
			assert ("Empty prefix", a_qname.optional_prefix.count = 0)
			assert ("Empty namespace", a_qname.namespace_uri.count = 0)
			assert ("correct name", STRING_.same_string (a_qname.local_name, "testpi3"))
		end

	test_element is
			-- Test fn:node-name(/*[1])..
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_qname: XM_XPATH_QNAME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/booklist.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_qname ?= evaluated_items.item (1)
			assert ("QName", a_qname /= Void)
			assert ("Empty prefix", a_qname.optional_prefix.count = 0)
			assert ("Empty namespace", a_qname.namespace_uri.count = 0)
			assert ("correct name", STRING_.same_string (a_qname.local_name, "BOOKS"))
		end

	test_attribute_node is
			-- Test fn:node-name(/*/*[6]/attribute::*[local-name() eq 'base'])..
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_qname: XM_XPATH_QNAME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/booklist.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/BOOKS/ITEM[6]/attribute::*[local-name() eq 'base'])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_qname ?= evaluated_items.item (1)
			assert ("QName", a_qname /= Void)
			assert ("Xml prefix",  STRING_.same_string (a_qname.optional_prefix, "xml"))
			assert ("Xml namespace",  STRING_.same_string (a_qname.namespace_uri, "http://www.w3.org/XML/1998/namespace"))
			assert ("correct name", STRING_.same_string (a_qname.local_name, "base"))
		end

	test_text_node is
			-- Test fn:node-name(/*[1]/*[1]/*[1]/text()[1]).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("node-name(/*[1]/*[1]/*[1]/text()[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
