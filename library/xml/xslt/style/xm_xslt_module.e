indexing

	description:

		"Objects that represent xsl:include or xsl:import elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_MODULE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, is_module, as_module
		end

feature -- Access

	href: STRING
			-- Value of href mandatory attribute

	included_document: XM_XPATH_TREE_DOCUMENT
			-- Document node of loaded module

	included_stylesheet (an_importer: XM_XSLT_STYLESHEET; a_precedence: INTEGER): XM_XSLT_STYLESHEET is
			-- Stylesheet included/imported from `href'
		require
			importer_not_void: an_importer /= Void
			href_not_void: href /= Void
		local
			a_stylesheet: XM_XSLT_STYLESHEET
			a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			a_configuration: XM_XSLT_CONFIGURATION
			a_source: XM_XSLT_URI_SOURCE
			a_uri, a_base_uri: UT_URI
			a_uri_resolver: XM_URI_REFERENCE_RESOLVER
			a_node_factory: XM_XSLT_NODE_FACTORY
			a_message, an_error_code: STRING
			an_error: XM_XPATH_ERROR_VALUE
			an_outermost_element: XM_XPATH_TREE_ELEMENT
			an_lre: XM_XSLT_LITERAL_RESULT_ELEMENT
			a_document: XM_XPATH_TREE_DOCUMENT
		do
			check_empty
			if is_import then
				an_error_code := "XTSE0190"
			else
				an_error_code := "XTSE0170"
			end
			check_top_level (an_error_code)
			if not any_compile_errors then
				a_stylesheet ?= parent_node
				check
					parent_is_stylesheet: a_stylesheet /= Void
					-- check_top_level ensured this
				end
				a_stylesheet_compiler := stylesheet_compiler
				a_configuration := a_stylesheet_compiler.configuration
				a_uri_resolver := a_configuration.uri_resolver
				create a_base_uri.make (base_uri)
				create a_uri.make_resolve (a_base_uri, href)
				a_uri_resolver.resolve_uri (a_uri.full_reference)
				if a_uri_resolver.has_uri_reference_error then
					a_message := STRING_.concat (a_uri_resolver.last_uri_reference_error, ": URI is ")
					a_message := STRING_.appended_string (a_message, a_uri.full_reference)
					create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0165", Static_error)
					report_compile_error (an_error)
				else
					create a_source.make (a_uri_resolver.last_system_id.full_reference)
					check_recursion (a_source, a_stylesheet)
					if not any_compile_errors then
						create a_node_factory.make (a_configuration.error_listener, a_configuration)
						a_configuration.error_listener.set_next_error_code (Xpath_errors_uri, "XTSE0165")
						a_stylesheet_compiler.load_stylesheet_module (a_source, a_uri_resolver.last_uri_reference_stream, a_uri_resolver.last_system_id, an_error_code)
						a_configuration.error_listener.clear_next_error_code_change
						if a_stylesheet_compiler.load_stylesheet_module_failed then
							principal_stylesheet.set_compile_errors
						else
							included_document := a_stylesheet_compiler.last_loaded_module

							-- allow "Literal Result Element as Stylesheet" syntax

							an_outermost_element := included_document.document_element
							an_lre ?= an_outermost_element
							if an_lre /= Void then
								a_document := an_lre.constructed_stylesheet (stylesheet_compiler)
								if a_document = Void then
									an_outermost_element := Void
								else
									an_outermost_element := a_document.document_element
								end
							end
							Result ?= an_outermost_element
							if Result = Void then
								a_message := STRING_.concat ("Included document ", href)
								a_message := STRING_.appended_string (a_message, " is not (possibly recursively) a stylesheet")
								create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0165", Static_error)
								report_compile_error (an_error)
							else
								if Result.validation_error /= Void then
									if reporting_circumstances = Report_always then
										Result.report_compile_error (Result.validation_error)
									elseif reporting_circumstances = Report_unless_forwards_comptible and then not Result.is_forwards_compatible_processing_enabled then
										Result.report_compile_error (Result.validation_error)
									end
								end
								Result.set_import_precedence (a_precedence)
								Result.set_importer (an_importer)
								Result.splice_includes
								a_stylesheet.merge_input_type_annotations (Result.input_type_annotations)
							end
						end
					end
				end
			end
		ensure
			error_if_void: Result = Void implies any_compile_errors
		end

feature -- Status report

	is_import: BOOLEAN is
			-- Is this an xsl:import?
		deferred
		end

feature -- Element change

	create_static_context is
			-- Create `static_context'
		do
			create static_context.make (Current, configuration)
		ensure
			static_context_created: static_context /= Void
		end
	
	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				any_compile_errors or a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Href_attribute) then
					href := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (href)
					STRING_.right_adjust (href)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if any_compile_errors then
				-- nothing more to do
			elseif href = Void then
				report_absence ("href")
			elseif uri_encoding.has_excluded_characters (href) then
				create an_error.make_from_string ("'href' attribute contains invalid characters", Xpath_errors_uri, "XTSE0165", Static_error)
				report_compile_error (an_error)
			end
			attributes_prepared := True
		end
	
	
	validate is
			-- Check that the stylesheet element is valid.
		do

			-- Will never be called

		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			check
				never_compiled: False
			end
			last_generated_expression := Void
		end

feature -- Conversion

	is_module: BOOLEAN is
			-- Is `Current' an xsl:include/import?
		do
			Result := True
		end

	as_module: XM_XSLT_MODULE is
			-- `Current' seen as an xsl:include/import
		do
			Result := Current
		end

feature {NONE} -- Implementation

	uri_encoding: UT_URL_ENCODING is
			-- Encoding/decoding routines and tests
		once
			create Result
		ensure
			uri_encoding_not_void: Result /= Void
		end

	check_recursion (a_source: XM_XSLT_URI_SOURCE; a_stylesheet: XM_XSLT_STYLESHEET) is
			-- Check for recursive import.
		require
			source_not_void: a_source /= Void
			stylesheet_not_void: a_stylesheet /= Void
		local
			an_ancestor: XM_XSLT_STYLESHEET
			an_error: XM_XPATH_ERROR_VALUE
			a_message, an_error_code: STRING
		do
			from
				an_ancestor := a_stylesheet
			until
				an_ancestor = Void or else any_compile_errors
			loop
				if STRING_.same_string (a_source.uri_reference, an_ancestor.system_id) then
					if is_import then
						an_error_code := "XTSE0210"
						a_message := "A stylesheet may not import itself"
					else
						an_error_code := "XTSE0180"
						a_message := "A stylesheet may not import include"
					end
					create an_error.make_from_string (a_message, Xpath_errors_uri, an_error_code, Static_error)
					report_compile_error (an_error)
				else
					an_ancestor := an_ancestor.importer
				end
			end
		end
	
end
	
