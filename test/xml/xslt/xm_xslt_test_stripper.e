indexing

	description:

		"Test stripper rules"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_STRIPPER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature -- Test

	test_stripper is
			-- Test stripper rules.
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source, l_second_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_test_string: STRING
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_test_file: KL_TEXT_INPUT_FILE
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.use_tiny_tree_model (False)
			l_configuration.set_line_numbering (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (strip_xsl_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (strip_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "stdout:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			create l_test_file.make (strip_out_filename)
			assert ("Test file exists", l_test_file /= Void)
			l_test_file.open_read
			assert ("Test file readable", l_test_file.is_open_read)
			from
				l_test_file.read_string (8000)
				l_test_string := STRING_.cloned_string (l_test_file.last_string)
			until
				l_test_file.end_of_input
			loop
				l_test_file.read_string (8000)
				l_test_string := STRING_.appended_string (l_test_string, l_test_file.last_string)
			end
			l_test_file.close
			assert ("Results same as test file", STRING_.same_string (l_test_string, l_output.last_output))
		end

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
		
	strip_xsl_uri: UT_URI is
			-- URI of file 'strip.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "strip.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			strip_xsl_uri_not_void: Result /= Void
		end
		
	strip_xml_uri: UT_URI is
			-- URI of file 'strip.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "strip.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			strip_xml_uri_not_void: Result /= Void
		end
		
	strip_out_filename: STRING is
			-- Filename 'strip.out'
		once
			Result := file_system.pathname (data_dirname, "strip.out")
		ensure
			strip_out_filename_not_void: Result /= Void
			strip_out_filename_not_empty: not Result.is_empty
		end

end
