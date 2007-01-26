indexing

	description:

		"Test unparsed-text() function."

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_UNPARSED_TEXT

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES

	XM_RESOLVER_FACTORY

feature -- Test

	-- TODO: when this function is ready, uncomment and remove relative paths as per other tests
-- 	test_unparsed_text is
-- 			-- Test unparsed-text()
-- 		local
-- 			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
-- 			a_configuration: XM_XSLT_CONFIGURATION
-- 			a_transformer: XM_XSLT_TRANSFORMER
-- 			a_uri_source: XM_XSLT_URI_SOURCE
-- 			an_output: XM_OUTPUT
-- 			a_result: XM_XSLT_TRANSFORMATION_RESULT
-- 		do
-- 			conformance.set_basic_xslt_processor
-- 			create a_configuration.make_with_defaults
-- 			create a_stylesheet_compiler.make (a_configuration)
-- 			create a_uri_source.make ("./data/unparsed_text.xsl")
-- 			a_stylesheet_compiler.prepare (a_uri_source)
-- 			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
-- 			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
-- 			a_transformer := a_stylesheet_compiler.new_transformer
-- 			assert ("transformer", a_transformer /= Void)
-- 			a_transformer.set_initial_template ("first")
-- 			assert ("Initial template set", a_transformer.initial_template /= Void)
-- 			create an_output
-- 			an_output.set_output_to_string 
-- 			create a_result.make (an_output, "string:")
-- 			a_transformer.transform (Void, a_result)
-- 			assert ("Transform successfull", not a_transformer.is_error)
-- 			assert ("Correct", an_output.last_output.count = 935)
-- 		end

-- 	test_unparsed_text_utf_16 is
-- 			-- Test unparsed-text() on a utf_16 file
-- 		local
-- 			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
-- 			a_configuration: XM_XSLT_CONFIGURATION
-- 			a_transformer: XM_XSLT_TRANSFORMER
-- 			a_uri_source: XM_XSLT_URI_SOURCE
-- 			an_output: XM_OUTPUT
-- 			a_result: XM_XSLT_TRANSFORMATION_RESULT
-- 		do
-- 			conformance.set_basic_xslt_processor
-- 			create a_configuration.make_with_defaults
-- 			create a_stylesheet_compiler.make (a_configuration)
-- 			create a_uri_source.make ("./data/unparsed_text3.xsl")
-- 			a_stylesheet_compiler.prepare (a_uri_source)
-- 			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
-- 			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
-- 			a_transformer := a_stylesheet_compiler.new_transformer
-- 			assert ("transformer", a_transformer /= Void)
-- 			a_transformer.set_initial_template ("first")
-- 			assert ("Initial template set", a_transformer.initial_template /= Void)
-- 			create an_output
-- 			an_output.set_output_to_string 
-- 			create a_result.make (an_output, "string:")
-- 			a_transformer.transform (Void, a_result)
-- 			assert ("Transform successfull", not a_transformer.is_error)
-- 			print (an_output.last_output.count)
-- 			assert ("Correct", an_output.last_output.count = 935)
-- 		end

-- 	test_unparsed_text_utf_16_incorrect_encoding is
-- 			-- Test unparsed-text() on a utf_16 file where utf-8 is assumed
-- 		local
-- 			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
-- 			a_configuration: XM_XSLT_CONFIGURATION
-- 			a_transformer: XM_XSLT_TRANSFORMER
-- 			a_uri_source: XM_XSLT_URI_SOURCE
-- 			an_output: XM_OUTPUT
-- 			a_result: XM_XSLT_TRANSFORMATION_RESULT
-- 		do
-- 			conformance.set_basic_xslt_processor
-- 			create a_configuration.make_with_defaults
-- 			create a_stylesheet_compiler.make (a_configuration)
-- 			create a_uri_source.make ("./data/unparsed_text2.xsl")
-- 			a_stylesheet_compiler.prepare (a_uri_source)
-- 			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
-- 			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
-- 			a_transformer := a_stylesheet_compiler.new_transformer
-- 			assert ("transformer", a_transformer /= Void)
-- 			a_transformer.set_initial_template ("first")
-- 			assert ("Initial template set", a_transformer.initial_template /= Void)
-- 			create an_output
-- 			an_output.set_output_to_string 
-- 			create a_result.make (an_output, "string:")
-- 			a_transformer.transform (Void, a_result)
-- 			assert ("Transform unsuccessfull", a_transformer.is_error)
-- 		end

feature {NONE} -- Debug

	hexadecimal_string (a_string: STRING): STRING is
			-- Version of `a_string' where every character is converted to it's code's hex representation
		require
			string_not_void: a_string /= Void
		local
			an_index, a_code: INTEGER
		do
			from
				Result := ""
				an_index := 1
			variant
				a_string.count + 1 - an_index
			until
				an_index > a_string.count
			loop
				a_code := a_string.item_code (an_index)
				Result.append_string (INTEGER_.to_hexadecimal (a_code, True))
				an_index := an_index + 1
			end
		ensure
			result_not_void: Result /= Void
		end

end
