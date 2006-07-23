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

	KL_IMPORTED_INTEGER_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature

	test_transform2html is
			-- Transform structure-index.xml with gobo2html.xsl.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (gobo2html_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (structure_index_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			create l_test_file.make (from_saxon_html_filename)
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
--			print (l_output.last_output)
--			print (l_test_string)
			assert ("Results same as test file", STRING_.same_string (l_test_string, l_output.last_output))
		end

	test_transform2xml is
			-- Transform structure-index.xml with gobo2xml.xsl.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (gobo2xml_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)			
			create l_second_uri_source.make (structure_index_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			create l_test_file.make (from_saxon_xml_filename)
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
			--print (l_test_string)
			--print (l_output.last_output)
			assert ("Results same as test file", STRING_.same_string (l_test_string, l_output.last_output))
		end

	test_transform2xhtml is
			-- Transform structure-index.xml with gobo2xhtml.xsl.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (gobo2xhtml_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (structure_index_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			create l_test_file.make (structure_index_xhtml_filename)
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
			--print ("Test file is:%N")
			--print (hexadecimal_string (l_test_string))
			--print ("%NResults are:%N")
			--print (hexadecimal_string (l_output.last_output))
			assert ("Results same as test file", STRING_.same_string (l_test_string, l_output.last_output))
		end

feature {NONE} -- Debug

	hexadecimal_string (l_string: STRING): STRING is
			-- Version of `l_string' where every character is converted to it's code's hex representation
		require
			string_not_void: l_string /= Void
		local
			l_index, l_code: INTEGER
		do
			from
				Result := ""
				l_index := 1
			variant
				l_string.count + 1 - l_index
			until
				l_index > l_string.count
			loop
				l_code := l_string.item_code (l_index)
				Result.append_string (INTEGER_.to_hexadecimal (l_code, True))
				l_index := l_index + 1
			end
		ensure
			result_not_void: Result /= Void
		end

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
		
	gobo2html_xsl_uri: UT_URI is
			-- URI of file 'gobo2html.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "gobo2html.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			gobo2html_xsl_uri_not_void: Result /= Void
		end

	structure_index_xml_uri: UT_URI is
			-- URI of file 'structure-index.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "structure-index.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			structure_index_xml_uri_not_void: Result /= Void
		end

	from_saxon_html_filename: STRING is
			-- Filename 'from-saxon.html'
		once
			Result := file_system.pathname (data_dirname, "from-saxon.html")
		ensure
			from_saxon_html_filename_not_void: Result /= Void
			from_saxon_html_filename_not_empty: not Result.is_empty
		end
		
	gobo2xml_xsl_uri: UT_URI is
			-- URI of file 'gobo2xml.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "gobo2xml.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			gobo2xml_xsl_uri_not_void: Result /= Void
		end

	from_saxon_xml_filename: STRING is
			-- Filename 'from-saxon.xml'
		once
			Result := file_system.pathname (data_dirname, "from-saxon.xml")
		ensure
			from_saxon_xml_filename_not_void: Result /= Void
			from_saxon_xml_filename_not_empty: not Result.is_empty
		end

	structure_index_xhtml_filename: STRING is
			-- Filename 'structure-index.xhtml'
		once
			Result := file_system.pathname (data_dirname, "structure-index.xhtml")
		ensure
			structure_index_xhtml_filename_not_void: Result /= Void
			structure_index_xhtml_filename_not_empty: not Result.is_empty
		end

	gobo2xhtml_xsl_uri: UT_URI is
			-- URI of file 'gobo2xhtml.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "gobo2xhtml.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			gobo2xhtml_xsl_uri_not_void: Result /= Void
		end

end
