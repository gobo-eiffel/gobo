indexing

	description:

		"Test transform"

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEST_TRANSFORM

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_SHARED_NAME_POOL


	XM_RESOLVER_FACTORY
	
feature

	test_transform is
			-- Transform books.xml with books.xsl.
		local
			a_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_transformer: XM_XSLT_TRANSFORMER
			a_uri_source, another_uri_source: XM_XSLT_URI_SOURCE
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
			a_configuration.set_string_mode_ascii   -- make_with_defaults sets to mixed
			a_configuration.use_tiny_tree_model (False)
			create a_stylesheet.make (a_configuration)
			create a_uri_source.make ("../xpath/data/books.xsl")
			a_stylesheet.prepare (a_uri_source)
			assert ("Stylesheet compiled without errors", not a_stylesheet.load_stylesheet_module_failed)
			assert ("Stylesheet not void", a_stylesheet.last_loaded_module /= Void)
			a_transformer := a_stylesheet.new_transformer
			assert ("transformer", a_transformer /= Void)
			a_configuration.set_entity_resolver (new_file_resolver_current_directory) -- bodge
			create another_uri_source.make ("../xpath/data/books.xml")
			a_parser := a_transformer.new_parser
			a_builder := a_transformer.new_builder (a_parser)
			another_uri_source.send (a_parser, a_transformer.new_stripper (a_builder), False)
			a_document := a_builder.document
			assert ("No error", not a_builder.has_error)
			assert ("Document", a_document /= Void)
			a_transformer.register_document (a_document, another_uri_source.system_id)
			--a_transformer.create_new_context (a_document)
			--a_transformer.perform_transformation (a_document)
			create an_output
			create a_result.make (an_output)
			a_transformer.transform_document (a_document, a_result)
		end

end
