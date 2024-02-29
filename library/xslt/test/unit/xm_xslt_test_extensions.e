note

	description:

		"Test extensions."

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TEST_EXTENSIONS

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES

	XM_RESOLVER_FACTORY

	XM_XSLT_SHARED_EMITTER_FACTORY

create

	make_default

feature -- Test

	test_gexslt_collation
			-- Test gexslt:collation
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: detachable XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (collations_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			check asserted_above: l_transformer /= Void then end
			l_transformer.set_initial_template ("first")
			assert ("Initial template set", l_transformer.initial_template /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
		end

	test_fallback
			-- Test fallback
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: detachable XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_last_output: detachable STRING
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (fallback_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			check asserted_above: l_transformer /= Void then end
			l_transformer.set_initial_template ("first")
			assert ("Initial template set", l_transformer.initial_template /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			l_last_output := l_output.last_output
			assert ("set_output_to_string", l_last_output /= Void)
			check asserted_above: l_last_output /= Void then end
			assert ("Correct result", STRING_.same_string (l_last_output, "OK"))
		end

	test_no_fallback
			-- Test absent extension instruction
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: detachable XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (no_fallback_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			check asserted_above: l_transformer /= Void then end
			l_transformer.set_initial_template ("first")
			assert ("Initial template set", l_transformer.initial_template /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("In error", l_transformer.is_error)
			assert ("XTDE1450", l_error_listener.has (xtde1450))
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

	collations_xsl_uri: UT_URI
			-- URI of file 'collations.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "collations.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			collations_xsl_uri_not_void: Result /= Void
		end

	fallback_xsl_uri: UT_URI
			-- URI of file 'fallback.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "fallback.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			fallback_xsl_uri_not_void: Result /= Void
		end

	no_fallback_xsl_uri: UT_URI
			-- URI of file 'no_fallback.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "no_fallback.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			no_fallback_xsl_uri_not_void: Result /= Void
		end

	xtde1450: STRING
			-- Error XTDE1450
		once
			Result := Xpath_errors_uri + "#" + "XTDE1450"
		ensure
			xtde1450_not_void: Result /= Void
		end

end
