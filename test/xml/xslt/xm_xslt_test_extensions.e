indexing

	description:

		"Test extensions."

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_EXTENSIONS

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES

	XM_RESOLVER_FACTORY

	XM_XSLT_SHARED_EMITTER_FACTORY

feature -- Test

	test_gexslt_collation is
			-- Test gexslt:collation
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_output: XM_OUTPUT
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/collations.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			assert ("Initial template set", a_transformer.initial_template /= Void)
			create an_output
			an_output.set_output_to_string 
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
		end

	test_fallback is
			-- Test fallback
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_output: XM_OUTPUT
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/fallback.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			assert ("Initial template set", a_transformer.initial_template /= Void)
			create an_output
			an_output.set_output_to_string 
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Correct result", STRING_.same_string (an_output.last_output, "OK"))
		end

	test_no_fallback is
			-- Test absent extension instruction
		local
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_output: XM_OUTPUT
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			create a_stylesheet_compiler.make (a_configuration)
			create a_uri_source.make ("./data/no_fallback.xsl")
			a_stylesheet_compiler.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet_compiler.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet_compiler.last_loaded_module /= Void)
			a_transformer := a_stylesheet_compiler.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_transformer.set_initial_template ("first")
			assert ("Initial template set", a_transformer.initial_template /= Void)
			create an_output
			an_output.set_output_to_string 
			create a_result.make (an_output, "string:")
			a_transformer.transform (Void, a_result)
			assert ("XT1450", a_transformer.is_error)
		end

end
