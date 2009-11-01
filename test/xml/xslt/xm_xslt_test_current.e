indexing

	description:

		"Test the XSLT current() function"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_CURRENT

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

create

	make_default

feature -- Test

	test_current_function is
			-- Test of current() function.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source, l_second_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (current_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)					  
			create l_second_uri_source.make (books_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	test_nested_current_function is
			-- Test of current() function within nested xsl:for-each.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source, l_second_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (current2_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (books_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	expected_result_string: STRING is "Patterns of Crime in Animal Culture"
			-- Expected result

feature {NONE} -- Implementation

	data_dirname: STRING is
			-- Name of directory containing schematron data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "xml", "xslt", "data">>)
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
		
	current_xsl_uri: UT_URI is
			-- URI of file 'current.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "current.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			current_xsl_uri_not_void: Result /= Void
		end

	current2_xsl_uri: UT_URI is
			-- URI of file 'current2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "current2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			current2_xsl_uri_not_void: Result /= Void
		end

	xpath_data_dirname: STRING is
			-- Name of directory containing XPath data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "xml", "xpath", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			xpath_data_dirname_not_void: Result /= Void
			xpath_data_dirname_not_empty: not Result.is_empty
		end
		
	books_xml_uri: UT_URI is
			-- URI of file 'books.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (xpath_data_dirname, "books.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			books_xml_uri_not_void: Result /= Void
		end

end
