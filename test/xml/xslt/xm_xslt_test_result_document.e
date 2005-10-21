indexing

	description:

		"Test xsl:result-document"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_RESULT_DOCUMENT

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

feature -- Test

	test_splitting_xhtml_document is
			-- Test splitting an XHTML document into h1 sections.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (xhtml_splitter_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (document_xhtml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:/")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Toc", a_configuration.output_resolver.output_destinations.item ("string:/toc.html").stream.last_output.count = 596)
			assert ("Section 1", a_configuration.output_resolver.output_destinations.item ("string:/section1.html").stream.last_output.count = 416)
			assert ("Section 2", a_configuration.output_resolver.output_destinations.item ("string:/section2.html").stream.last_output.count = 416)
			assert ("Section 3", a_configuration.output_resolver.output_destinations.item ("string:/section3.html").stream.last_output.count = 422)
		end

	test_implicit_duplicate_destination_error is
			-- Test error XT1490 due to implict result tree.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (xt1490_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (document_xhtml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:/")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform not successfull", a_transformer.is_error)
		end

	test_duplicate_destination_error is
			-- Test error XT1490 due to multiple result-documents.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (xt1490_2_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (document_xhtml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:/")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform not successfull", a_transformer.is_error)
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
		
	xhtml_splitter_xsl_uri: UT_URI is
			-- URI of file 'xhtml-splitter.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "xhtml-splitter.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			xhtml_splitter_xsl_uri_not_void: Result /= Void
		end

	document_xhtml_uri: UT_URI is
			-- URI of file 'document.xhtml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "document.xhtml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			document_xhtml_uri_not_void: Result /= Void
		end
		
	xt1490_xsl_uri: UT_URI is
			-- URI of file 'xt1490.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "xt1490.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			xt1490_xsl_uri_not_void: Result /= Void
		end
		
	xt1490_2_xsl_uri: UT_URI is
			-- URI of file 'xt1490-2.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "xt1490-2.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			xt1490_2_xsl_uri_not_void: Result /= Void
		end

end
