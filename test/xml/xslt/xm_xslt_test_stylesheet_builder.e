indexing

	description:

		"Test building XSLT stylesheet tree"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_STYLESHEET_BUILDER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

feature -- Test

	test_simple is
			-- Simple tree.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			a_document_element: XM_XSLT_STYLESHEET
			a_key: XM_XSLT_KEY
			a_decimal_format: XM_XSLT_DECIMAL_FORMAT
			a_variable: XM_XSLT_VARIABLE
			a_param: XM_XSLT_PARAM
			a_template: XM_XSLT_TEMPLATE
			a_literal_result, another_literal_result: XM_XSLT_LITERAL_RESULT_ELEMENT
			a_comment: XM_XSLT_COMMENT
			a_call_template: XM_XSLT_CALL_TEMPLATE
			a_with_param: XM_XSLT_WITH_PARAM
			an_apply_templates: XM_XSLT_APPLY_TEMPLATES
			a_choose: XM_XSLT_CHOOSE
			a_when: XM_XSLT_WHEN
			an_otherwise: XM_XSLT_OTHERWISE
			a_value_of: XM_XSLT_VALUE_OF
			a_text: XM_XPATH_TEXT
			a_for_each: XM_XSLT_FOR_EACH
			a_for_each_group: XM_XSLT_FOR_EACH_GROUP
			a_sort: XM_XSLT_SORT
			a_number: XM_XSLT_NUMBER
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (books_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_document_element ?= a_stylesheet_compiler.last_loaded_module.document_element
			--print (a_document_element.error_value.error_message)
			assert ("Stylesheet compiled without errors", not a_document_element.is_stylesheet_in_error)
			an_error_listener ?= a_stylesheet_compiler.error_listener
			assert ("No errors reported", an_error_listener /= Void and then an_error_listener.total_errors = 0)
			assert ("xsl:transform", a_document_element /= Void and then STRING_.same_string (a_document_element.node_name, "xsl:transform"))
			a_key ?= a_document_element.first_child
			assert ("xsl:key 1", a_key /= Void)
			a_key ?= a_key.next_sibling
			assert ("xsl:key 2", a_key /= Void)
			a_decimal_format ?= a_key.next_sibling
			assert ("xsl:decimal-format", a_decimal_format /= Void)
			a_variable ?= a_decimal_format.next_sibling
			assert ("xsl:variable 1", a_variable /= Void)
			a_variable ?= a_variable.next_sibling
			assert ("xsl:variable 2", a_variable /= Void)
			a_param ?= a_variable.next_sibling
			assert ("xsl:param", a_param /= Void)
			a_template ?= a_param.next_sibling
			assert ("xsl:template", a_template /= Void)
			a_literal_result ?= a_template.first_child
			assert ("html", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "html"))
			a_comment ?= a_literal_result.first_child
			assert ("xsl:comment", a_comment /= Void)
			a_call_template ?= a_comment.next_sibling
			assert ("xsl:call-template", a_call_template /= Void)
			a_with_param ?= a_call_template.first_child
			assert ("xsl:with-param", a_with_param /= Void)
			a_literal_result ?= a_call_template.next_sibling
			assert ("body", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "body"))
			an_apply_templates ?= a_literal_result.first_child
			assert ("xsl:apply-templates", an_apply_templates /= Void)

			a_template ?= a_template.next_sibling
			assert ("xsl:template 2", a_template /= Void)
			a_param ?= a_template.first_child
			assert ("xsl:param 2", a_param /= Void)
			a_literal_result ?= a_param.next_sibling
			assert ("head", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "head"))
			a_choose ?=	a_literal_result.first_child
			assert ("xsl:choose", a_choose /= Void)
			a_when ?= a_choose.first_child
			assert ("xsl:when", a_when /= Void)
			a_literal_result ?= a_when.first_child
			assert ("title", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "title"))
			a_value_of ?= a_literal_result.first_child
			assert ("xsl:value-of", a_value_of /= Void)
			an_otherwise ?= a_when.next_sibling
			assert ("xsl:otherwise", an_otherwise /= Void)
			a_literal_result ?= an_otherwise.first_child
			assert ("title 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "title"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text", a_text /= Void and then STRING_.same_string (a_text.string_value, "Untitled"))
			
			a_template ?= a_template.next_sibling
			assert ("xsl:template 3", a_template /= Void)
			a_literal_result ?= a_template.first_child
			assert ("h2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h2"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 2", a_text /= Void and then STRING_.same_string (a_text.string_value, "This week's top author is "))
			a_value_of ?= a_text.next_sibling
			assert ("xsl:value-of 2", a_value_of /= Void)
			a_variable ?= a_literal_result.next_sibling
			assert ("xsl:variable 3", a_variable /= Void)
			a_literal_result ?= a_variable.next_sibling
			assert ("p", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "p"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 3", a_text /= Void and then STRING_.same_string (a_text.string_value, "We stock the following "))
			a_value_of ?= a_text.next_sibling
			assert ("xsl:value-of 3", a_value_of /= Void)
			a_text ?= a_value_of.next_sibling
			assert ("xsl:text 4", a_text /= Void and then STRING_.same_string (a_text.string_value, " books by this author:"))
			a_literal_result ?= a_literal_result.next_sibling
			assert ("ul", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "ul"))
			a_for_each ?= a_literal_result.first_child
			assert ("xsl:for-each", a_for_each /= Void)
			another_literal_result ?= a_for_each.first_child
			assert ("li", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "li"))
			a_value_of ?= another_literal_result.first_child
			assert ("xsl:value-of 4", a_value_of /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("p 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "p"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 5", a_text /= Void and then STRING_.same_string (a_text.string_value, "This author has written books in the following categories:"))
			a_literal_result ?= a_literal_result.next_sibling
			assert ("ul 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "ul"))
			a_for_each ?= a_literal_result.first_child
			assert ("xsl:for-each 2", a_for_each /= Void)
			another_literal_result ?= a_for_each.first_child
			assert ("li 2", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "li"))
			a_value_of ?= another_literal_result.first_child
			assert ("xsl:value-of 5", a_value_of /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("p 3", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "p"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 6", a_text /= Void and then STRING_.same_string (a_text.string_value, "The average price of these books is: %N        "))
			a_value_of ?= another_literal_result.first_child
			assert ("xsl:value-of 6", a_value_of /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("h2 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h2"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 7", a_text /= Void and then STRING_.same_string (a_text.string_value, "A complete list of books, grouped by author"))
			an_apply_templates ?= a_literal_result.next_sibling
			assert ("xsl:apply-templates 2", an_apply_templates /= Void)
			a_literal_result ?= an_apply_templates.next_sibling
			assert ("h2 3", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h2"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 8", a_text /= Void and then STRING_.same_string (a_text.string_value, "A complete list of books, grouped by category"))			
			an_apply_templates ?= a_literal_result.next_sibling
			assert ("xsl:apply-templates 3", an_apply_templates /= Void)
			a_literal_result ?= an_apply_templates.next_sibling
			assert ("h2 4", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h2"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 9", a_text /= Void and then STRING_.same_string (a_text.string_value, "List of categories"))
			an_apply_templates ?= a_literal_result.next_sibling
			assert ("xsl:apply-templates 4", an_apply_templates /= Void)
			a_sort ?= an_apply_templates.first_child
			assert ("sort", a_sort /= Void)
			a_sort ?= a_sort.next_sibling
			assert ("sort 2", a_sort /= Void)

			a_template ?= a_template.next_sibling
			assert ("xsl:template 4", a_template /= Void)
			a_literal_result ?= a_template.first_child
			assert ("div", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "div"))
			a_for_each_group ?= a_literal_result.first_child
			assert ("xsl:for-each-group", a_for_each_group /= Void)
			a_sort ?= a_for_each_group.first_child
			assert ("sort 3", a_sort /= Void)
			a_sort ?= a_sort.next_sibling
			assert ("sort 4", a_sort /= Void)
			a_literal_result ?= a_sort.next_sibling
			assert ("h3", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h3"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 10", a_text /= Void and then STRING_.same_string (a_text.string_value, "AUTHOR: "))
			a_value_of ?= a_text.next_sibling
			assert ("xsl:value-of 7", a_value_of /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("table", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "table"))			
			a_for_each ?= a_literal_result.first_child
			assert ("xsl:for-each 3", a_for_each /= Void)
			another_literal_result ?= a_for_each.first_child
			assert ("tr", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "tr"))
			another_literal_result ?= another_literal_result.first_child
			assert ("td", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "td"))
			a_number ?= another_literal_result.first_child
			assert ("xsl:number", a_number /= Void)
			another_literal_result ?= another_literal_result.next_sibling
			assert ("td 2", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "td"))
			a_literal_result ?= a_literal_result.next_sibling
			assert ("hr", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "hr"))

			a_template ?= a_template.next_sibling
			assert ("xsl:template 5", a_template /= Void)
			a_literal_result ?= a_template.first_child
			assert ("div 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "div"))
			a_for_each_group ?= a_literal_result.first_child
			assert ("xsl:for-each-group 2", a_for_each_group /= Void)
			a_sort ?= a_for_each_group.first_child
			assert ("sort 4", a_sort /= Void)
			a_sort ?= a_sort.next_sibling
			assert ("sort 5", a_sort /= Void)
			a_literal_result ?= a_sort.next_sibling
			assert ("h3 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h3"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 10", a_text /= Void and then STRING_.same_string (a_text.string_value, "CATEGORY: "))
			a_value_of ?= a_text.next_sibling
			assert ("xsl:value-of 8", a_value_of /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("ol", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "ol"))
			a_for_each ?= a_literal_result.first_child
			assert ("xsl:for-each 4", a_for_each /= Void)
			another_literal_result ?= a_for_each.first_child
			assert ("li 3", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "li"))
			a_text ?= another_literal_result.first_child
			assert ("xsl:text 11", a_text /= Void and then STRING_.same_string (a_text.string_value, "AUTHOR: "))
			a_value_of ?= a_text.next_sibling
			assert ("xsl:value-of 9", a_value_of /= Void)
			another_literal_result ?= a_value_of.next_sibling
			assert ("br", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "br"))
			a_text ?= another_literal_result.next_sibling
			assert ("xsl:text 12", a_text /= Void and then STRING_.same_string (a_text.string_value, "%N                TITLE: "))			
			a_literal_result ?= a_literal_result.next_sibling
			assert ("hr 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "hr"))

			a_template ?= a_template.next_sibling
			assert ("xsl:template 6", a_template /= Void)
			a_literal_result ?= a_template.first_child
			assert ("h4", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "h4"))
			a_text ?= a_literal_result.first_child
			assert ("xsl:text 13", a_text /= Void and then STRING_.same_string (a_text.string_value, "CATEGORY "))
			a_number ?= a_text.next_sibling
			assert ("xsl:number 2", a_number /= Void)
			a_literal_result ?= a_literal_result.next_sibling
			assert ("table 2", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "table"))			
			a_for_each ?= a_literal_result.first_child
			assert ("xsl:for-each 5", a_for_each /= Void)
			another_literal_result ?= a_for_each.first_child
			assert ("tr 2", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "tr"))
			another_literal_result ?= another_literal_result.first_child
			assert ("td 3", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "td"))
			a_value_of ?= another_literal_result.first_child
			assert ("xsl:value-of 10", a_value_of /= Void)
			another_literal_result ?= another_literal_result.next_sibling
			assert ("td 4", another_literal_result /= Void and then STRING_.same_string (another_literal_result.node_name, "td"))
			a_value_of ?= another_literal_result.first_child
			assert ("xsl:value-of 11", a_value_of /= Void)			
			a_literal_result ?= a_literal_result.next_sibling
			assert ("hr 3", a_literal_result /= Void and then STRING_.same_string (a_literal_result.node_name, "hr"))
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
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
		
	books_xsl_uri: UT_URI is
			-- URI of file 'books.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "books.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			books_xsl_uri_not_void: Result /= Void
		end

end
