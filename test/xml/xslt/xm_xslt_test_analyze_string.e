indexing

	description:

		"Test xsl:analyze-string"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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
	
feature -- Tests

	test_replacing_characters is
			-- Test replacing all newline characters in the abstract element by empty br elements.
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
			create l_uri_source.make (abstract_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (abstract_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output.out, expected_result_string_one))
		end

	test_regex_group_one is
			-- Test simple use of fn:regex-group().
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
			create l_uri_source.make (cite_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (cite_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output.out, expected_result_string_two))
		end

	test_regex_group_two is
			-- Test use of fn:regex-group() for formatting dates.
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
			create l_uri_source.make (dates_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (dates_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output.out, expected_result_string_three))
		end

	expected_result_string_one: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?>%N  <abstract><br/>    Line 1<br/>    Line 2<br/>    Line 3 and last<br/>  </abstract>%N"
			-- Expected result from `test_replacing_characters'

	expected_result_string_two: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><body>%N    For abc see <cite>ABC of somehting or other</cite>.%N    For edf see <cite>More on the alphabet</cite>, but don't believe it too much!%N    Otherwise, just go home.%N  </body>"
	      -- Expected result from `test_regex_group_one'

	expected_result_string_three: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><doc>%N  <date>2002-03-23</date>%N  <date>2005-04-01</date>%N  <date>2004-07-31</date>%N</doc>"
			-- Expected result from `test_regex_group_two'

feature {NONE} -- Implementation

	data_dirname: STRING is
			-- Name of directory containing data files
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

	abstract_xsl_uri: UT_URI is
			-- URI of file 'abstract.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "abstract.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			abstract_xsl_uri_not_void: Result /= Void
		end
		
	abstract_xml_uri: UT_URI is
			-- URI of file 'abstract.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "abstract.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			abstract_xml_uri_not_void: Result /= Void
		end
		
	cite_xsl_uri: UT_URI is
			-- URI of file 'cite.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "cite.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			cite_xsl_uri_not_void: Result /= Void
		end
		
	cite_xml_uri: UT_URI is
			-- URI of file 'cite.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "cite.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			cite_xml_uri_not_void: Result /= Void
		end
		
	dates_xsl_uri: UT_URI is
			-- URI of file 'dates.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "dates.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			dates_xsl_uri_not_void: Result /= Void
		end
		
	dates_xml_uri: UT_URI is
			-- URI of file 'dates.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "dates.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			dates_xml_uri_not_void: Result /= Void
		end

end
