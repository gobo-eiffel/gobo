indexing

	description:

		"Objects that represent xsl:include or xsl:import elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_MODULE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
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
			a_pss: XM_XSLT_PREPARED_STYLESHEET
			a_configuration: XM_XSLT_CONFIGURATION
			a_source: XM_XSLT_URI_SOURCE
			a_uri, a_base_uri: UT_URI
			a_uri_resolver: XM_URI_REFERENCE_RESOLVER
			a_node_factory: XM_XSLT_NODE_FACTORY
			a_message: STRING
		do
			check_empty
			check_top_level

			if not any_compile_errors then
				a_stylesheet ?= parent_node
				check
					parent_is_stylesheet: a_stylesheet /= Void
					-- check_top_level ensured this
				end
				a_pss := prepared_stylesheet
				a_configuration := a_pss.configuration
				a_uri_resolver := a_configuration.uri_resolver
				create a_base_uri.make (base_uri)
				create a_uri.make_resolve (a_base_uri, href)
				if a_uri.has_fragment then
					-- TODO add an ID filter to support fragment identifiers
					report_compile_error ("Fragment identifier not supported")
				else
					a_uri_resolver.resolve_uri (a_uri.full_reference)
					if a_uri_resolver.has_uri_reference_error then
						report_compile_error (a_uri_resolver.last_uri_reference_error)
					else
						create a_source.make (a_uri_resolver.last_system_id.full_reference)
						create a_node_factory.make (a_configuration.error_listener, a_configuration.are_external_functions_allowed)
						a_pss.load_stylesheet_module (a_source, a_uri_resolver.last_uri_reference_stream, a_uri_resolver.last_system_id, a_configuration, a_node_factory)
						if a_pss.load_stylesheet_module_failed then
							report_compile_error (a_pss.load_stylesheet_module_error)
						else
							included_document := a_pss.last_loaded_module
							-- TODO: allow "Literal Result Element as Stylesheet" syntax, and validation errors
							Result ?= included_document.document_element
							if Result = Void then
								a_message := STRING_.concat ("Included document ", href)
								report_compile_error (STRING_.appended_string (a_message, " is not a stylesheet"))
							else
								if Result.validation_error_message /= Void then
									if reporting_circumstances = Report_always then
										Result.report_compile_error (Result.validation_error_message)
									elseif reporting_circumstances = Report_unless_forwards_comptible and then not Result.is_forwards_compatible_processing_enabled then
										Result.report_compile_error (Result.validation_error_message)
									end
								end
								Result.set_import_precedence (a_precedence)
								Result.set_importer (an_importer)
								Result.splice_includes
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
			create static_context.make (Current)
		ensure
			static_context_created: static_context /= Void
		end
	
	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
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
			if href = Void then
				report_absence ("href")
			end
			attributes_prepared := True
		end
	
	
	validate is
			-- Check that the stylesheet element is valid.
		do
			check_empty
			check_top_level
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			check
				never_compiled: False
			end
			last_generated_instruction := Void
		end

end
	
