indexing

	description:

		"Test schematron"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_SCHEMATRON

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

	XM_XPATH_STANDARD_NAMESPACES

	XM_SHARED_CATALOG_MANAGER

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature

	test_schematron_basic is
			-- Tests compiling schematron-basic
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source, l_second_uri_source: XM_XSLT_URI_SOURCE
			l_output, l_second_output: XM_OUTPUT
			l_test_string: STRING
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_catalog_resolver: XM_CATALOG_RESOLVER
			l_string_resolver: XM_STRING_URI_RESOLVER
			l_test_file: KL_TEXT_INPUT_FILE
			l_factory: XM_XSLT_NULL_MESSAGE_EMITTER_FACTORY
		do
			create l_string_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (l_string_resolver)
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			create l_factory
			l_configuration.set_message_emitter_factory (l_factory)
			l_configuration.set_line_numbering (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (schematron_basic_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (wai_schema_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:/transform")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)

			-- now plug the string into the bootstrap resolver so it can be found
			--  by the XML parser

			l_catalog_resolver ?= l_configuration.entity_resolver
			check
				catalog_resolver: l_catalog_resolver /= Void
				-- because `make_with_defaults'
			end
			shared_catalog_manager.bootstrap_resolver.well_known_system_ids.resize (2 * shared_catalog_manager.bootstrap_resolver.well_known_system_ids.count)
			shared_catalog_manager.bootstrap_resolver.well_known_system_ids.put (l_output.last_output, "string:/transform")

			-- now use the generated transform to produce a report

			create l_stylesheet_compiler.make (l_configuration)			
			create l_uri_source.make ("string:/transform")
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors 2", not l_stylesheet_compiler.load_stylesheet_module_failed)
  			assert ("Stylesheet not void 2", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer 2", l_transformer /= Void)
			create l_second_uri_source.make (evil_wai_uri.full_reference)
			create l_second_output
			l_second_output.set_output_to_string
			create l_result.make (l_second_output, "string:/report")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			create l_test_file.make (expected_report_filename)
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
			assert ("Results same as test file", STRING_.same_string (l_test_string, l_second_output.last_output))	
		end

	test_schematron_conformance is
			-- Tests compiling conformance1-5.xsl
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_string_resolver: XM_STRING_URI_RESOLVER
		do
			create l_string_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (l_string_resolver)
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			create l_stylesheet_compiler.make (l_configuration)
			create l_uri_source.make (schematron_conformance_uri.full_reference)
			l_stylesheet_compiler.prepare (l_uri_source)
			assert ("Stylesheet compiled without errors", not l_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", l_stylesheet_compiler.last_loaded_module /= Void)
			l_transformer := l_stylesheet_compiler.new_transformer
			assert ("transformer", l_transformer /= Void)
		end

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
	
	example_data_dirname: STRING is
			-- Name of directory containing schematron data files;
			-- N.B. Uses example directory to avoid duplicating files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"example", "xml", "xslt", "schematron", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			example_data_dirname_not_void: Result /= Void
			example_data_dirname_not_empty: not Result.is_empty
		end
	
	schematron_basic_uri: UT_URI is
			-- URI of file 'schematron-basic.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (example_data_dirname, "schematron-basic.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			schematron_basic_uri_not_void: Result /= Void
		end

	schematron_conformance_uri: UT_URI is
			-- URI of file 'conformance1-5.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (example_data_dirname, "conformance1-5.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			schematron_conformance_uri_not_void: Result /= Void
		end

	wai_schema_uri: UT_URI is
			-- URI of schema for WAI
		local
			l_path: STRING
		once
			l_path := file_system.pathname (example_data_dirname, "wai.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			wai_schema_uri_not_void: Result /= Void
		end

	evil_wai_uri: UT_URI is
			-- URI of file 'evil_wai.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (example_data_dirname, "evil_wai.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			evil_wai_uri_not_void: Result /= Void
		end

	expected_report_filename: STRING is
			-- Pathname of file 'expected_report.txt'
		once
			Result := file_system.pathname (data_dirname, "expected_report.txt")
		ensure
			expected_report_filename_not_void: Result /= Void
			expected_report_filename_not_empty: not Result.is_empty
		end
end
