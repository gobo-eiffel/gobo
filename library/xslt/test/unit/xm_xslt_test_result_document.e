note

	description:

		"Test xsl:result-document"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_RESULT_DOCUMENT

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

	XM_XPATH_STANDARD_NAMESPACES

create

	make_default

feature -- Test

	test_splitting_xhtml_document
			-- Test splitting an XHTML document into h1 sections.
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (xhtml_splitter_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (document_xhtml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:/")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Toc", l_configuration.output_resolver.output_destinations.item ("string:/toc.html").stream.last_output.count = 594)
			assert ("Section 1", l_configuration.output_resolver.output_destinations.item ("string:/section1.html").stream.last_output.count = 414)
			assert ("Section 2", l_configuration.output_resolver.output_destinations.item ("string:/section2.html").stream.last_output.count = 414)
			assert ("Section 3", l_configuration.output_resolver.output_destinations.item ("string:/section3.html").stream.last_output.count = 420)
		end

	test_implicit_duplicate_destination_error
			-- Test error XT1490 due to implict result tree.
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (xt1490_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (document_xhtml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:/")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform not successfull", l_transformer.is_error)
			assert ("XTDE1490", l_error_listener.has (xtde1490))
		end

	test_duplicate_destination_error
			-- Test error XT1490 due to multiple result-documents.
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (xt1490_2_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (document_xhtml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:/")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform not successfull", l_transformer.is_error)
			assert ("XTDE1490", l_error_listener.has (xtde1490))
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory containing schematron data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xslt", "test", "unit", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	dummy_uri: UT_URI
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	xhtml_splitter_xsl_uri: UT_URI
			-- URI of file 'xhtml-splitter.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "xhtml-splitter.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			xhtml_splitter_xsl_uri_not_void: Result /= Void
		end

	document_xhtml_uri: UT_URI
			-- URI of file 'document.xhtml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "document.xhtml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			document_xhtml_uri_not_void: Result /= Void
		end

	xt1490_xsl_uri: UT_URI
			-- URI of file 'xt1490.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "xt1490.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			xt1490_xsl_uri_not_void: Result /= Void
		end

	xt1490_2_xsl_uri: UT_URI
			-- URI of file 'xt1490-2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "xt1490-2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			xt1490_2_xsl_uri_not_void: Result /= Void
		end

	xtde1490: STRING
			-- Error XTDE0430
		once
			Result := Xpath_errors_uri + "#" + "XTDE1490"
		ensure
			xtde1490_not_void: Result /= Void
		end

end
