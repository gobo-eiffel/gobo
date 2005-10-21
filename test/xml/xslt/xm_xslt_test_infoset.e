indexing

	description:

		"Test producing an infoset for canonical comparison of two XML files"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_INFOSET

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature -- Test

	test_infoset is
			-- Transform same file to an infoset twice - one with and one without indenting. -- TODO - this last condition not yet tested
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output, another_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (False)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (infoset_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (test1_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:/one")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			a_configuration.use_tiny_tree_model (True)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (test1_xml_uri.full_reference)
			create another_output
			another_output.set_output_to_string
			create a_result.make (another_output, "string:/two")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Files are canonically the same", STRING_.same_string (an_output.last_output, another_output.last_output))
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
		
	infoset_xsl_uri: UT_URI is
			-- URI of file 'infoset.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "infoset.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			infoset_xsl_uri_not_void: Result /= Void
		end
		
	test1_xml_uri: UT_URI is
			-- URI of file 'test1.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "test1.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			test1_xml_uri_not_void: Result /= Void
		end

end
