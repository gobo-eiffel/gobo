indexing

	description:

		"Test the XSLT variables and parameters"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_VARIABLES

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature -- Test

	test_range_variable_in_global_variable is
			-- Test use of range variables within the select expression of a global variable.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var15_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_eight))
		end

	test_type_conversion_on_apply is
			-- Test type conversion of parameters in an xsl:apply-templates call.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var16_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_seven))
		end

	test_as_attribute_on_with_param is
			-- Test as attribute on xsl:with-param.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var17_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_six))
		end

	test_tunnel_parameters is
			-- Basic test of tunnel parameters.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var20_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_one))
		end

	test_override_tunnel_parameter is
			-- Test overriding a tunnel parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var21_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_two))
		end

	test_tunnel_parameters_with_call_template is
			-- Test tunnel parameters with xsl:call-template.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var22_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_two))
		end

	test_normal_versus_tunnel_parameters is
			-- Test normal parameters not clashing with tunnel parameters.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var23_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_three))
		end

	test_tunnel_parameters_with_variable_contents is
			-- Test tunnel parameters passed to match on variable contents.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var25_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_four))
		end

	test_supplied_tunnel_parameter is
			-- Test supplied tunnel parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var26_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_five))
		end

	test_supplied_required_tunnel_parameter is
			-- Test supplied required tunnel parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var27_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successful", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, expected_result_string_five))
		end

	test_required_tunnel_parameter_missing is
			-- Test missing required tunnel parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var905err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("XTDE0700", a_transformer.is_error)
		end

	test_type_error_on_tunnel_parameter is
			-- Test tunnel parameter with wrong type.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var906err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var20_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("XTTE0570", a_transformer.is_error)
		end

	test_duplicate_parameter_names is
			-- Test two parameters with same name.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_uri_source: XM_XSLT_URI_SOURCE
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var901err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("XTSE0580", a_stylesheet_compiler.load_stylesheet_module_failed)
		end

	test_missing_required_global_parameter is
			-- Test missing required global parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var902err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("XTDE0050", a_transformer.is_error)
		end

	test_variable_with_incorrect_supplied_type is
			-- Test variable with wrong type for supplied data..
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_uri_source: XM_XSLT_URI_SOURCE
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var903err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("XTTE0570", a_stylesheet_compiler.load_stylesheet_module_failed)
		end

	test_type_error_on_local_parameter is
			-- Test missing required global parameter.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var904err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("XPTY0004", a_transformer.is_error)
		end

	test_variable_with_missing_typed_value is
			-- Test missing value for integer-valued varaible.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var907err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("FORG0001", a_transformer.is_error)
		end

	test_variable_with_incorrect_complex_type is
			-- Test variable with wrong (element) type for supplied data..
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_uri_source: XM_XSLT_URI_SOURCE
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var908err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("XTTE0570", a_stylesheet_compiler.load_stylesheet_module_failed)
		end

	test_variable_with_incorrect_cardinality is
			-- Test variable with incorrect cardinality.
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_output: XM_OUTPUT
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make (var909err_xsl_uri.full_reference)
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make (var25_xml_uri.full_reference)
			create an_output
			an_output.set_output_to_string
			create a_result.make (an_output, "string:")
			a_transformer.transform (another_uri_source, a_result)
			assert ("XTTE0570", a_transformer.is_error)
		end

feature -- Results

	expected_result_string_one: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?>%N%T<b><d>17</d></b>%N"
			-- Expected result for `test_tunnel_parameters'

	expected_result_string_two: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><out>%N%T<b><d t1=%"17%" t2=%"28%" t3=%"38%"/></b><old>18</old>%N</out>"
			-- Expected result for `test_override_tunnel_parameter'

	expected_result_string_three: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><out>%N%T<b t1=%"mushroom%"><d t1=%"17%" t2=%"28%" t3=%"38%"/></b><old>18</old>%N</out>"
			-- Expected result for `test_normal_versus_tunnel_parameters'

	expected_result_string_four: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?>%N<a>x = abc</a>"
			-- Expected result for `test_tunnel_parameters_with_variable_contents'

	expected_result_string_five: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?>%N<a>abc</a>"
			-- Expected result for `test_supplied_tunnel_parameter'

	expected_result_string_six: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><out count=%"3%"/>"
			-- Expected result for `test_as_attribute_on_with_param'

	expected_result_string_seven: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><out test=%"true%"/>"
			-- Expected result for `test_type_conversion_on_apply'

	expected_result_string_eight: STRING is "<?xml version=%"1.0%" encoding=%"UTF-8%"?><out xmlns:xs=%"http://www.w3.org/2001/XMLSchema%" x=%"55%" z=%"22%" is-integer=%"true%"/>"
			-- Expected result for `test_range_variable_in_global_variable'


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
		
	var15_xsl_uri: UT_URI is
			-- URI of file 'var15.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var15.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var15_xsl_uri_not_void: Result /= Void
		end
				
	var25_xml_uri: UT_URI is
			-- URI of file 'var25.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var25.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var25_xml_uri_not_void: Result /= Void
		end

	var16_xsl_uri: UT_URI is
			-- URI of file 'var16.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var16.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var16_xsl_uri_not_void: Result /= Void
		end

	var17_xsl_uri: UT_URI is
			-- URI of file 'var17.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var17.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var17_xsl_uri_not_void: Result /= Void
		end
		
	var20_xsl_uri: UT_URI is
			-- URI of file 'var20.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var20.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var20_xsl_uri_not_void: Result /= Void
		end

	var20_xml_uri: UT_URI is
			-- URI of file 'var20.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var20.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var20_xml_uri_not_void: Result /= Void
		end

	var21_xsl_uri: UT_URI is
			-- URI of file 'var21.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var21.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var21_xsl_uri_not_void: Result /= Void
		end

	var22_xsl_uri: UT_URI is
			-- URI of file 'var22.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var22.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var22_xsl_uri_not_void: Result /= Void
		end

	var23_xsl_uri: UT_URI is
			-- URI of file 'var23.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var23.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var23_xsl_uri_not_void: Result /= Void
		end

	var25_xsl_uri: UT_URI is
			-- URI of file 'var25.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var25.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var25_xsl_uri_not_void: Result /= Void
		end

	var26_xsl_uri: UT_URI is
			-- URI of file 'var26.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var26.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var26_xsl_uri_not_void: Result /= Void
		end

	var27_xsl_uri: UT_URI is
			-- URI of file 'var27.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var27.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var27_xsl_uri_not_void: Result /= Void
		end

	var905err_xsl_uri: UT_URI is
			-- URI of file 'var905err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var905err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var905err_xsl_uri_not_void: Result /= Void
		end

	var906err_xsl_uri: UT_URI is
			-- URI of file 'var906err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var906err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var906err_xsl_uri_not_void: Result /= Void
		end

	var901err_xsl_uri: UT_URI is
			-- URI of file 'var901err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var901err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var901err_xsl_uri_not_void: Result /= Void
		end

	var902err_xsl_uri: UT_URI is
			-- URI of file 'var902err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var902err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var902err_xsl_uri_not_void: Result /= Void
		end

	var903err_xsl_uri: UT_URI is
			-- URI of file 'var903err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var903err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var903err_xsl_uri_not_void: Result /= Void
		end

	var904err_xsl_uri: UT_URI is
			-- URI of file 'var904err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var904err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var904err_xsl_uri_not_void: Result /= Void
		end

	var907err_xsl_uri: UT_URI is
			-- URI of file 'var907err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var907err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var907err_xsl_uri_not_void: Result /= Void
		end

	var908err_xsl_uri: UT_URI is
			-- URI of file 'var908err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var908err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var908err_xsl_uri_not_void: Result /= Void
		end

	var909err_xsl_uri: UT_URI is
			-- URI of file 'var909err.xsl'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "var909err.xsl")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			var909err_xsl_uri_not_void: Result /= Void
		end

end
