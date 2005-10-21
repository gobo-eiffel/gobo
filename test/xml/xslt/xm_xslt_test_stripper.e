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
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_test_string: STRING
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_test_file: KL_TEXT_INPUT_FILE
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.use_tiny_tree_model (False)
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (strip_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (strip_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "stdout:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make (strip_out_filename)
			assert ("Test file exists", a_test_file /= Void)
			a_test_file.open_read
			assert ("Test file readable", a_test_file.is_open_read)
			from
				a_test_file.read_string (8000)
				a_test_string := STRING_.cloned_string (a_test_file.last_string)
			until
				a_test_file.end_of_input
			loop
				a_test_file.read_string (8000)
				a_test_string := STRING_.appended_string (a_test_string, a_test_file.last_string)
			end
			a_test_file.close
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output.last_output))
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
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "strip.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			strip_xsl_uri_not_void: Result /= Void
		end
		
	strip_xml_uri: UT_URI is
			-- URI of file 'strip.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "strip.xml")
			Result := File_uri.filename_to_uri (a_path)
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
