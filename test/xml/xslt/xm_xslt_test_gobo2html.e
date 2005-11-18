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
			create a_uri_source.make (gobo2html_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (structure_index_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make (from_saxon_html_filename)
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
--			print (an_output.last_output)
--			print (a_test_string)
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output.last_output))
		end

	test_transform2xml is
			-- Transform structure-index.xml with gobo2xml.xsl.
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
			create a_uri_source.make (gobo2xml_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (structure_index_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make (from_saxon_xml_filename)
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
			--print (a_test_string)
			--print (an_output.last_output)
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output.last_output))
		end

	test_transform2xhtml is
			-- Transform structure-index.xml with gobo2xhtml.xsl.
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
			create a_uri_source.make (gobo2xhtml_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (structure_index_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make (structure_index_xhtml_filename)
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
			--print ("Test file is:%N")
			--print (hexadecimal_string (a_test_string))
			--print ("%NResults are:%N")
			--print (hexadecimal_string (an_output.last_output))
			assert ("Results same as test file", STRING_.same_string (a_test_string, an_output.last_output))
		end

feature {NONE} -- Debug

	hexadecimal_string (a_string: STRING): STRING is
			-- Version of `a_string' where every character is converted to it's code's hex representation
		require
			string_not_void: a_string /= Void
		local
			an_index, a_code: INTEGER
		do
			from
				Result := ""
				an_index := 1
			variant
				a_string.count + 1 - an_index
			until
				an_index > a_string.count
			loop
				a_code := a_string.item_code (an_index)
				Result.append_string (INTEGER_.to_hexadecimal (a_code, True))
				an_index := an_index + 1
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
		
	gobo2html_xsl_uri: UT_URI is
			-- URI of file 'gobo2html.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "gobo2html.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			gobo2html_xsl_uri_not_void: Result /= Void
		end

	structure_index_xml_uri: UT_URI is
			-- URI of file 'structure-index.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "structure-index.xml")
			Result := File_uri.filename_to_uri (a_path)
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
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "gobo2xml.xsl")
			Result := File_uri.filename_to_uri (a_path)
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
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "gobo2xhtml.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			gobo2xhtml_xsl_uri_not_void: Result /= Void
		end

end
