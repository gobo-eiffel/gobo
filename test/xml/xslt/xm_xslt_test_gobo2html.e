indexing

	description:

		"Test gobo2html"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_GOBO2HTML

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL


	XM_RESOLVER_FACTORY
	
feature

	test_transform2html is
			-- Transform structure-index.xml with gobo2html.xsl.
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_output: XM_OUTPUT
			an_output_string, a_test_string: STRING
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_test_file: KL_TEXT_INPUT_FILE
			n: INTEGER
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.use_tiny_tree_model (False)
			a_configuration.set_line_numbering (True)
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/gobo2html.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/structure-index.xml")
			create an_output
			create an_output_string.make (0)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make ("./data/from-saxon.html")
			assert ("Test file exists", a_test_file /= Void)
			a_test_file.open_read
			assert ("Test file readable", a_test_file.is_open_read)
			from
				a_test_file.read_string (8000)
				a_test_string := clone (a_test_file.last_string)
			until
				a_test_file.end_of_input
			loop
				a_test_file.read_string (8000)
				a_test_string := STRING_.appended_string (a_test_string, a_test_file.last_string)
			end
			a_test_file.close
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output_string))
		end

	test_transform2xml is
			-- Transform structure-index.xml with gobo2xml.xsl.
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_output: XM_OUTPUT
			an_output_string, a_test_string: STRING
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_test_file: KL_BINARY_INPUT_FILE
			n: INTEGER
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.use_tiny_tree_model (False)
			a_configuration.set_line_numbering (True)
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/gobo2xml.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/structure-index.xml")
			create an_output
			create an_output_string.make (0)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make ("./data/from-saxon.xml")
			assert ("Test file exists", a_test_file /= Void)
			a_test_file.open_read
			assert ("Test file readable", a_test_file.is_open_read)
			from
				a_test_file.read_string (8000)
				a_test_string := clone (a_test_file.last_string)
			until
				a_test_file.end_of_input
			loop
				a_test_file.read_string (8000)
				a_test_string := STRING_.appended_string (a_test_string, a_test_file.last_string)
			end
			a_test_file.close
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output_string))
		end

	test_transform2xhtml is
			-- Transform structure-index.xml with gobo2xhtml.xsl.
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_output: XM_OUTPUT
			an_output_string, a_test_string: STRING
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_test_file: KL_BINARY_INPUT_FILE
			n: INTEGER
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.use_tiny_tree_model (False)
			a_configuration.set_line_numbering (True)
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/gobo2xhtml.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/structure-index.xml")
			create an_output
			create an_output_string.make (0)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make ("./data/structure-index.xhtml")
			assert ("Test file exists", a_test_file /= Void)
			a_test_file.open_read
			assert ("Test file readable", a_test_file.is_open_read)
			from
				a_test_file.read_string (8000)
				a_test_string := clone (a_test_file.last_string)
			until
				a_test_file.end_of_input
			loop
				a_test_file.read_string (8000)
				a_test_string := STRING_.appended_string (a_test_string, a_test_file.last_string)
			end
			a_test_file.close
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output_string))
		end

end
