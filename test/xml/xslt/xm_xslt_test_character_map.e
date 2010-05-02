note

	description:

	"[
		Test character maps and other serialization features.
		This class tests various aspects of serialization.
		Principally, use of character maps, but also CDATA sections
		and user-written QName output methods.
	]"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_CHARACTER_MAP

inherit

	XM_XSLT_TEST_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES

	XM_XSLT_SHARED_EMITTER_FACTORY

create

	make_default

feature -- Access

	expected_result: STRING = "<?xml version=%"1.0%" encoding=%"UTF-8%"?><setProperty name=%"user%" property=%"id%" value='<%%= %"id%" + idValue %%>'/>"
			-- Expected result for `test_character_map'

feature -- Test

	test_xml_character_map
			-- Test use-character-maps with method=xml
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
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (character_map_xsl_uri.full_reference)
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

	test_html_character_map
			-- Test use-character-maps with method=html
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_line_numbering (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (character_map2_xsl_uri.full_reference)
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
			read_utf8_results_file (character_map2_results_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_utf8_string))
		end

	test_xhtml_character_map
			-- Test use-character-maps with method=xhtml
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_line_numbering (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (character_map4_xsl_uri.full_reference)
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
			read_utf8_results_file (character_map4_results_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_utf8_string))
		end

	test_text_character_map
			-- Test use-character-maps with method=text
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_line_numbering (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (character_map5_xsl_uri.full_reference)
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
			read_utf8_results_file (character_map5_results_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_utf8_string))
		end

	test_xhtml_character_map_with_cdata
			-- Test use-character-maps with method=xhtml
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_line_numbering (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (character_map6_xsl_uri.full_reference)
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
			read_utf8_results_file (character_map6_results_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_utf8_string))
		end

	test_qname_method
			-- Test use of a QName output method.
		local
			l_transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			l_configuration: XM_XSLT_CONFIGURATION
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri_source: XM_XSLT_URI_SOURCE
			l_output: XM_OUTPUT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_emitter_factory: XM_XSLT_GEXSLT_EXAMPLES_EMITTER_FACTORY
		do
			conformance.set_basic_xslt_processor
			create l_configuration.make_with_defaults
			l_configuration.set_line_numbering (True)
			create l_emitter_factory.make
			emitter_factory.register_extension_emitter_factory (l_emitter_factory)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (qname_output_xsl_uri.full_reference)
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
			read_utf8_results_file (qname_output_results_filename)
			assert ("Correct result", STRING_.same_string (l_output.last_output, last_utf8_string))
		end

feature {NONE} -- Implementation

	character_map6_results_filename: STRING
			-- Name of file containing expected results for `test_xhtml_character_map_with_cdata'
		once
			Result := "character_map6.out"
		ensure
			character_map6_results_filename_not_void: Result /= Void
			character_map6_results_filename_not_empty: not Result.is_empty
		end

	character_map2_results_filename: STRING
			-- Name of file containing expected results for `test_html_character_map'
		once
			Result := "character_map2.out"
		ensure
			character_map2_results_filename_not_void: Result /= Void
			character_map2_results_filename_not_empty: not Result.is_empty
		end

	character_map5_results_filename: STRING
			-- Name of file containing expected results for `test_test_character_map'
		once
			Result := "character_map5.out"
		ensure
			character_map5_results_filename_not_void: Result /= Void
			character_map5_results_filename_not_empty: not Result.is_empty
		end

	character_map4_results_filename: STRING
			-- Name of file containing expected results for `test_xhtml_character_map'
		once
			Result := "character_map4.out"
		ensure
			character_map4_results_filename_not_void: Result /= Void
			character_map4_results_filename_not_empty: not Result.is_empty
		end

	qname_output_results_filename: STRING
			-- Name of file containing expected results for `test_qname_method'
		once
			Result := "qname_output.out"
		ensure
			qname_output_results_filename_not_void: Result /= Void
			qname_output_results_filename_not_empty: not Result.is_empty
		end

	dummy_uri: UT_URI
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	character_map_xsl_uri: UT_URI
			-- URI of file 'character_map.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "character_map.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			character_map_uri_not_void: Result /= Void
		end

	character_map2_xsl_uri: UT_URI
			-- URI of file 'character_map2.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "character_map2.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			character_map2_uri_not_void: Result /= Void
		end

	character_map4_xsl_uri: UT_URI
			-- URI of file 'character_map4.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "character_map4.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			character_map4_uri_not_void: Result /= Void
		end

	character_map5_xsl_uri: UT_URI
			-- URI of file 'character_map5.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "character_map5.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			character_map5_uri_not_void: Result /= Void
		end

	character_map6_xsl_uri: UT_URI
			-- URI of file 'character_map6.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "character_map6.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			character_map6_uri_not_void: Result /= Void
		end

	qname_output_xsl_uri: UT_URI
			-- URI of file 'qname_output.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "qname_output.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			qname_output_uri_not_void: Result /= Void
		end

end
