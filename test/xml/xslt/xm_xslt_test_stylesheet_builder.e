indexing

	description:

		"Test building XSLT stylesheet tree"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_STYLESHEET_BUILDER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_simple is
			-- Simple tree.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_document_element: XM_XSLT_STYLESHEET
			l_key: XM_XSLT_KEY
			l_decimal_format: XM_XSLT_DECIMAL_FORMAT
			l_variable: XM_XSLT_VARIABLE
			l_param: XM_XSLT_PARAM
			l_template: XM_XSLT_TEMPLATE
			l_literal_result, l_second_literal_result: XM_XSLT_LITERAL_RESULT_ELEMENT
			l_comment: XM_XSLT_COMMENT
			l_call_template: XM_XSLT_CALL_TEMPLATE
			l_with_param: XM_XSLT_WITH_PARAM
			l_apply_templates: XM_XSLT_APPLY_TEMPLATES
			l_choose: XM_XSLT_CHOOSE
			l_when: XM_XSLT_WHEN
			l_otherwise: XM_XSLT_OTHERWISE
			l_value_of: XM_XSLT_VALUE_OF
			l_text: XM_XPATH_TEXT
			l_for_each: XM_XSLT_FOR_EACH
			l_for_each_group: XM_XSLT_FOR_EACH_GROUP
			l_sort: XM_XSLT_SORT
			l_number: XM_XSLT_NUMBER
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
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_document_element ?= l_stylesheet_compiler.last_loaded_module.document_element
			--print (l_document_element.error_value.error_message)
			assert ("Stylesheet compiled without errors", not l_document_element.is_stylesheet_in_error)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("xsl:transform", l_document_element /= Void and then STRING_.same_string (l_document_element.node_name, "xsl:transform"))
			l_key ?= l_document_element.first_child
			assert ("xsl:key 1", l_key /= Void)
			l_key ?= l_key.next_sibling
			assert ("xsl:key 2", l_key /= Void)
			l_decimal_format ?= l_key.next_sibling
			assert ("xsl:decimal-format", l_decimal_format /= Void)
			l_variable ?= l_decimal_format.next_sibling
			assert ("xsl:variable 1", l_variable /= Void)
			l_variable ?= l_variable.next_sibling
			assert ("xsl:variable 2", l_variable /= Void)
			l_param ?= l_variable.next_sibling
			assert ("xsl:param", l_param /= Void)
			l_template ?= l_param.next_sibling
			assert ("xsl:template", l_template /= Void)
			l_literal_result ?= l_template.first_child
			assert ("html", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "html"))
			l_comment ?= l_literal_result.first_child
			assert ("xsl:comment", l_comment /= Void)
			l_call_template ?= l_comment.next_sibling
			assert ("xsl:call-template", l_call_template /= Void)
			l_with_param ?= l_call_template.first_child
			assert ("xsl:with-param", l_with_param /= Void)
			l_literal_result ?= l_call_template.next_sibling
			assert ("body", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "body"))
			l_apply_templates ?= l_literal_result.first_child
			assert ("xsl:apply-templates", l_apply_templates /= Void)

			l_template ?= l_template.next_sibling
			assert ("xsl:template 2", l_template /= Void)
			l_param ?= l_template.first_child
			assert ("xsl:param 2", l_param /= Void)
			l_literal_result ?= l_param.next_sibling
			assert ("head", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "head"))
			l_choose ?=	l_literal_result.first_child
			assert ("xsl:choose", l_choose /= Void)
			l_when ?= l_choose.first_child
			assert ("xsl:when", l_when /= Void)
			l_literal_result ?= l_when.first_child
			assert ("title", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "title"))
			l_value_of ?= l_literal_result.first_child
			assert ("xsl:value-of", l_value_of /= Void)
			l_otherwise ?= l_when.next_sibling
			assert ("xsl:otherwise", l_otherwise /= Void)
			l_literal_result ?= l_otherwise.first_child
			assert ("title 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "title"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text", l_text /= Void and then STRING_.same_string (l_text.string_value, "Untitled"))

			l_template ?= l_template.next_sibling
			assert ("xsl:template 3", l_template /= Void)
			l_literal_result ?= l_template.first_child
			assert ("h2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h2"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 2", l_text /= Void and then STRING_.same_string (l_text.string_value, "This week's top author is "))
			l_value_of ?= l_text.next_sibling
			assert ("xsl:value-of 2", l_value_of /= Void)
			l_variable ?= l_literal_result.next_sibling
			assert ("xsl:variable 3", l_variable /= Void)
			l_literal_result ?= l_variable.next_sibling
			assert ("p", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "p"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 3", l_text /= Void and then STRING_.same_string (l_text.string_value, "We stock the following "))
			l_value_of ?= l_text.next_sibling
			assert ("xsl:value-of 3", l_value_of /= Void)
			l_text ?= l_value_of.next_sibling
			assert ("xsl:text 4", l_text /= Void and then STRING_.same_string (l_text.string_value, " books by this author:"))
			l_literal_result ?= l_literal_result.next_sibling
			assert ("ul", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "ul"))
			l_for_each ?= l_literal_result.first_child
			assert ("xsl:for-each", l_for_each /= Void)
			l_second_literal_result ?= l_for_each.first_child
			assert ("li", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "li"))
			l_value_of ?= l_second_literal_result.first_child
			assert ("xsl:value-of 4", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("p 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "p"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 5", l_text /= Void and then STRING_.same_string (l_text.string_value, "This author has written books in the following categories:"))
			l_literal_result ?= l_literal_result.next_sibling
			assert ("ul 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "ul"))
			l_for_each ?= l_literal_result.first_child
			assert ("xsl:for-each 2", l_for_each /= Void)
			l_second_literal_result ?= l_for_each.first_child
			assert ("li 2", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "li"))
			l_value_of ?= l_second_literal_result.first_child
			assert ("xsl:value-of 5", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("p 3", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "p"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 6", l_text /= Void and then STRING_.same_string (l_text.string_value, "The average price of these books is: %N        "))
			l_value_of ?= l_second_literal_result.first_child
			assert ("xsl:value-of 6", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("h2 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h2"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 7", l_text /= Void and then STRING_.same_string (l_text.string_value, "A complete list of books, grouped by author"))
			l_apply_templates ?= l_literal_result.next_sibling
			assert ("xsl:apply-templates 2", l_apply_templates /= Void)
			l_literal_result ?= l_apply_templates.next_sibling
			assert ("h2 3", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h2"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 8", l_text /= Void and then STRING_.same_string (l_text.string_value, "A complete list of books, grouped by category"))
			l_apply_templates ?= l_literal_result.next_sibling
			assert ("xsl:apply-templates 3", l_apply_templates /= Void)
			l_literal_result ?= l_apply_templates.next_sibling
			assert ("h2 4", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h2"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 9", l_text /= Void and then STRING_.same_string (l_text.string_value, "List of categories"))
			l_apply_templates ?= l_literal_result.next_sibling
			assert ("xsl:apply-templates 4", l_apply_templates /= Void)
			l_sort ?= l_apply_templates.first_child
			assert ("sort", l_sort /= Void)
			l_sort ?= l_sort.next_sibling
			assert ("sort 2", l_sort /= Void)

			l_template ?= l_template.next_sibling
			assert ("xsl:template 4", l_template /= Void)
			l_literal_result ?= l_template.first_child
			assert ("div", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "div"))
			l_for_each_group ?= l_literal_result.first_child
			assert ("xsl:for-each-group", l_for_each_group /= Void)
			l_sort ?= l_for_each_group.first_child
			assert ("sort 3", l_sort /= Void)
			l_sort ?= l_sort.next_sibling
			assert ("sort 4", l_sort /= Void)
			l_literal_result ?= l_sort.next_sibling
			assert ("h3", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h3"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 10", l_text /= Void and then STRING_.same_string (l_text.string_value, "AUTHOR: "))
			l_value_of ?= l_text.next_sibling
			assert ("xsl:value-of 7", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("table", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "table"))
			l_for_each ?= l_literal_result.first_child
			assert ("xsl:for-each 3", l_for_each /= Void)
			l_second_literal_result ?= l_for_each.first_child
			assert ("tr", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "tr"))
			l_second_literal_result ?= l_second_literal_result.first_child
			assert ("td", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "td"))
			l_number ?= l_second_literal_result.first_child
			assert ("xsl:number", l_number /= Void)
			l_second_literal_result ?= l_second_literal_result.next_sibling
			assert ("td 2", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "td"))
			l_literal_result ?= l_literal_result.next_sibling
			assert ("hr", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "hr"))

			l_template ?= l_template.next_sibling
			assert ("xsl:template 5", l_template /= Void)
			l_literal_result ?= l_template.first_child
			assert ("div 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "div"))
			l_for_each_group ?= l_literal_result.first_child
			assert ("xsl:for-each-group 2", l_for_each_group /= Void)
			l_sort ?= l_for_each_group.first_child
			assert ("sort 4", l_sort /= Void)
			l_sort ?= l_sort.next_sibling
			assert ("sort 5", l_sort /= Void)
			l_literal_result ?= l_sort.next_sibling
			assert ("h3 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h3"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 10", l_text /= Void and then STRING_.same_string (l_text.string_value, "CATEGORY: "))
			l_value_of ?= l_text.next_sibling
			assert ("xsl:value-of 8", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("ol", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "ol"))
			l_for_each ?= l_literal_result.first_child
			assert ("xsl:for-each 4", l_for_each /= Void)
			l_second_literal_result ?= l_for_each.first_child
			assert ("li 3", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "li"))
			l_text ?= l_second_literal_result.first_child
			assert ("xsl:text 11", l_text /= Void and then STRING_.same_string (l_text.string_value, "AUTHOR: "))
			l_value_of ?= l_text.next_sibling
			assert ("xsl:value-of 9", l_value_of /= Void)
			l_second_literal_result ?= l_value_of.next_sibling
			assert ("br", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "br"))
			l_text ?= l_second_literal_result.next_sibling
			assert ("xsl:text 12", l_text /= Void and then STRING_.same_string (l_text.string_value, "%N                TITLE: "))
			l_literal_result ?= l_literal_result.next_sibling
			assert ("hr 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "hr"))

			l_template ?= l_template.next_sibling
			assert ("xsl:template 6", l_template /= Void)
			l_literal_result ?= l_template.first_child
			assert ("h4", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "h4"))
			l_text ?= l_literal_result.first_child
			assert ("xsl:text 13", l_text /= Void and then STRING_.same_string (l_text.string_value, "CATEGORY "))
			l_number ?= l_text.next_sibling
			assert ("xsl:number 2", l_number /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("table 2", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "table"))
			l_for_each ?= l_literal_result.first_child
			assert ("xsl:for-each 5", l_for_each /= Void)
			l_second_literal_result ?= l_for_each.first_child
			assert ("tr 2", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "tr"))
			l_second_literal_result ?= l_second_literal_result.first_child
			assert ("td 3", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "td"))
			l_value_of ?= l_second_literal_result.first_child
			assert ("xsl:value-of 10", l_value_of /= Void)
			l_second_literal_result ?= l_second_literal_result.next_sibling
			assert ("td 4", l_second_literal_result /= Void and then STRING_.same_string (l_second_literal_result.node_name, "td"))
			l_value_of ?= l_second_literal_result.first_child
			assert ("xsl:value-of 11", l_value_of /= Void)
			l_literal_result ?= l_literal_result.next_sibling
			assert ("hr 3", l_literal_result /= Void and then STRING_.same_string (l_literal_result.node_name, "hr"))
			l_transformer := l_stylesheet_compiler.new_transformer (l_transformer_factory, Void)
			assert ("transformer", l_transformer /= Void)
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

	dummy_uri: UT_URI is
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	books_xsl_uri: UT_URI is
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
