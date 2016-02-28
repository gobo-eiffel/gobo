note

	description:

		"Routines common to xsl:output and xsl:result-document"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_ROUTINES

inherit

	XM_XPATH_ERROR_TYPES

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

feature -- Access

	use_character_maps: detachable STRING
			-- Value of use-character-maps attribute

feature {NONE} -- Implementation

	cdata_section_expanded_names: detachable DS_ARRAYED_LIST [STRING]
			-- Expanded names of elements whose text children are to be output as CDATA sections

	cdata_validation_error: detachable XM_XPATH_ERROR_VALUE

	validate_cdata_sections (a_cdata_section_elements: STRING; a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER)
			-- Validate cdata-section-elements attribute.
		require
			cdata_section_elements_not_void: a_cdata_section_elements /= Void
			cdata_validation_error_void: cdata_validation_error = Void
		local
			a_string_splitter: ST_SPLITTER
			a_cdata_name_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_uri: detachable STRING
			a_parser: XM_XPATH_QNAME_PARSER
			l_cdata_section_expanded_names: like cdata_section_expanded_names
		do
			cdata_validation_error := Void
			create a_string_splitter.make
			a_cdata_name_list := a_string_splitter.split (a_cdata_section_elements)
			from
				a_cursor := a_cdata_name_list.new_cursor; a_cursor.start
				create l_cdata_section_expanded_names.make (a_cdata_name_list.count)
				cdata_section_expanded_names := l_cdata_section_expanded_names
			until
				a_cursor.after
			loop
				create a_parser.make (a_cursor.item)
				if not a_parser.is_valid then
					create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element name in xsl:output or xsl:result-document. ", a_cursor.item), Xpath_errors_uri, "XTSE0020", Static_error)
					a_cursor.go_after
				else
					check
						invariant_XM_XPATH_QNAME_PARSER_prefix_not_void: attached a_parser.optional_prefix as l_optional_prefix
						invariant_XM_XPATH_QNAME_PARSER_local_name_not_void: attached a_parser.local_name as l_local_name
					then
						a_uri := a_namespace_resolver.uri_for_defaulted_prefix (l_optional_prefix, True)
						if a_uri = Void then
							create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element prefix. in xsl:output or xsl:result-document ",
								l_optional_prefix), Xpath_errors_uri, "XTSE0020", Static_error)
							a_cursor.go_after
						else
							l_cdata_section_expanded_names.put_last (expanded_name_from_components (a_uri, l_local_name))
						end
					end
				end
				a_cursor.forth
			variant
				a_cdata_name_list.count + 1 - a_cursor.index
			end
		ensure
			cdata_section_expanded_names_not_void: cdata_section_expanded_names /= Void
		end

	gather_used_character_maps_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set used-character-maps property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
		local
			l_stylesheet: XM_XSLT_STYLESHEET
			l_used_character_maps: DS_ARRAYED_LIST [STRING]
			l_character_maps: DS_LIST [STRING]
			l_splitter: ST_SPLITTER
			l_expanded_names: DS_ARRAYED_LIST [STRING]
		do
			check attached principal_stylesheet as l_principal_stylesheet then
				l_stylesheet := l_principal_stylesheet
				l_used_character_maps := a_property_set.used_character_maps
				create l_splitter.make
				check attached use_character_maps as la_use_character_maps then
					l_character_maps := l_splitter.split (la_use_character_maps)
					create l_expanded_names.make (l_character_maps.count)
					l_expanded_names.set_equality_tester (string_equality_tester)
					create l_splitter.make
					l_splitter.set_separators (":")
					l_character_maps.do_if (agent extend_expanded_names (l_expanded_names, l_splitter, l_stylesheet, l_used_character_maps, ?), agent no_compile_error_yet)

					-- Because in {XM_XSLT_STYLESHEET}.gather_output_properties, we
					--  process xsl:output instructions in reverse order (to get the import
					--  precedence right), we have to prepend here.
					l_used_character_maps.append_first (l_expanded_names)
				end
			end
		end

	extend_expanded_names (a_expanded_names: DS_ARRAYED_LIST [STRING]; a_splitter: ST_SPLITTER;
		a_stylesheet: XM_XSLT_STYLESHEET; a_used_character_maps: DS_ARRAYED_LIST [STRING]; a_character_map: STRING)
			-- Extend `a_expanded_names' with expanded name of `a_character_map'.
		require
			a_expanded_names_not_void: a_expanded_names /= void
			a_expanded_names_is_extendible: a_expanded_names.extendible (1)
			a_splitter_not_void: a_splitter /= Void
			a_stylesheet_not_void: a_stylesheet /= Void
			a_used_character_maps_not_void: a_used_character_maps /= Void
			a_character_map_not_void: a_character_map /= Void
			a_character_map_not_empty: not a_character_map.is_empty
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_fingerprint: INTEGER
			l_character_map: detachable XM_XSLT_CHARACTER_MAP
			l_uri, l_message, l_expanded_name: STRING
		do
			create l_parser.make (a_character_map)
			if not l_parser.is_valid then
				report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (a_character_map, " is not a lexical QName."), Xpath_errors_uri, "XTSE1590", Static_error))
			else
				check
					invariant_XM_XPATH_QNAME_PARSER_prefix_not_void: attached l_parser.optional_prefix as l_optional_prefix
					invariant_XM_XPATH_QNAME_PARSER_local_name_not_void: attached l_parser.local_name as l_local_name
				then
					if not l_parser.is_prefix_present then
						l_uri := ""
					elseif attached uri_for_prefix (l_optional_prefix, False) as l_uri_for_prefix then
						l_uri := l_uri_for_prefix
					else
						l_uri := ""
					end
					if shared_name_pool.is_name_code_allocated (l_optional_prefix, l_uri, l_local_name) then
						l_fingerprint := shared_name_pool.name_code (l_optional_prefix, l_uri, l_local_name)
					else
						shared_name_pool.allocate_name (l_optional_prefix, l_uri, l_local_name)
						l_fingerprint := shared_name_pool.last_name_code
					end
					if l_fingerprint = -1 then
						report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (a_character_map, " is not a lexical QName."), Xpath_errors_uri, "XTSE1590", Static_error))
					else
						l_fingerprint := shared_name_pool.fingerprint_from_name_code (l_fingerprint)
						l_character_map := a_stylesheet.character_map (l_fingerprint)
						if l_character_map = Void then
							l_message := STRING_.concat ("No character-map named ", a_character_map)
							l_message := STRING_.appended_string (l_message, " has been defined.")
							report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XTSE1590", Static_error))
						else
							l_expanded_name := expanded_name_from_components (l_uri, l_local_name)
							if not a_used_character_maps.has (l_expanded_name) then
								a_expanded_names.put_last (l_expanded_name)
							end
						end
					end
				end
			end
		end

	no_compile_error_yet (a_character_map: STRING): BOOLEAN
			-- Have zero compile errors been reported?
			-- Dummy argument `a_character_map' is present only to satisfy the interface of `do_if'.
		do
			Result := not any_compile_errors
		ensure
			definition: Result = not any_compile_errors
		end

	report_compile_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Report a compile error.
		require
			validation_message_not_void: a_error /= Void
		deferred
		ensure
			compile_errors: any_compile_errors
		end

	any_compile_errors: BOOLEAN
			-- Have any compile errors been reported?
		deferred
		end

	uri_for_prefix (an_xml_prefix: STRING; use_default_namespace: BOOLEAN): detachable STRING
			-- URI for `an_xml_prefix' using the in-scope namespaces
		require
			prefix_not_void: an_xml_prefix /= Void
		deferred
		end

	principal_stylesheet: detachable XM_XSLT_STYLESHEET
			-- Top-level stylesheet
		deferred
		end

end
