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

feature

	test_schematron_basic is
			-- Tests compiling schematron-basic
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output, another_output: XM_OUTPUT
			a_test_string: STRING
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			a_catalog_resolver: XM_CATALOG_RESOLVER
			a_string_resolver: XM_STRING_URI_RESOLVER
			a_test_file: KL_TEXT_INPUT_FILE
		do
			create a_string_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (a_string_resolver)
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("schematron-basic.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./wai.xml")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:/transform")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)

			-- now plug the string into the bootstrap resolver so it can be found
			--  by the XML parser

			a_catalog_resolver ?= a_configuration.entity_resolver
			check
				catalog_resolver: a_catalog_resolver /= Void
				-- because `make_with_defaults'
			end
			shared_catalog_manager.bootstrap_resolver.well_known_system_ids.resize (2 * shared_catalog_manager.bootstrap_resolver.well_known_system_ids.count)
			shared_catalog_manager.bootstrap_resolver.well_known_system_ids.put (an_output.last_output, "string:/transform")

			-- now use the generated transform to produce a report

			create a_stylesheet_compiler.make (a_configuration)			
			create a_uri_source.make ("string:/transform")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors 2", not a_stylesheet_compiler.load_stylesheet_module_failed)
  			assert ("Stylesheet not void 2", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer 2", a_transformer /= Void)
			create another_uri_source.make ("./evil_wai.xml")
			create another_output
			another_output.set_output_to_string
			create a_result.make (another_output, "string:/report")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			create a_test_file.make ("./expected_report.txt")
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
			assert ("Results same as test file", STRING_.same_string (a_test_string, another_output.last_output))	
		end

	test_schematron_conformance is
			-- Tests compiling conformance1-5.xsl
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			a_string_resolver: XM_STRING_URI_RESOLVER
		do
			create a_string_resolver.make
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (a_string_resolver)
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("conformance1-5.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
		end

end
