indexing

	description:

		"Teststylesheet functions and extenstion functions"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_FUNCTIONS

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

feature -- Access

	Reversed_output_string: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><output xmlns:xs=%"http://www.w3.org/2001/XMLSchema%">MAN BITES DOG</output>"
			-- Output from reverse*.xsl

feature -- Test

	test_xpath_reverse is
			-- Transform using reverse.xsl and initial template.
			-- This uses the simpler version of xsl:function,
			--  which is compiled to a single XPath Expression
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_output: XM_OUTPUT
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			an_output_string: STRING
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_external_function_tracing (False) -- True whilst developing
			a_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/reverse.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create an_output
			create an_output_string.make (0)
			a_transformer.set_initial_template ("first")
			assert ("Initial template set", a_transformer.initial_template /= Void)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (Void, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output_string, Reversed_output_string))
		end

	test_xslt_reverse is
			-- Transform using reverse2.xsl and initial template.
			-- This uses the full version of xsl:function,
			--  which is compiled to a template
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_output: XM_OUTPUT
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			an_output_string: STRING
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_external_function_tracing (False) -- True whilst developing
			a_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/reverse2.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create an_output
			create an_output_string.make (0)
			a_transformer.set_initial_template ("first")
			assert ("Initial template set", a_transformer.initial_template /= Void)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (Void, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output_string, Reversed_output_string))
		end

end
