indexing

	description:

		"Test the XSLT document() function"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_DOCUMENT

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature

	test_document_function is
			-- Test of document() function.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (document1_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("initial")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	test_document_function_with_xpointer_element_scheme is
			-- Test of XPointer element() scheme.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (document2_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("initial")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	test_document_function_with_gexslt_xpath_scheme is
			-- Test of gexslt:xpath() scheme.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (document4_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("initial")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	test_document_function_with_node_sequence is
			-- Test of gexslt:xpath() scheme returning multiple nodes.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (document5_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("initial")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", l_output.last_output.count = 625)
		end

	test_document_function_with_xml_id_shorthand is
			-- Test of shorthand pointer with xml:id.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (False)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (document3_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("initial")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result_string))
		end

	expected_result_string: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><output>Number, the Language of Science</output>"
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
		
	document1_xsl_uri: UT_URI is
			-- URI of file 'document1.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document1.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document1_xsl_uri_not_void: Result /= Void
		end

	document2_xsl_uri: UT_URI is
			-- URI of file 'document2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document2_xsl_uri_not_void: Result /= Void
		end

	document3_xsl_uri: UT_URI is
			-- URI of file 'document3.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document3.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document3_xsl_uri_not_void: Result /= Void
		end

	document4_xsl_uri: UT_URI is
			-- URI of file 'document4.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document4.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document4_xsl_uri_not_void: Result /= Void
		end

	document5_xsl_uri: UT_URI is
			-- URI of file 'document5.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document5.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document5_xsl_uri_not_void: Result /= Void
		end

end
