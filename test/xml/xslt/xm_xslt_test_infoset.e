indexing

	description:

		"Test producing an infoset for canonical comparison of two XML files"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_INFOSET

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL

	XM_RESOLVER_FACTORY
	
feature

	test_infoset is
			-- Transform same file to an infoset twice - one with and one without indenting. -- TODO - this last condition not yet tested
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_output: XM_OUTPUT
			an_output_string, another_output_string: STRING
			a_resolver: XM_URI_EXTERNAL_RESOLVER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			conformance.set_basic_xslt_processor
			create a_configuration.make_with_defaults
			a_configuration.set_line_numbering (True)
			a_configuration.use_tiny_tree_model (False)
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("./data/infoset.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/test1.xml")
			create an_output
			create an_output_string.make (0)
			an_output.set_output_string (an_output_string)
			create a_result.make (an_output)
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			a_configuration.use_tiny_tree_model (True)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			create another_uri_source.make ("./data/test1.xml")
			create an_output
			create another_output_string.make (0)
			an_output.set_output_string (another_output_string)
			create a_result.make (an_output)
			a_transformer.transform (another_uri_source, a_result)
			assert ("Transform successfull", not a_transformer.is_error)
			assert ("Files are canonically the same", STRING_.same_string (an_output_string, another_output_string))
		end

end
