note

	description:

		"Objects that represent compiled xsl:result-documents"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_RESULT_DOCUMENT

inherit

	XM_XSLT_INSTRUCTION
		redefine
			promote_instruction, item_type, sub_expressions
		end

	XM_XSLT_VALIDATION

	KL_SHARED_PLATFORM
		export {NONE} all end
		
	UT_URL_ENCODING
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_global_property_set, a_local_property_set: XM_XSLT_OUTPUT_PROPERTIES; an_href, a_format: XM_XPATH_EXPRESSION;
			a_base_uri: STRING; a_validation_action: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE;
			some_formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER];
			a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER; a_content: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			global_property_set_not_void: a_global_property_set /= Void
			local_property_set_not_void: a_local_property_set /= Void
			base_uri: a_base_uri /= Void
			only_basic_xslt_as_yet: a_validation_action = Validation_strip
			no_schema_type_as_yet: a_schema_type = Void
			formatting_attributes_not_void: some_formatting_attributes /= Void
			content_not_void: a_content /= Void
			namespace_resolver_not_void: a_namespace_resolver /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
		do
			executable := an_executable
			base_uri := a_base_uri
			global_property_set := a_global_property_set
			local_property_set := a_local_property_set
			href := an_href; if href /= Void then adopt_child_expression (href) end
			validation_action := a_validation_action
			schema_type := a_schema_type
			formatting_attributes := some_formatting_attributes
			namespace_resolver := a_namespace_resolver
			content := a_content; adopt_child_expression (content)
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
			format := a_format
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			base_uri_set: base_uri = a_base_uri
			global_output_properties_set: global_property_set = a_global_property_set
			local_output_properties_set: local_property_set = a_local_property_set
			href_set: href = an_href
			validation_action_set: validation_action = a_validation_action
			schema_type_set: schema_type = a_schema_type
			formatting_attributes_set: formatting_attributes = some_formatting_attributes
			namespace_resolver_set: namespace_resolver = a_namespace_resolver
			content_set: content = a_content
			format_set: format = a_format
		end

feature -- Access
	
	global_property_set: XM_XSLT_OUTPUT_PROPERTIES
			-- Global output properties

	local_property_set: XM_XSLT_OUTPUT_PROPERTIES
			-- Local output properties

	href: XM_XPATH_EXPRESSION
			--	Optional URI for output destination

	base_uri: STRING
			-- Base URI

	http_method: STRING
			-- Value of gexslt:method extension attribute;
			-- Intended principally for http protocol, but value is unchecked here.

	validation_action: INTEGER
			-- Validation_action

	schema_type: XM_XPATH_SCHEMA_TYPE
			-- Schema type

	formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- Overrides of xsl:output attributes

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Optional namespace resolver

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := empty_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
		do
			create Result.make (2 + formatting_attributes.count)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
			if href /= Void then Result.put (href, 2) end
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				Result.put_last (a_cursor.item)
				a_cursor.forth
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "xsl:result-document"))
			std.error.put_new_line
			content.display (a_level + 1)
		end

feature -- Setting

	set_http_method (a_method: like http_method) is
			-- Set `http_method' to `a_method'.
		require
			a_method_not_void: a_method /= Void
		do
			http_method := a_method
		ensure
			http_method_set: http_method = a_method
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.simplify (l_replacement)
			set_content (l_replacement.item)
			if content.is_error then
				set_replacement (a_replacement, content)
			else
				if href /= Void then
					l_replacement.put (Void)
					href.simplify (l_replacement)
					set_href (l_replacement.item)
					if href.is_error then
						set_replacement (a_replacement, href)
					end
				end
				if a_replacement.item = Void and format /= Void then
					l_replacement.put (Void)
					format.simplify (l_replacement)
					set_format (l_replacement.item)
					if format.is_error then
						set_replacement (a_replacement, format)
					end
				end
				if a_replacement.item = Void then
					a_replacement.put (Current)
					from
						l_cursor := formatting_attributes.new_cursor
						l_cursor.start
					until
						l_cursor.after
					loop
						l_attribute := l_cursor.item
						l_replacement.put (Void)
						l_attribute.simplify (l_replacement)
						if l_attribute /= l_replacement.item then
							l_attribute := l_replacement.item
							adopt_child_expression (l_attribute)
							l_cursor.replace (l_attribute)
							reset_static_properties
						end
						l_cursor.forth
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.check_static_type (l_replacement, a_context, a_context_item_type)
			set_content (l_replacement.item)
			if content.is_error then
				set_replacement (a_replacement, content)
			elseif href /= Void then
				l_replacement.put (Void)
				href.check_static_type (l_replacement, a_context, a_context_item_type)
				set_href (l_replacement.item)
				if href.is_error then
					set_replacement (a_replacement, href)
				end
			end
			if a_replacement.item = Void and format /= Void then
				l_replacement.put (Void)
				format.check_static_type (l_replacement, a_context, a_context_item_type)
				set_format (l_replacement.item)
				if format.is_error then
					set_replacement (a_replacement, format)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
				from
					l_cursor := formatting_attributes.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_attribute := l_cursor.item
					l_replacement.put (Void)
					l_attribute.check_static_type (l_replacement, a_context, a_context_item_type)
					if l_attribute /= l_replacement.item then
						l_attribute := l_replacement.item
						adopt_child_expression (l_attribute)
						l_cursor.replace (l_attribute)
						reset_static_properties
					end
					l_cursor.forth
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.optimize (l_replacement, a_context, a_context_item_type)
			set_content (l_replacement.item)
			if content.is_error then
				set_replacement (a_replacement, content)
			elseif href /= Void then
				l_replacement.put (Void)
				href.optimize (l_replacement, a_context, a_context_item_type)
				set_href (l_replacement.item)
				if href.is_error then
					set_replacement (a_replacement, href)
				end
			end
			if a_replacement.item = Void and format /= Void then
				l_replacement.put (Void)
				format.optimize (l_replacement, a_context, a_context_item_type)
				set_format (l_replacement.item)
				if format.is_error then
					set_replacement (a_replacement, format)
				end
			end
			-- TODO: if `format' is a string literal, evaluate now
			if a_replacement.item = Void then
				a_replacement.put (Current)
				from
					l_cursor := formatting_attributes.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_attribute := l_cursor.item
					l_replacement.put (Void)
					l_attribute.optimize (l_replacement, a_context, a_context_item_type)
					if l_attribute /= l_replacement.item then
						l_attribute := l_replacement.item
						adopt_child_expression (l_attribute)
						l_cursor.replace (l_attribute)
						reset_static_properties
					end
					l_cursor.forth
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			content.promote (l_replacement, a_offer)
			set_content (l_replacement.item)
			if href /= Void then
				l_replacement.put (Void)
				href.promote (l_replacement, a_offer)
				set_href (l_replacement.item)
			end
			from
				l_cursor := formatting_attributes.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_attribute := l_cursor.item
				l_replacement.put (Void)
				l_attribute.promote (l_replacement, a_offer)
				if l_attribute /= l_replacement.item then
					l_attribute := l_replacement.item
					adopt_child_expression (l_attribute)
					l_cursor.replace (l_attribute)
					reset_static_properties
				end
				l_cursor.forth
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			l_receiver: XM_XPATH_SEQUENCE_RECEIVER
			l_uri: UT_URI
			l_iri_reference,	l_uri_to_use: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_response: KI_CHARACTER_INPUT_STREAM
		do
			l_transformer := a_context.transformer
			l_new_context := a_context.new_minor_context
			if l_new_context.is_temporary_destination then
				create l_error.make_from_string ("Attempt to evaluate xsl:document while writing a temporary tree",
															 Xpath_errors_uri, "XTDE1480", Dynamic_error)
				l_error.set_location (system_id, line_number)
				l_transformer.report_fatal_error (l_error)
			else
				l_output_resolver := l_transformer.output_resolver
				if http_method /= Void then
					l_output_resolver.set_http_method (http_method)
				end
				if href = Void then
					l_result := l_transformer.principal_result
					if l_result.is_document_started then
						create l_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", l_transformer.principal_result_uri),
																	 Xpath_errors_uri, "XTDE1490", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					else
						l_transformer.discard_principal_emitter
						process_formatting_attributes (l_new_context, l_transformer)
					end
				else
					href.evaluate_as_string (a_context)
					if href.last_evaluated_string.is_error then
						href.last_evaluated_string.error_value.set_location (system_id, line_number)
						l_transformer.report_fatal_error (href.last_evaluated_string.error_value)
					else
						create l_uri.make (l_transformer.principal_result_uri)
						l_iri_reference := escaped_uri (href.last_evaluated_string.string_value)
						create l_uri.make_resolve (l_uri, l_iri_reference)
						l_uri_to_use := l_uri.full_reference
						if a_context.available_documents.is_document_mapped (l_uri.full_uri) then
							create l_error.make_from_string (STRING_.concat ("Attempt to write to a URI that has already been read: ", l_uri_to_use),
							Xpath_errors_uri, "XTRE1500", Dynamic_error)
							l_error.set_location (system_id, line_number)
							l_transformer.report_fatal_error (l_error)
						elseif (l_transformer.principal_result.is_document_started and STRING_.same_string (l_transformer.principal_result_uri, l_uri_to_use)) or l_output_resolver.output_destinations.has (l_uri_to_use) then
							create l_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", l_uri_to_use),
																		 Xpath_errors_uri, "XTDE1490", Dynamic_error)
							l_error.set_location (system_id, line_number)
							l_transformer.report_fatal_error (l_error)
						else
							l_output_resolver.resolve (l_uri)
							l_result := l_output_resolver.last_result
							if l_result = Void then
								create l_error.make_from_string (l_output_resolver.error_message, Gexslt_eiffel_type_uri, "OUTPUT_RESOLVER_ERROR", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error)
							else
								if STRING_.same_string (l_transformer.principal_result_uri, l_uri_to_use) then
									l_transformer.discard_principal_emitter
								end
								process_formatting_attributes (l_new_context, l_transformer)
							end
						end
					end
				end
			end
			if not l_transformer.is_error then
				-- TODO - next-in-chain processing
				l_new_context.change_output_destination (computed_property_set, l_result, True, validation_action, schema_type)
				l_receiver := l_new_context.current_receiver
				l_receiver.start_document
				content.generate_events (l_new_context)
				l_receiver.end_document
				l_receiver.close
				l_output_resolver.close (l_result, computed_property_set)
				if l_result.error_message /= Void then
					l_transformer.report_warning (l_result.error_message, Void)
				elseif l_result.response_stream /= Void and l_uri /= Void then
					l_response := l_result.response_stream
					if l_response.is_open_read then
						l_transformer.set_response_stream (l_response, l_uri.full_reference)
					end
				end
			end
		end

feature {NONE} -- Implementation

	content: XM_XPATH_EXPRESSION
			-- Sequence constructor

	format: XM_XPATH_EXPRESSION
			-- Format attribute if not known at compile time

	computed_property_set: XM_XSLT_OUTPUT_PROPERTIES
			-- Merged and computed output properties

	set_content (a_content: XM_XPATH_EXPRESSION) is
			-- Ensure `content' = `a_content'.
		do
			if content /= a_content then
				content := a_content
				if content /= Void then
					adopt_child_expression (content)
					reset_static_properties
				end
			end
		ensure
			set: content = a_content
		end

	set_href (a_href: XM_XPATH_EXPRESSION) is
			-- Ensure `href' = `a_href'.
		do
			if href /= a_href then
				href := a_href
				if href /= Void then
					adopt_child_expression (href)
					reset_static_properties
				end
			end
		ensure
			set: href = a_href
		end

	set_format (a_format: XM_XPATH_EXPRESSION) is
			-- Ensure `format' = `a_format'.
		do
			if format /= a_format then
				format := a_format
				if format /= Void then
					adopt_child_expression (format)
					reset_static_properties
				end
			end
		ensure
			set: format = a_format
		end

	process_format_attribute (a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Evaluate and process `format'.
		require
			format_not_void: format /= Void
			context_not_void: a_context /= Void
			transformer_not_void: a_transformer /= Void
			no_previous_error: not a_transformer.is_error
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_parser: XM_XPATH_QNAME_PARSER
			a_uri: STRING
			a_fingerprint: INTEGER
		do
			format.evaluate_as_string (a_context)
			if format.last_evaluated_string.is_error then
				create an_error.make_from_string (STRING_.concat ("Error evaluating 'format' attribute at runtime. Error text was: ", format.last_evaluated_string.error_value.error_message) ,
															 Xpath_errors_uri, "XTDE1460", Dynamic_error)
				a_transformer.report_fatal_error (an_error)
			else
				create a_parser.make (format.last_evaluated_string.string_value)
				if not a_parser.is_valid then
					create an_error.make_from_string ("'format' attribute does not evaluate to a lexical QName",
																 Xpath_errors_uri, "XTDE1460", Dynamic_error)
					a_transformer.report_fatal_error (an_error)
				else
					a_uri := namespace_resolver.uri_for_defaulted_prefix (a_parser.optional_prefix, False)
					if a_uri = Void then
						create an_error.make_from_string ("The evaluated prefix in the 'format' attribute is undeclared",
																	 Xpath_errors_uri, "XTDE1460", Dynamic_error)
						a_transformer.report_fatal_error (an_error)
					else
						if shared_name_pool.is_name_code_allocated (a_parser.optional_prefix, a_uri, a_parser.local_name) then
							a_fingerprint := shared_name_pool.fingerprint (a_uri, a_parser.local_name)
						else
							shared_name_pool.allocate_name (a_parser.optional_prefix, a_uri, a_parser.local_name)
							a_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
						end
						if executable.has_output_properties (a_fingerprint) then
							computed_property_set := executable.output_properties (a_fingerprint)
						else
							create an_error.make_from_string (STRING_.concat ("Thre is no output definition named ", format.last_evaluated_string.string_value),
																		 Xpath_errors_uri, "XTDE1460", Dynamic_error)
							a_transformer.report_fatal_error (an_error)
						end
					end
				end
			end
		ensure
			error_or_computed_property_set_not_void: not a_transformer.is_error implies computed_property_set /= Void
		end

	process_formatting_attributes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Merge formatting attributes from xsl:output and xsl:result-document (both static and AVTs).
		require
			context_not_void: a_context /= Void
			transformer_not_void: a_transformer /= Void
			no_previous_error: not a_transformer.is_error
		local
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			a_fingerprint: INTEGER
			an_expression: XM_XPATH_EXPRESSION
			a_value: XM_XPATH_STRING_VALUE
		do			
			if format /= Void then
				process_format_attribute (a_context, a_transformer)
			else
				computed_property_set := global_property_set.another			
			end
			if not a_transformer.is_error then
				merge_local_properties
				if formatting_attributes.count > 0 then
					-- AVT local properties
					from
						l_cursor := formatting_attributes.new_cursor; l_cursor.start
					until
						l_cursor.after
					loop
						a_fingerprint := l_cursor.key
						an_expression := l_cursor.item
						an_expression.evaluate_as_string (a_context)
						a_value :=  an_expression.last_evaluated_string
						if a_value.is_error then
							a_value.error_value.set_location (system_id, line_number)
							a_transformer.report_fatal_error (a_value.error_value)
							l_cursor.go_after
						else
							computed_property_set.set_property (a_fingerprint, a_value.string_value, namespace_resolver)
							l_cursor.forth
						end
					end
				end
			end
		ensure
			error_or_computed_property_set_not_void: not a_transformer.is_error implies computed_property_set /= Void
		end

	merge_local_properties is
			-- Merge `local_property_set' into `computed_property_set'.
		require
			computed_property_set_not_void: computed_property_set /= Void
		do
			if not local_property_set.method.is_empty then
				computed_property_set.set_method (local_property_set.method, Platform.Maximum_integer - 3)
			end
			if not local_property_set.is_default_version then
				computed_property_set.set_version (local_property_set.version, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_encoding_set then
				computed_property_set.set_encoding (local_property_set.encoding, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_byte_order_mark_set then
				computed_property_set.set_byte_order_mark_required (local_property_set.byte_order_mark_required, Platform.Maximum_integer - 3)
			end
			computed_property_set.merge_cdata_sections (local_property_set.cdata_section_elements)
			if local_property_set.doctype_public /= Void then
				computed_property_set.set_doctype_public (local_property_set.doctype_public, Platform.Maximum_integer - 3)
			end
			if local_property_set.doctype_system /= Void then
				computed_property_set.set_doctype_system (local_property_set.doctype_system, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_escape_uri_attributes_set then
				computed_property_set.set_escape_uri_attributes (local_property_set.escape_uri_attributes, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_include_content_type_set then
				computed_property_set.set_include_content_type (local_property_set.include_content_type, Platform.Maximum_integer - 3)
			end
			if not local_property_set.is_default_indent then
				computed_property_set.set_indent (local_property_set.indent, Platform.Maximum_integer - 3)
			end
			if not local_property_set.is_default_media_type then
				computed_property_set.set_media_type (local_property_set.media_type, Platform.Maximum_integer - 3)
			end
			if local_property_set.normalization_form /= Void then
				computed_property_set.set_normalization_form (local_property_set.normalization_form, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_omit_xml_declaration_set then
				computed_property_set.set_omit_xml_declaration (local_property_set.omit_xml_declaration, Platform.Maximum_integer - 3)
			end
			if local_property_set.is_standalone_set then
				if local_property_set.standalone = Void then
					computed_property_set.set_standalone ("omit", Platform.Maximum_integer - 3)
				else
					computed_property_set.set_standalone (local_property_set.standalone, Platform.Maximum_integer - 3)
				end
			end
			if local_property_set.is_undeclare_prefixes_set then
				computed_property_set.set_undeclare_prefixes (local_property_set.undeclare_prefixes, Platform.Maximum_integer - 3)
			end
			computed_property_set.merge_character_maps (local_property_set.used_character_maps)
		end

	escaped_uri (a_uri_string: STRING): STRING is
			-- Escaped version of `a_uri_string'
		require
			uri_string_not_void: a_uri_string /= Void
		do
			Result := escape_custom (utf8.to_utf8 (a_uri_string), unescaped_iri_characters, False)
		ensure
			escaped_uri_not_void: Result /= Void
		end

	unescaped_iri_characters: DS_HASH_SET [CHARACTER] is
			-- Characters not to escaped for fn:iri-to-uri()
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_extra_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			a_character_set := STRING_.appended_string (a_character_set, "%%")
			Result := new_character_set (a_character_set)
		end

invariant

	base_uri: initialized implies base_uri /= Void
	global_property_set_not_void: initialized implies global_property_set /= Void
	local_property_set_not_void: initialized implies local_property_set /= Void
	only_basic_xslt_as_yet: initialized implies validation_action = Validation_strip
	no_schema_type_as_yet: initialized implies schema_type = Void
	formatting_attributes_not_void: initialized implies formatting_attributes /= Void
	content_not_void: initialized implies content /= Void
	namespace_resolver_not_void: format /= Void implies namespace_resolver /= Void

end

