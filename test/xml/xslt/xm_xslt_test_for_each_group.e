note

	description:

		"Test xs:for-each-group"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_FOR_EACH_GROUP

inherit

	TS_TEST_CASE

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY

create

	make_default

feature -- Test

	test_grouping_nodes_based_on_common_values is
			-- Test group-by, and simplified stylesheet.
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
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (group_by_one_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (cities_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert_strings_equal ("Correct result", expected_result_string_one, l_output.last_output.out)
		end

	test_grouping_starting_with is
			-- Test group-starting-with, and simplified stylesheet.
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
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (group_starting_with_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (xslt_intro_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert_strings_equal ("Correct result", expected_result_string_two, l_output.last_output.out)
		end

	test_current_grouping_key is
			-- Test fn:current-grouping-key() and fn:current-group().
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
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (current_group_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (titles_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert_strings_equal ("Correct result", expected_result_string_three, l_output.last_output.out)
		end

	test_group_adjacent is
			-- Test group-adjacent, fn:current-grouping-key() and fn:current-group().
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
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (group_adjacent_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (mobile_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert_strings_equal ("Correct result", expected_result_string_four, l_output.last_output.out)
		end

	test_group_ending_with is
			-- Test group-ending-with and fn:current-group().
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
			l_configuration.set_line_numbering (True)
			l_configuration.use_tiny_tree_model (True)
			create l_transformer_factory.make (l_configuration)
			create l_uri_source.make (group_ending_with_xsl_uri.full_reference)
			l_transformer_factory.create_new_transformer (l_uri_source, dummy_uri)
			assert ("Stylesheet compiled without errors", not l_transformer_factory.was_error)
			l_transformer := l_transformer_factory.created_transformer
			assert ("transformer", l_transformer /= Void)
			create l_second_uri_source.make (continued_xml_uri.full_reference)
			create l_output
			l_output.set_output_to_string
			create l_result.make (l_output, "string:")
			l_transformer.transform (l_second_uri_source, l_result)
			assert ("Transform successful", not l_transformer.is_error)
			assert_strings_equal ("Correct result", expected_result_string_five, l_output.last_output.out)
		end

	expected_result_string_one: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><table><tr><th>Position</th><th>Country</th><th>City List</th><th>Population</th></tr><tr><td>1</td><td>Italia</td><td>Milano, Venezia</td><td>6</td></tr><tr><td>2</td><td>France</td><td>Paris, Lyon</td><td>9</td></tr><tr><td>3</td><td>Deutschland</td><td>M%%/252/nchen</td><td>4</td></tr></table>"

	expected_result_string_two: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><chapter><section title=%"Introduction%"><para>XSLT is used to write stylesheets.</para><para>XQuery is used to query XML databases.</para></section><section title=%"What is a stylesheet?%"><para>A stylesheet is an XML document used to define a transformation.</para><para>Stylesheets may be written in XSLT.</para><para>XSLT 2.0 introduces new grouping constructs.</para></section></chapter>"

	expected_result_string_three: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><h2>Java</h2><p>A Beginner's Guide to Java</p><p>Using XML with Java</p><h2>XML</h2><p>Learning XML</p><p>Using XML with Java</p>"

	expected_result_string_four: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><p>Do <em>not</em>:%
%%N    </p><ul>%
%%N    <li>talk,</li>%
%%N    <li>eat, or</li>%
%%N    <li>use your mobile telephone</li>%
%%N    </ul><p>%
%%N    while you are in the cinema.</p>"

    expected_result_string_five: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><doc><pageset><page>Some text</page><page>More text</page><page>Yet more text</page></pageset><pageset><page>Some words</page><page>More words</page><page>Yet more words</page></pageset></doc>"


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

	dummy_uri: UT_URI is
			-- Dummy URI
		once
			create Result.make ("dummy:")
		ensure
			dummy_uri_is_absolute: Result /= Void and then Result.is_absolute
		end

	group_by_one_xsl_uri: UT_URI is
			-- URI of file 'group_by_one.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "group_by_one.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			group_by_one_xsl_uri_not_void: Result /= Void
		end

	cities_xml_uri: UT_URI is
			-- URI of file 'cities.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "cities.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			cities_xml_uri_not_void: Result /= Void
		end

	group_starting_with_xsl_uri: UT_URI is
			-- URI of file 'group_starting_with.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "group_starting_with.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			group_starting_with_xsl_uri_not_void: Result /= Void
		end

	xslt_intro_xml_uri: UT_URI is
			-- URI of file 'xslt_intro.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "xslt_intro.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			xslt_intro_xml_uri_not_void: Result /= Void
		end

	current_group_xsl_uri: UT_URI is
			-- URI of file 'current_group.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "current_group.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			current_group_xsl_uri_not_void: Result /= Void
		end

	titles_xml_uri: UT_URI is
			-- URI of file 'titles.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "titles.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			titles_xml_uri_not_void: Result /= Void
		end

	group_adjacent_xsl_uri: UT_URI is
			-- URI of file 'group_adjacent.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "group_adjacent.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			group_adjacent_xsl_uri_not_void: Result /= Void
		end

	mobile_xml_uri: UT_URI is
			-- URI of file 'mobile.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "mobile.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			mobile_xml_uri_not_void: Result /= Void
		end

	group_ending_with_xsl_uri: UT_URI is
			-- URI of file 'group_ending_with.xsl'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "group_ending_with.xsl")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			group_ending_with_xsl_uri_not_void: Result /= Void
		end

	continued_xml_uri: UT_URI is
			-- URI of file 'continued.xml'
		local
			l_path: STRING
		once
			l_path := file_system.pathname (data_dirname, "continued.xml")
			Result := File_uri.filename_to_uri (l_path)
		ensure
			continued_xml_uri_not_void: Result /= Void
		end

end
