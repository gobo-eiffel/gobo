note

	description:

		"Test stylesheet functions"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_FUNCTIONS

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

create

	make_default

feature -- Access

	Reversed_output_string: STRING = "<?xml version=%"1.0%" encoding=%"UTF-8%"?><output xmlns:xs=%"http://www.w3.org/2001/XMLSchema%">MAN BITES DOG</output>"
			-- Output from reverse*.xsl

feature -- Test

	test_xpath_reverse
			-- Transform using reverse.xsl and initial template.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (reverse_xsl_uri.full_reference)
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
			assert ("Correct result", STRING_.same_string (l_last_output, Reversed_output_string))
		end

	test_xslt_reverse
			-- Transform using reverse2.xsl and initial template.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create l_transformer_factory.make (l_configuration)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (reverse2_xsl_uri.full_reference)
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
			assert ("Correct result", STRING_.same_string (l_last_output, Reversed_output_string))
		end

	test_gexslt_reverse
			-- Transform using reverse3.xsl and initial template.
			-- Note that memoization is of no benefit here, so another test is needed.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			create l_transformer_factory.make (l_configuration)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (reverse3_xsl_uri.full_reference)
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
			assert ("Correct result", STRING_.same_string (l_last_output, Reversed_output_string))
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

	reverse_xsl_uri: UT_URI
			-- URI of file 'reverse.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "reverse.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			reverse_xsl_uri_not_void: Result /= Void
		end

	reverse2_xsl_uri: UT_URI
			-- URI of file 'reverse2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "reverse2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			reverse2_xsl_uri_not_void: Result /= Void
		end

	reverse3_xsl_uri: UT_URI
			-- URI of file 'reverse3.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "reverse3.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			reverse3_xsl_uri_not_void: Result /= Void
		end

end
