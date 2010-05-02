note

	description:

		"Test gobo2html"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_GOBO2HTML

inherit

	XM_XSLT_TEST_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

create

	make_default

feature -- Test

	test_transform2html
			-- Transform structure-index.xml with gobo2html.xsl.
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
			read_results_file (from_saxon_html_filename)
			-- TODO: this %N will need removing when indentation is rationalized
			assert ("Correct result", STRING_.same_string (l_output.last_output + "%N", last_latin1_string))
		end

	test_transform2xml
			-- Transform structure-index.xml with gobo2xml.xsl.
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
			read_results_file (from_saxon_xml_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_latin1_string))
		end

	test_transform2xhtml
			-- Transform structure-index.xml with gobo2xhtml.xsl.
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
			read_results_file (structure_index_xhtml_filename)
			-- TODO: this %N will need removing when indentation is rationalized
			assert ("Correct result", STRING_.same_string (l_output.last_output + "%N", last_latin1_string))
		end

feature {NONE} -- Debug

	hexadecimal_string (l_string: STRING): STRING
			-- Version of `l_string' where every character is converted to it's code's hex representation
		require
			string_not_void: l_string /= Void
		local
			l_index, l_code: INTEGER
		do
			from
				Result := ""
				l_index := 1
			until
				l_index > l_string.count
			loop
				l_code := l_string.item_code (l_index)
				Result.append_string (INTEGER_.to_hexadecimal (l_code, True))
				l_index := l_index + 1
			variant
				l_string.count + 1 - l_index
			end
		ensure
			result_not_void: Result /= Void
		end

	dummy_uri: UT_URI
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	gobo2html_xsl_uri: UT_URI
			-- URI of file 'gobo2html.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "gobo2html.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			gobo2html_xsl_uri_not_void: Result /= Void
		end

	structure_index_xml_uri: UT_URI
			-- URI of file 'structure-index.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "structure-index.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			structure_index_xml_uri_not_void: Result /= Void
		end

	from_saxon_html_filename: STRING
			-- Filename 'from-saxon.html'
		once
			Result := "from-saxon.html"
		ensure
			from_saxon_html_filename_not_void: Result /= Void
			from_saxon_html_filename_not_empty: not Result.is_empty
		end

	gobo2xml_xsl_uri: UT_URI
			-- URI of file 'gobo2xml.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "gobo2xml.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			gobo2xml_xsl_uri_not_void: Result /= Void
		end

	from_saxon_xml_filename: STRING
			-- Filename 'from-saxon.xml'
		once
			Result := "from-saxon.xml"
		ensure
			from_saxon_xml_filename_not_void: Result /= Void
			from_saxon_xml_filename_not_empty: not Result.is_empty
		end

	structure_index_xhtml_filename: STRING
			-- Filename 'structure-index.xhtml'
		once
			Result := "structure-index.xhtml"
		ensure
			structure_index_xhtml_filename_not_void: Result /= Void
			structure_index_xhtml_filename_not_empty: not Result.is_empty
		end

	gobo2xhtml_xsl_uri: UT_URI
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
