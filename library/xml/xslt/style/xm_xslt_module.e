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

	included_stylesheet (l_importer: XM_XSLT_STYLESHEET; a_precedence: INTEGER): XM_XSLT_STYLESHEET is
			-- Stylesheet included/imported from `href'
		require
			importer_not_void: l_importer /= Void
			href_not_void: href /= Void
		local
			l_stylesheet: XM_XSLT_STYLESHEET
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_source: XM_XSLT_URI_SOURCE
			l_uri, a_base_uri: UT_URI
			l_uri_resolver: XM_URI_REFERENCE_RESOLVER
			l_node_factory: XM_XSLT_NODE_FACTORY
			l_message, l_error_code, l_reference: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_outermost_element: XM_XPATH_TREE_ELEMENT
			l_lre: XM_XSLT_LITERAL_RESULT_ELEMENT
			l_document: XM_XPATH_TREE_DOCUMENT
		do
			check_empty
			if is_import then
				l_error_code := "XTSE0190"
			else
				l_error_code := "XTSE0170"
			end
			check_top_level (l_error_code)
			if not any_compile_errors then
				l_stylesheet ?= parent_node
				check
					parent_is_stylesheet: l_stylesheet /= Void
					-- check_top_level ensured this
				end
				l_stylesheet_compiler := stylesheet_compiler
				l_configuration := l_stylesheet_compiler.configuration
				l_uri_resolver := l_configuration.uri_resolver
				create a_base_uri.make (base_uri)
				create l_uri.make_resolve (a_base_uri, href)
				l_uri_resolver.resolve_uri (l_uri.full_reference)
				if l_uri_resolver.has_uri_reference_error then
					l_message := STRING_.concat (l_uri_resolver.last_uri_reference_error, ": URI is ")
					l_message := STRING_.appended_string (l_message, l_uri.full_reference)
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0165", Static_error)
					report_compile_error (l_error)
				else
					l_reference := l_uri_resolver.last_system_id.full_reference
					create l_source.make (l_reference)
					check_recursion (l_reference, l_stylesheet)
					if not any_compile_errors then
						create l_node_factory.make (l_configuration.error_listener, l_configuration)
						l_configuration.error_listener.set_next_error_code (Xpath_errors_uri, "XTSE0165")
						l_stylesheet_compiler.load_stylesheet_module (l_source, l_uri_resolver.last_uri_reference_stream, l_uri_resolver.last_system_id, l_error_code)
						l_configuration.error_listener.clear_next_error_code_change
						if l_stylesheet_compiler.load_stylesheet_module_failed then
							principal_stylesheet.set_compile_errors
						else
							included_document := l_stylesheet_compiler.last_loaded_module

							-- allow "Literal Result Element as Stylesheet" syntax

							l_outermost_element := included_document.document_element
							l_lre ?= l_outermost_element
							if l_lre /= Void then
								l_document := l_lre.constructed_stylesheet (stylesheet_compiler)
								if l_document = Void then
									l_outermost_element := Void
								else
									l_outermost_element := l_document.document_element
								end
							end
							Result ?= l_outermost_element
							if Result = Void then
								l_message := STRING_.concat ("Included document ", href)
								l_message := STRING_.appended_string (l_message, " is not (possibly recursively) a stylesheet")
								create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0165", Static_error)
								report_compile_error (l_error)
							else
								if Result.validation_error /= Void then
									if reporting_circumstances = Report_always then
										Result.report_compile_error (Result.validation_error)
									elseif reporting_circumstances = Report_unless_forwards_comptible and then not Result.is_forwards_compatible_processing_enabled then
										Result.report_compile_error (Result.validation_error)
									end
								end
								Result.set_import_precedence (a_precedence)
								Result.set_importer (l_importer)
								Result.splice_includes
--								set_input_type_annotations
--								if not any_compile_errors then
--									Result.set_input_type_annotations
--								end
--								if not any_compile_errors then
--								l_stylesheet.merge_input_type_annotations (Result.input_type_annotations)
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
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attribute_collection /= Void then
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
			end
			if any_compile_errors then
				-- nothing more to do
			elseif href = Void then
				report_absence ("href")
			elseif uri_encoding.has_excluded_characters (href) then
				create l_error.make_from_string ("'href' attribute contains invalid characters", Xpath_errors_uri, "XTSE0165", Static_error)
				report_compile_error (l_error)
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

	check_recursion (a_reference: STRING; a_stylesheet: XM_XSLT_STYLESHEET) is
			-- Check for recursive import or include.
		require
			no_previous_error: not any_compile_errors
			a_reference_not_void: a_reference /= Void
			a_stylesheet_not_void: a_stylesheet /= Void
		local
			l_ancestor: XM_XSLT_STYLESHEET
			l_message, l_error_code, l_system_id, l_ancestor_id: STRING
		do
			if a_reference.has ('#') then
				l_system_id := a_reference.substring (1, a_reference.index_of ('#', 2) - 1)
			else
				l_system_id := a_reference
			end
			from
				l_ancestor := a_stylesheet
			until
				l_ancestor = Void or any_compile_errors
			loop
				l_ancestor_id := l_ancestor.system_id
				if l_ancestor_id.has ('#') then
					l_ancestor_id := l_ancestor_id.substring (1, l_ancestor_id.index_of ('#', 2) - 1)
				end
				if STRING_.same_string (l_system_id, l_ancestor_id) then
					if l_ancestor.imports.has (a_reference) then
						if is_import then
							l_error_code := "XTSE0210"
							l_message := "A stylesheet may not import itself"
						else
							l_error_code := "XTSE0180"
							l_message := "A stylesheet may not include itself"
						end
						report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (l_message, Xpath_errors_uri, l_error_code, Static_error))
					else
						l_ancestor.imports.force_new (a_reference)
					end
				end
				l_ancestor := l_ancestor.importer
			end
		end

end
	
