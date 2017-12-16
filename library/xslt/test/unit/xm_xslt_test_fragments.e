note

	description:
	"[
		Test use of fragment identifiers on source and stylesheet URIs.
    		Also, stylesheet chaining and xml-stylesheet PI
	]"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_FRAGMENTS

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

	XM_XSLT_CONFIGURATION_CONSTANTS

create

	make_default

feature -- Test

	test_shorthand_pointer
			-- Transform books3.xml with books1.xsl.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (books1_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (books3_xml_uri.full_reference + "#S")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", STRING_.same_string (l_output.last_output, expected_output_1))
		end

	test_element_scheme_pointer
			-- Transform books3.xml with books1.xsl.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (books1_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (books3_xml_uri.full_reference + "#element(/1/1/1/1)")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", STRING_.same_string (l_output.last_output, expected_output_1))
		end

	test_gexslt_xpath_scheme_pointer
			-- Transform books3.xml with books1.xsl.
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			l_configuration.use_tiny_tree_model (False)
			l_configuration.set_recovery_policy (Do_not_recover)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (books1_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (books3_xml_uri.full_reference + "#xmlns(gexslt=http://www.gobosoft.com/eiffel/gobo/gexslt/extension)gexslt:xpath(/descendant::AUTHOR%%5B1%%5D)")
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", STRING_.same_string (l_output.last_output, expected_output_2))
		end

	test_embedded_stylesheet
			-- Transform embedded.xml by itself, without using xml-stylesheet-pi
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
			l_configuration.set_string_mode_ascii
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (embedded_xml_uri.full_reference + "#style1")
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (embedded_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", l_output.last_output.count = 173)
		end

	test_xml_stylesheet_pi_one
			-- Transform processing_instructions.xml via PIs.
			-- For "print" medium, preferred style
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_stylesheet_source: XM_XSLT_SOURCE
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_chooser: XM_XSLT_PREFERRED_PI_CHOOSER
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_string_mode_ascii
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (processing_instructions_xml_uri.full_reference)
			create l_chooser.make
			l_stylesheet_source := l_transformer_factory.associated_stylesheet (l_uri_source.system_id, "print", l_chooser)
			assert ("Stylesheet found", l_stylesheet_source /= Void)
			l_transformer_factory.create_new_transformer (l_stylesheet_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("Transformer not void", l_transformer /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", l_output.last_output.count = 309)
		end

	test_xml_stylesheet_pi_two
			-- Transform processing_instructions.xml via PIs.
			-- For "screen" and alternate style "Alternate"
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_error_listener: XM_XSLT_TESTING_ERROR_LISTENER
			l_transformer: XM_XSLT_TRANSFORMER
			l_stylesheet_source: XM_XSLT_SOURCE
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_chooser: XM_XSLT_PI_CHOOSER_BY_NAME
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			create l_error_listener.make (l_configuration.recovery_policy)
			l_configuration.set_error_listener (l_error_listener)
			l_configuration.set_string_mode_ascii
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (processing_instructions_xml_uri.full_reference)
			create l_chooser.make ("Alternate")
			l_stylesheet_source := l_transformer_factory.associated_stylesheet (l_uri_source.system_id, "screen", l_chooser)
			assert ("Stylesheet found", l_stylesheet_source /= Void)
			l_transformer_factory.create_new_transformer (l_stylesheet_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("Transformer not void", l_transformer /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_uri_source, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", l_output.last_output.count = 295)
		end

	test_next_in_chain
			-- Test gexslt:next-in-chain
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
			l_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			l_configuration.use_tiny_tree_model (False)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (example0_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.set_initial_template ("initial")
			l_transformer.transform (Void, l_result)
			assert ("Transform successfull", not l_transformer.is_error)
			assert ("Correct output", l_output.last_output.count = 81)
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

	books1_xsl_uri: UT_URI
			-- URI of file 'books1.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "books1.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			books1_xsl_uri_not_void: Result /= Void
		end

	xpath_data_dirname: STRING
			-- Name of directory containing XPath data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xpath", "test", "unit", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			xpath_data_dirname_not_void: Result /= Void
			xpath_data_dirname_not_empty: not Result.is_empty
		end

	books3_xml_uri: UT_URI
			-- URI of file 'books3.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (xpath_data_dirname, "books3.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			books3_xml_uri_not_void: Result /= Void
		end

	embedded_xml_uri: UT_URI
			-- URI of file 'embedded.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "embedded.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			embedded_xml_uri_not_void: Result /= Void
		end

	processing_instructions_xml_uri: UT_URI
			-- URI of file 'processing_instructions.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "processing_instructions.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			processing_instructions_xml_uri_not_void: Result /= Void
		end

	example0_xsl_uri: UT_URI
			-- URI of file 'example0.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "example0.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			example0_xsl_uri_not_void: Result /= Void
		end

	expected_output_1: STRING = "<?xml version=%"1.0%" encoding=%"UTF-8%"?><output>Number, the Language of Science</output>"
			-- An expected output

	expected_output_2: STRING = "<?xml version=%"1.0%" encoding=%"UTF-8%"?><output>Danzig</output>"
			-- An expected output

end
