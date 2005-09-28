indexing

	description:

		"Test xsl:analyze-string"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_ANALYZE_STRING

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature

	test_replacing_characters is
			-- Test replacing all newline characters in the abstract element by empty br elements.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/abstract.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/abstract.xml")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_string_one))
		end

	test_regex_group_one is
			-- Test simple use of fn:regex-group().
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/cite.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/cite.xml")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_string_two))
		end

	test_regex_group_two is
			-- Test use of fn:regex-group() for formatting dates.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/dates.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/dates.xml")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_string_three))
		end

	expected_result_string_one: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?>%N  <abstract><br/>    Line 1<br/>    Line 2<br/>    Line 3 and last<br/>  </abstract>%N"
			-- Expected result from `test_replacing_characters'

	expected_result_string_two: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><body>%N    For abc see <cite>ABC of somehting or other</cite>.%N    For edf see <cite>More on the alphabet</cite>, but don't believe it too much!%N    Otherwise, just go home.%N  </body>"
	      -- Expected result from `test_regex_group_one'

	expected_result_string_three: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><doc>%N  <date>2002-03-23</date>%N  <date>2005-04-01</date>%N  <date>2004-07-31</date>%N</doc>"
			-- Expected result from `test_regex_group_two'
end
