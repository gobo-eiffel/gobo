note

	description:

		"Test xsl:namespace instruction"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_NAMESPACE

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

	XM_XPATH_STANDARD_NAMESPACES

create

	make_default

feature -- Access

	expected_result: STRING = "<?xml version=%"1.0%" encoding=%"UTF-8%"?><p_0:item xmlns:p=%"q.uri%" xmlns:p_0=%"p.uri%"/>"
			-- Expected result for `test_character_map'

feature -- Test

	test_xtde0430
			-- Test error XTDE0430
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (namespace_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("first")
			assert ("Initial template set", l_transformer.initial_template /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform not successfull", l_transformer.is_error)
			assert ("XTED0430", l_error_listener.has (xtde0430))
		end

	test_namespace
			-- Test xsl:namespace
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (namespace2_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			l_transformer.set_initial_template ("first")
			assert ("Initial template set", l_transformer.initial_template /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (Void, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct result", STRING_.same_string (l_output.last_output, expected_result))
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

	namespace_xsl_uri: UT_URI
			-- URI of file 'namespace.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "namespace.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			namespace_xsl_uri_not_void: Result /= Void
		end

	namespace2_xsl_uri: UT_URI
			-- URI of file 'namespace2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "namespace2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			namespace2_xsl_uri_not_void: Result /= Void
		end

	xtde0430: STRING
			-- Error XTDE0430
		once
			Result := Xpath_errors_uri + "#" + "XTDE0430"
		ensure
			xtde0430_not_void: Result /= Void
		end

end
