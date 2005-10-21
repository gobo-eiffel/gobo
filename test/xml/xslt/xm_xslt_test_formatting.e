indexing

	description:

		"Test format-date(), format-time() and format-dateTime()"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_FORMATTING

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature -- Test

	test_format_date_one is
			-- Test format-date(xs:date ('2002-12-31'), '[Y0001]-[M01]-[D01]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format1_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_one))
		end

	test_format_date_two is
			-- Test format-date(xs:date ('2002-12-31'), '[M]-[D]-[Y]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format2_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_two))
		end

	test_format_date_three is
			-- Test format-date(xs:date ('2002-12-31'), '[D]-[M]-[Y]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format3_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_three))
		end

	test_format_date_four is
			-- Test format-date(xs:date ('2002-12-31'), '[D1] [MI] [Y]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format4_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_four))
		end

	test_format_date_five is
			-- Test format-date(xs:date ('2002-12-31'), '[D1o] [MNn], [Y]', 'en', (), ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format5_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_five))
		end

	test_format_date_six is
			-- Test format-date(xs:date ('2002-12-31'), '[[[Y0001]-[M01]-[D01]]]', 'en', 'AD', 'GB').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format6_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_six))
		end

	test_format_date_seven is
			-- Test format-date(xs:date ('2002-12-31'), '[YWw]', 'en', 'CE', ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format7_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_format_seven))
		end

	test_format_time_one is
			-- Test format-time(xs:time ('15:58:45.762'), '[h]:[m01] [PN, *-2]', 'en', 'CE', ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_time1_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_time_format_one))
		end

	test_format_time_two is
			-- Test format-time(xs:time ('15:58:45.762'), '[h]:[m01]:[s01] [Pn, 1-2]', 'en', (), ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_time2_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_time_format_two))
		end

	test_format_time_three is
			-- Test format-time(xs:time ('15:58:45.762'), '[H01]:[m01]:[s01].[f001]', 'en', (), ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_time3_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_time_format_three))
		end

	test_format_time_four is
			-- Test format-time(xs:time ('15:58:45.762+02:00'), '[H01]:[m01]:[s01] [z]', 'en', (), ()).
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_time4_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_time_format_four))
		end

	test_format_date_time_one is
			-- Test format-dateTime(xs:dateTime ('2002-12-31T15:58:45.762+02:00'), '[h].[m01][Pn] on [FNn], [D1o] [MNn]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_date_time1_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_time_format_one))
		end

	test_format_date_time_two is
			-- Test format-dateTime(xs:dateTime ('2002-12-31T15:58:45.762+02:00'), '[M01]/[D01]/[Y0001] at [H01]:[m01]:[s01]').
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (format_date_time2_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output.out, expected_result_date_time_format_two))
		end

feature -- Result

	expected_result_date_format_one: STRING is "2002-12-31"
	expected_result_date_format_two: STRING is "12-31-2002"
	expected_result_date_format_three: STRING is "31-12-2002"
	expected_result_date_format_four: STRING is "31 XII 2002"
	expected_result_date_format_five: STRING is "31st December, 2002"
	expected_result_date_format_six: STRING is "[2002-12-31]"
	expected_result_date_format_seven: STRING is "Two Thousand and Two"

	expected_result_time_format_one: STRING is "3:58 PM"
	expected_result_time_format_two: STRING is "3:58:45 pm"
	expected_result_time_format_three: STRING is "15:58:45.762"
	expected_result_time_format_four: STRING is "15:58:45 GMT+02:00"

	expected_result_date_time_format_one: STRING is "3.58p.m. on Tuesday, 31st December"
	expected_result_date_time_format_two: STRING is "12/31/2002 at 15:58:45"
	
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
		
	format1_xsl_uri: UT_URI is
			-- URI of file 'format1.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format1.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format1_xsl_uri_not_void: Result /= Void
		end

	format2_xsl_uri: UT_URI is
			-- URI of file 'format2.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format2.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format2_xsl_uri_not_void: Result /= Void
		end

	format3_xsl_uri: UT_URI is
			-- URI of file 'format3.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format3.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format3_xsl_uri_not_void: Result /= Void
		end

	format4_xsl_uri: UT_URI is
			-- URI of file 'format4.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format4.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format4_xsl_uri_not_void: Result /= Void
		end

	format5_xsl_uri: UT_URI is
			-- URI of file 'format5.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format5.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format5_xsl_uri_not_void: Result /= Void
		end

	format6_xsl_uri: UT_URI is
			-- URI of file 'format6.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format6.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format6_xsl_uri_not_void: Result /= Void
		end

	format7_xsl_uri: UT_URI is
			-- URI of file 'format7.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format7.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format7_xsl_uri_not_void: Result /= Void
		end

	format_time1_xsl_uri: UT_URI is
			-- URI of file 'format_time1.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_time1.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_time1_xsl_uri_not_void: Result /= Void
		end

	format_time2_xsl_uri: UT_URI is
			-- URI of file 'format_time2.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_time2.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_time2_xsl_uri_not_void: Result /= Void
		end

	format_time3_xsl_uri: UT_URI is
			-- URI of file 'format_time3.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_time3.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_time3_xsl_uri_not_void: Result /= Void
		end

	format_time4_xsl_uri: UT_URI is
			-- URI of file 'format_time4.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_time4.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_time4_xsl_uri_not_void: Result /= Void
		end

	format_date_time1_xsl_uri: UT_URI is
			-- URI of file 'format_date_time1.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_date_time1.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_date_time1_xsl_uri_not_void: Result /= Void
		end

	format_date_time2_xsl_uri: UT_URI is
			-- URI of file 'format_date_time2.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "format_date_time2.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			format_date_time2_xsl_uri_not_void: Result /= Void
		end

end
