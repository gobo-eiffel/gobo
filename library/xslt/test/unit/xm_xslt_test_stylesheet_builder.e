note

	description:

		"Test building XSLT stylesheet tree"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_STYLESHEET_BUILDER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_XSLT_STYLESHEET_COMPILER_HANDLER

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_simple
			-- Simple tree.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: detachable XM_XSLT_TRANSFORMER
			l_last_loaded_module: detachable XM_XPATH_TREE_DOCUMENT
			l_uri_source: XM_XSLT_URI_SOURCE
			l_template_1: detachable XM_XSLT_TEMPLATE
			l_template_2: detachable XM_XSLT_TEMPLATE
			l_template_3: detachable XM_XSLT_TEMPLATE
			l_template_4: detachable XM_XSLT_TEMPLATE
			l_template_5: detachable XM_XSLT_TEMPLATE
			l_template_6: detachable XM_XSLT_TEMPLATE
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			create l_transformer_factory.make (l_configuration)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (books_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			l_last_loaded_module := l_stylesheet_compiler.last_loaded_module
			assert ("Stylesheet not void", l_last_loaded_module /= Void)
			check asserted_above: l_last_loaded_module /= Void then end
			if not attached {XM_XSLT_STYLESHEET} l_last_loaded_module.document_element as l_document_element then
				assert ("document_element_not_void", False)
			elseif l_document_element.is_stylesheet_in_error then
				assert ("Stylesheet compiled without errors", False)
			elseif l_stylesheet_compiler.load_stylesheet_module_failed then
				assert ("Stylesheet compiled without errors", False)
			elseif not STRING_.same_string (l_document_element.node_name, "xsl:transform") then
				assert ("xsl:transform", False)
			elseif not attached {XM_XSLT_KEY} l_document_element.first_child as l_key_1 then
				assert ("xsl:key 1", False)
			elseif not attached {XM_XSLT_KEY} l_key_1.next_sibling as l_key_2 then
				assert ("xsl:key 2", False)
			elseif not attached {XM_XSLT_DECIMAL_FORMAT} l_key_2.next_sibling as l_decimal_format_1 then
				assert ("xsl:decimal-format", False)
			elseif not attached {XM_XSLT_VARIABLE} l_decimal_format_1.next_sibling as l_variable_1 then
				assert ("xsl:variable 1", False)
			elseif not attached {XM_XSLT_VARIABLE} l_variable_1.next_sibling as l_variable_2 then
				assert ("xsl:variable 2", False)
			elseif not attached {XM_XSLT_PARAM} l_variable_2.next_sibling as l_param_1 then
				assert ("xsl:param", False)
			elseif attached {XM_XSLT_TEMPLATE} l_param_1.next_sibling as l_template then
				l_template_1 := l_template
			end
				-- First template.
			if l_template_1 = Void then
				assert ("xsl:template", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_template_1.first_child as l_literal_result_1 then
				assert ("l_literal_result_1_not_void", False)
			elseif not STRING_.same_string (l_literal_result_1.node_name, "html") then
				assert ("html", False)
			elseif not attached {XM_XSLT_COMMENT} l_literal_result_1.first_child as l_comment_1 then
				assert ("xsl:comment", False)
			elseif not attached {XM_XSLT_CALL_TEMPLATE} l_comment_1.next_sibling as l_call_template_1 then
				assert ("xsl:call-template", False)
			elseif not attached {XM_XSLT_WITH_PARAM} l_call_template_1.first_child as l_with_param_1 then
				assert ("xsl:with-param", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_call_template_1.next_sibling as l_literal_result_2 then
				assert ("l_literal_result_2_not_void", False)
			elseif not STRING_.same_string (l_literal_result_2.node_name, "body") then
				assert ("body", False)
			elseif not attached {XM_XSLT_APPLY_TEMPLATES} l_literal_result_2.first_child as l_apply_templates_1 then
				assert ("xsl:apply-templates", False)
			elseif attached {XM_XSLT_TEMPLATE} l_template_1.next_sibling as l_template then
				l_template_2 := l_template
			end
				-- Second template.
			if l_template_2 = Void then
				assert ("xsl:template 2", False)
			elseif not attached {XM_XSLT_PARAM} l_template_2.first_child as l_param_2 then
				assert ("xsl:param 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_param_2.next_sibling as l_literal_result_3 then
				assert ("l_literal_result_3_not_void", False)
			elseif not STRING_.same_string (l_literal_result_3.node_name, "head") then
				assert ("head", False)
			elseif not attached {XM_XSLT_CHOOSE} l_literal_result_3.first_child as l_choose_1 then
				assert ("xsl:choose", False)
			elseif not attached {XM_XSLT_WHEN} l_choose_1.first_child as l_when_1 then
				assert ("xsl:when", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_when_1.first_child as l_literal_result_4 then
				assert ("l_literal_result_4_not_void", False)
			elseif not STRING_.same_string (l_literal_result_4.node_name, "title") then
				assert ("title", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_literal_result_4.first_child as l_value_of_1 then
				assert ("xsl:value-of", False)
			elseif not attached {XM_XSLT_OTHERWISE} l_when_1.next_sibling as l_otherwise_1 then
				assert ("xsl:otherwise", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_otherwise_1.first_child as l_literal_result_5 then
				assert ("l_literal_result_5_not_void", False)
			elseif not STRING_.same_string (l_literal_result_5.node_name, "title") then
				assert ("title 2", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_5.first_child as l_text_1 then
				assert ("l_text_1_not_void", False)
			elseif not STRING_.same_string (l_text_1.string_value, "Untitled") then
				assert ("xsl:text", False)
			elseif attached {XM_XSLT_TEMPLATE} l_template_2.next_sibling as l_template then
				l_template_3 := l_template
			end
				-- Third template.
			if l_template_3 = Void then
				assert ("xsl:template 3", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_template_3.first_child as l_literal_result_6 then
				assert ("l_literal_result_6_not_void", False)
			elseif not STRING_.same_string (l_literal_result_6.node_name, "h2") then
				assert ("h2", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_6.first_child as l_text_2 then
				assert ("l_text_2_not_void", False)
			elseif not STRING_.same_string (l_text_2.string_value, "This week's top author is ") then
				assert ("xsl:text 2", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_text_2.next_sibling as l_value_of_2 then
				assert ("xsl:value-of 2", False)
			elseif not attached {XM_XSLT_VARIABLE} l_literal_result_6.next_sibling as l_variable_3 then
				assert ("xsl:variable 3", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_variable_3.next_sibling as l_literal_result_7 then
				assert ("l_literal_result_7_not_void", False)
			elseif not STRING_.same_string (l_literal_result_7.node_name, "p") then
				assert ("p", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_7.first_child as l_text_3 then
				assert ("l_text_3_not_void", False)
			elseif not STRING_.same_string (l_text_3.string_value, "We stock the following ") then
				assert ("xsl:text 3", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_text_3.next_sibling as l_value_of_3 then
				assert ("xsl:value-of 3", False)
			elseif not attached {XM_XPATH_TEXT} l_value_of_3.next_sibling as l_text_4 then
				assert ("l_text_4_not_void", False)
			elseif not STRING_.same_string (l_text_4.string_value, " books by this author:") then
				assert ("xsl:text 4", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_7.next_sibling as l_literal_result_8 then
				assert ("l_literal_result_8_not_void", False)
			elseif not STRING_.same_string (l_literal_result_8.node_name, "ul") then
				assert ("ul", False)
			elseif not attached {XM_XSLT_FOR_EACH} l_literal_result_8.first_child as l_for_each_1 then
				assert ("xsl:for-each", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_for_each_1.first_child as l_second_literal_result_1 then
				assert ("l_second_literal_result_1_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_1.node_name, "li") then
				assert ("li", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_second_literal_result_1.first_child as l_value_of_4 then
				assert ("xsl:value-of 4", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_8.next_sibling as l_literal_result_9 then
				assert ("l_literal_result_9_not_void", False)
			elseif not STRING_.same_string (l_literal_result_9.node_name, "p") then
				assert ("p 2", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_9.first_child as l_text_5 then
				assert ("l_text_5_not_void", False)
			elseif not STRING_.same_string (l_text_5.string_value, "This author has written books in the following categories:") then
				assert ("xsl:text 5", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_9.next_sibling as l_literal_result_10 then
				assert ("l_literal_result_10_not_void", False)
			elseif not STRING_.same_string (l_literal_result_10.node_name, "ul") then
				assert ("ul 2", False)
			elseif not attached {XM_XSLT_FOR_EACH} l_literal_result_10.first_child as l_for_each_2 then
				assert ("xsl:for-each 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_for_each_2.first_child as l_second_literal_result_2 then
				assert ("l_second_literal_result_2_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_2.node_name, "li") then
				assert ("li 2", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_second_literal_result_2.first_child as l_value_of_5 then
				assert ("xsl:value-of 5", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_10.next_sibling as l_literal_result_11 then
				assert ("l_literal_result_11_not_void", False)
			elseif not STRING_.same_string (l_literal_result_11.node_name, "p") then
				assert ("p 3", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_11.first_child as l_text_6 then
				assert ("l_text_6_not_void", False)
			elseif not STRING_.same_string (l_text_6.string_value, "The average price of these books is: %N        ") then
				assert ("xsl:text 6", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_second_literal_result_2.first_child as l_value_of_6 then
				assert ("xsl:value-of 6", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_11.next_sibling as l_literal_result_12 then
				assert ("l_literal_result_12_not_void", False)
			elseif not STRING_.same_string (l_literal_result_12.node_name, "h2") then
				assert ("h2 2", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_12.first_child as l_text_7 then
				assert ("l_text_7_not_void", False)
			elseif not STRING_.same_string (l_text_7.string_value, "A complete list of books, grouped by author") then
				assert ("xsl:text 7", False)
			elseif not attached {XM_XSLT_APPLY_TEMPLATES} l_literal_result_12.next_sibling as l_apply_templates_2 then
				assert ("xsl:apply-templates 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_apply_templates_2.next_sibling as l_literal_result_13 then
				assert ("l_literal_result_13_not_void", False)
			elseif not STRING_.same_string (l_literal_result_13.node_name, "h2") then
				assert ("h2 3", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_13.first_child as l_text_8 then
				assert ("l_text_8_not_void", False)
			elseif not STRING_.same_string (l_text_8.string_value, "A complete list of books, grouped by category") then
				assert ("xsl:text 8", False)
			elseif not attached {XM_XSLT_APPLY_TEMPLATES} l_literal_result_13.next_sibling as l_apply_templates_3 then
				assert ("xsl:apply-templates 3", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_apply_templates_3.next_sibling as l_literal_result_14 then
				assert ("l_literal_result_14_not_void", False)
			elseif not STRING_.same_string (l_literal_result_14.node_name, "h2") then
				assert ("h2 4", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_14.first_child as l_text_9 then
				assert ("l_text_9_not_void", False)
			elseif not STRING_.same_string (l_text_9.string_value, "List of categories") then
				assert ("xsl:text 9", False)
			elseif not STRING_.same_string (l_text_9.string_value, "List of categories") then
				assert ("xsl:text 9", False)
			elseif not attached {XM_XSLT_APPLY_TEMPLATES} l_literal_result_14.next_sibling as l_apply_templates_4 then
				assert ("xsl:apply-templates 4", False)
			elseif not attached {XM_XSLT_SORT} l_apply_templates_4.first_child as l_sort_1 then
				assert ("sort", False)
			elseif not attached {XM_XSLT_SORT} l_sort_1.next_sibling as l_sort_2 then
				assert ("sort 2", False)
			elseif attached {XM_XSLT_TEMPLATE} l_template_3.next_sibling as l_template then
				l_template_4 := l_template
			end
				-- Fourth template.
			if l_template_4 = Void then
				assert ("xsl:template 4", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_template_4.first_child as l_literal_result_15 then
				assert ("l_literal_result_15_not_void", False)
			elseif not STRING_.same_string (l_literal_result_15.node_name, "div") then
				assert ("div", False)
			elseif not attached {XM_XSLT_FOR_EACH_GROUP} l_literal_result_15.first_child as l_for_each_group_1 then
				assert ("xsl:for-each-group", False)
			elseif not attached {XM_XSLT_SORT} l_for_each_group_1.first_child as l_sort_3 then
				assert ("sort 3", False)
			elseif not attached {XM_XSLT_SORT} l_sort_3.next_sibling as l_sort_4 then
				assert ("sort 4", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_sort_4.next_sibling as l_literal_result_16 then
				assert ("l_literal_result_16_not_void", False)
			elseif not STRING_.same_string (l_literal_result_16.node_name, "h3") then
				assert ("h3", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_16.first_child as l_text_10 then
				assert ("l_text_10_not_void", False)
			elseif not STRING_.same_string (l_text_10.string_value, "AUTHOR: ") then
				assert ("xsl:text 10", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_text_10.next_sibling as l_value_of_7 then
				assert ("xsl:value-of 7", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_16.next_sibling as l_literal_result_17 then
				assert ("l_literal_result_17_not_void", False)
			elseif not STRING_.same_string (l_literal_result_17.node_name, "table") then
				assert ("table", False)
			elseif not attached {XM_XSLT_FOR_EACH} l_literal_result_17.first_child as l_for_each_3 then
				assert ("xsl:for-each 3", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_for_each_3.first_child as l_second_literal_result_3 then
				assert ("l_second_literal_result_3_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_3.node_name, "tr") then
				assert ("tr", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_second_literal_result_3.first_child as l_second_literal_result_4 then
				assert ("l_second_literal_result_4_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_4.node_name, "td") then
				assert ("td", False)
			elseif not attached {XM_XSLT_NUMBER} l_second_literal_result_4.first_child as l_number_1 then
				assert ("xsl:number", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_second_literal_result_4.next_sibling as l_second_literal_result_5 then
				assert ("l_second_literal_result_5_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_5.node_name, "td") then
				assert ("td 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_17.next_sibling as l_literal_result_18 then
				assert ("l_literal_result_18_not_void", False)
			elseif not STRING_.same_string (l_literal_result_18.node_name, "hr") then
				assert ("hr", False)
			elseif attached {XM_XSLT_TEMPLATE} l_template_4.next_sibling as l_template then
				l_template_5 := l_template
			end
				-- Fifth template.
			if l_template_5 = Void then
				assert ("xsl:template 5", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_template_5.first_child as l_literal_result_19 then
				assert ("l_literal_result_19_not_void", False)
			elseif not STRING_.same_string (l_literal_result_19.node_name, "div") then
				assert ("div 2", False)
			elseif not attached {XM_XSLT_FOR_EACH_GROUP} l_literal_result_19.first_child as l_for_each_group_2 then
				assert ("xsl:for-each-group 2", False)
			elseif not attached {XM_XSLT_SORT} l_for_each_group_2.first_child as l_sort_5 then
				assert ("sort 5", False)
			elseif not attached {XM_XSLT_SORT} l_sort_5.next_sibling as l_sort_6 then
				assert ("sort 6", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_sort_6.next_sibling as l_literal_result_20 then
				assert ("l_literal_result_20_not_void", False)
			elseif not STRING_.same_string (l_literal_result_20.node_name, "h3") then
				assert ("h3 2", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_20.first_child as l_text_11 then
				assert ("l_text_11_not_void", False)
			elseif not STRING_.same_string (l_text_11.string_value, "CATEGORY: ") then
				assert ("xsl:text 11", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_text_11.next_sibling as l_value_of_8 then
				assert ("xsl:value-of 8", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_20.next_sibling as l_literal_result_21 then
				assert ("l_literal_result_21_not_void", False)
			elseif not STRING_.same_string (l_literal_result_21.node_name, "ol") then
				assert ("ol", False)
			elseif not attached {XM_XSLT_FOR_EACH} l_literal_result_21.first_child as l_for_each_4 then
				assert ("xsl:for-each 4", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_for_each_4.first_child as l_second_literal_result_6 then
				assert ("l_second_literal_result_6_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_6.node_name, "li") then
				assert ("li 3", False)
			elseif not attached {XM_XPATH_TEXT} l_second_literal_result_6.first_child as l_text_12 then
				assert ("l_text_12_not_void", False)
			elseif not STRING_.same_string (l_text_12.string_value, "AUTHOR: ") then
				assert ("xsl:text 12", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_text_12.next_sibling as l_value_of_9 then
				assert ("xsl:value-of 9", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_value_of_9.next_sibling as l_second_literal_result_7 then
				assert ("l_second_literal_result_7_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_7.node_name, "br") then
				assert ("br", False)
			elseif not attached {XM_XPATH_TEXT} l_second_literal_result_7.next_sibling as l_text_13 then
				assert ("l_text_13_not_void", False)
			elseif not STRING_.same_string (l_text_13.string_value, "%N                TITLE: ") then
				assert ("xsl:text 13", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_21.next_sibling as l_literal_result_22 then
				assert ("l_literal_result_22_not_void", False)
			elseif not STRING_.same_string (l_literal_result_22.node_name, "hr") then
				assert ("hr 2", False)
			elseif attached {XM_XSLT_TEMPLATE} l_template_5.next_sibling as l_template then
				l_template_6 := l_template
			end
				-- Sixth template.
			if l_template_6 = Void then
				assert ("xsl:template 6", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_template_6.first_child as l_literal_result_23 then
				assert ("l_literal_result_23_not_void", False)
			elseif not STRING_.same_string (l_literal_result_23.node_name, "h4") then
				assert ("h4", False)
			elseif not attached {XM_XPATH_TEXT} l_literal_result_23.first_child as l_text_14 then
				assert ("l_text_14_not_void", False)
			elseif not STRING_.same_string (l_text_14.string_value, "CATEGORY ") then
				assert ("xsl:text 14", False)
			elseif not attached {XM_XSLT_NUMBER} l_text_14.next_sibling as l_number_2 then
				assert ("xsl:number 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_23.next_sibling as l_literal_result_24 then
				assert ("l_literal_result_24_not_void", False)
			elseif not STRING_.same_string (l_literal_result_24.node_name, "table") then
				assert ("table 2", False)
			elseif not attached {XM_XSLT_FOR_EACH} l_literal_result_24.first_child as l_for_each_5 then
				assert ("xsl:for-each 5", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_for_each_5.first_child as l_second_literal_result_8 then
				assert ("l_second_literal_result_8_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_8.node_name, "tr") then
				assert ("tr 2", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_second_literal_result_8.first_child as l_second_literal_result_9 then
				assert ("l_second_literal_result_9_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_9.node_name, "td") then
				assert ("td 3", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_second_literal_result_9.first_child as l_value_of_10 then
				assert ("xsl:value-of 10", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_second_literal_result_9.next_sibling as l_second_literal_result_10 then
				assert ("l_second_literal_result_10_not_void", False)
			elseif not STRING_.same_string (l_second_literal_result_10.node_name, "td") then
				assert ("td 4", False)
			elseif not attached {XM_XSLT_VALUE_OF} l_second_literal_result_10.first_child as l_value_of_11 then
				assert ("xsl:value-of 11", False)
			elseif not attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_literal_result_24.next_sibling as l_literal_result_25 then
				assert ("l_literal_result_25_not_void", False)
			elseif not STRING_.same_string (l_literal_result_25.node_name, "hr") then
				assert ("hr 3", False)
			end
			l_transformer := l_stylesheet_compiler.new_transformer (l_transformer_factory, Void)
			assert ("transformer", l_transformer /= Void)
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

	dummy_uri: UT_URI
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	books_xsl_uri: UT_URI
			-- URI of file 'books.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "books.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			books_xsl_uri_not_void: Result /= Void
		end

end
