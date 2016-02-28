note

	description:

		"Objects that represent xsl:include or xsl:import elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
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

	href: detachable STRING
			-- Value of href mandatory attribute

	included_document: detachable XM_XPATH_TREE_DOCUMENT
			-- Document node of loaded module

	included_stylesheet (l_importer: XM_XSLT_STYLESHEET; a_precedence: INTEGER): detachable XM_XSLT_STYLESHEET
			-- Stylesheet included/imported from `href'
		require
			importer_not_void: l_importer /= Void
			href_not_void: href /= Void
		local
			l_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_configuration: XM_XSLT_CONFIGURATION
			l_source: XM_XSLT_URI_SOURCE
			l_uri, a_base_uri: UT_URI
			l_uri_resolver: XM_URI_REFERENCE_RESOLVER
			l_node_factory: XM_XSLT_NODE_FACTORY
			l_message, l_error_code, l_reference: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_outermost_element: detachable XM_XPATH_TREE_ELEMENT
			l_document: detachable XM_XPATH_TREE_DOCUMENT
		do
			check_empty
			if is_import then
				l_error_code := "XTSE0190"
			else
				l_error_code := "XTSE0170"
			end
			check_top_level (l_error_code)
			if not any_compile_errors then
				check
					parent_is_stylesheet: attached {XM_XSLT_STYLESHEET} parent_node as l_stylesheet
					-- check_top_level ensured this
				then
					check attached stylesheet_compiler as l_stylesheet_compiler2 then
						l_stylesheet_compiler := l_stylesheet_compiler2
					end
					l_configuration := l_stylesheet_compiler.configuration
					l_uri_resolver := l_configuration.uri_resolver
					check attached base_uri as l_base_uri then
						create a_base_uri.make (l_base_uri)
					end
					check precondition_href_not_void: attached href as l_href then
						create l_uri.make_resolve (a_base_uri, l_href)
					end
					l_uri_resolver.resolve_uri (l_uri.full_reference)
					if attached l_uri_resolver.last_uri_reference_error as l_last_uri_reference_error then
						check has_uri_reference_error: l_uri_resolver.has_uri_reference_error end
						l_message := STRING_.concat (l_last_uri_reference_error, ": URI is ")
						l_message := STRING_.appended_string (l_message, l_uri.full_reference)
						create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0165", Static_error)
						report_compile_error (l_error)
					else
						check attached l_uri_resolver.last_system_id as l_last_system_id then
							l_reference := l_last_system_id.full_reference
						end
						create l_source.make (l_reference)
						check_recursion (l_reference, l_stylesheet)
						if not any_compile_errors then
							create l_node_factory.make (l_configuration.error_listener, l_configuration)
							l_configuration.error_listener.set_next_error_code (Xpath_errors_uri, "XTSE0165")
							check
								attached l_uri_resolver.last_uri_reference_stream as l_last_uri_reference_stream
								attached l_uri_resolver.last_system_id as l_last_system_id
							then
								l_stylesheet_compiler.load_stylesheet_module (l_source, l_last_uri_reference_stream, l_last_system_id, l_error_code)
							end
							l_configuration.error_listener.clear_next_error_code_change
							if l_stylesheet_compiler.load_stylesheet_module_failed then
								check attached principal_stylesheet as l_principal_stylesheet then
									l_principal_stylesheet.set_compile_errors
								end
							else
								check attached l_stylesheet_compiler.last_loaded_module as l_last_loaded_module then
									included_document := l_last_loaded_module

									-- allow "Literal Result Element as Stylesheet" syntax

									l_outermost_element := l_last_loaded_module.document_element
								end
								if attached {XM_XSLT_LITERAL_RESULT_ELEMENT} l_outermost_element as l_lre then
									check attached stylesheet_compiler as l_stylesheet_compiler2 then
										l_document := l_lre.constructed_stylesheet (l_stylesheet_compiler2)
									end
									if l_document = Void then
										l_outermost_element := Void
									else
										l_outermost_element := l_document.document_element
									end
								end
								if not attached {XM_XSLT_STYLESHEET} l_outermost_element as l_result then
									check precondition_href_not_void: attached href as l_href then
										l_message := STRING_.concat ("Included document ", l_href)
									end
									l_message := STRING_.appended_string (l_message, " is not (possibly recursively) a stylesheet")
									create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE0165", Static_error)
									report_compile_error (l_error)
								else
									Result := l_result
									if attached Result.validation_error as l_validation_error then
										if reporting_circumstances = Report_always then
											Result.report_compile_error (l_validation_error)
										elseif reporting_circumstances = Report_unless_forwards_comptible and then not Result.is_forwards_compatible_processing_enabled then
											Result.report_compile_error (l_validation_error)
										end
									end
									Result.set_import_precedence (a_precedence)
									Result.set_importer (l_importer)
									Result.splice_includes
--									set_input_type_annotations
--									if not any_compile_errors then
--										Result.set_input_type_annotations
--									end
--									if not any_compile_errors then
--										l_stylesheet.merge_input_type_annotations (Result.input_type_annotations)
--									end
								end
							end
						end
					end
				end
			end
		ensure
			error_if_void: Result = Void implies any_compile_errors
		end

feature -- Status report

	is_import: BOOLEAN
			-- Is this an xsl:import?
		deferred
		end

feature -- Element change

	create_static_context
			-- Create `static_context'
		do
			create static_context.make (Current, configuration)
		ensure
			static_context_created: static_context /= Void
		end

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_href: like href
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					any_compile_errors or a_cursor.after
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Href_attribute) then
						l_href := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_href)
						STRING_.right_adjust (l_href)
						href := l_href
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if any_compile_errors then
				-- nothing more to do
			elseif not attached href as l_href2 then
				report_absence ("href")
			elseif uri_encoding.has_excluded_characters (l_href2) then
				create l_error.make_from_string ("'href' attribute contains invalid characters", Xpath_errors_uri, "XTSE0165", Static_error)
				report_compile_error (l_error)
			end
			attributes_prepared := True
		end


	validate
			-- Check that the stylesheet element is valid.
		do

			-- Will never be called

		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			check
				never_compiled: False
			end
			last_generated_expression := Void
		end

feature -- Conversion

	is_module: BOOLEAN
			-- Is `Current' an xsl:include/import?
		do
			Result := True
		end

	as_module: XM_XSLT_MODULE
			-- `Current' seen as an xsl:include/import
		do
			Result := Current
		end

feature {NONE} -- Implementation

	uri_encoding: UT_URL_ENCODING
			-- Encoding/decoding routines and tests
		once
			create Result
		ensure
			uri_encoding_not_void: Result /= Void
		end

	check_recursion (a_reference: STRING; a_stylesheet: XM_XSLT_STYLESHEET)
			-- Check for recursive import or include.
		require
			no_previous_error: not any_compile_errors
			a_reference_not_void: a_reference /= Void
			a_stylesheet_not_void: a_stylesheet /= Void
		local
			l_ancestor: detachable XM_XSLT_STYLESHEET
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

