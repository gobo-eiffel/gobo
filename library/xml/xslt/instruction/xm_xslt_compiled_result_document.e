indexing

	description:

		"Objects that represent compiled xsl:result-documents"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			namespace_resolver_not_void: a_format /= Void implies a_namespace_resolver /= Void
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
			todo ("display", False)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			an_attribute: XM_XPATH_EXPRESSION
		do
			content.simplify
			if content.was_expression_replaced then
				content := content.replacement_expression; adopt_child_expression (content)
			end
			if href /= Void then
				href.simplify
				if href.was_expression_replaced then
					href := href.replacement_expression; adopt_child_expression (href)
				end
			end
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_attribute := a_cursor.item
				an_attribute.simplify
				if an_attribute.was_expression_replaced then
					an_attribute := an_attribute.replacement_expression; adopt_child_expression (an_attribute)
					a_cursor.replace (an_attribute)
				end
				a_cursor.forth
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			an_attribute: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			content.check_static_type (a_context, a_context_item_type)
			if content.was_expression_replaced then
				content := content.replacement_expression; adopt_child_expression (content)
			end
			if href /= Void then
				href.check_static_type (a_context, a_context_item_type)
				if href.was_expression_replaced then
					href := href.replacement_expression; adopt_child_expression (href)
				end
			end
			if format /= Void then
				format.check_static_type (a_context, a_context_item_type)
				if format.was_expression_replaced then
					format := format.replacement_expression; adopt_child_expression (format)
				end
			end
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_attribute := a_cursor.item
				an_attribute.check_static_type (a_context, a_context_item_type)
				if an_attribute.was_expression_replaced then
					an_attribute := an_attribute.replacement_expression; adopt_child_expression (an_attribute)
					a_cursor.replace (an_attribute)
				end
				a_cursor.forth
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			an_attribute: XM_XPATH_EXPRESSION
		do
			content.optimize (a_context, a_context_item_type)
			if content.was_expression_replaced then
				content := content.replacement_expression; adopt_child_expression (content)
			end
			if href /= Void then
				href.optimize (a_context, a_context_item_type)
				if href.was_expression_replaced then
					href := href.replacement_expression; adopt_child_expression (href)
				end
			end
			if format /= Void then
				format.optimize (a_context, a_context_item_type)
				if format.was_expression_replaced then
					format := format.replacement_expression; adopt_child_expression (format)
				end
			end
			-- TODO: if `format' is a string literal, evaluate now
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_attribute := a_cursor.item
				an_attribute.optimize (a_context, a_context_item_type)
				if an_attribute.was_expression_replaced then
					an_attribute := an_attribute.replacement_expression; adopt_child_expression (an_attribute)
					a_cursor.replace (an_attribute)
				end
				a_cursor.forth
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			an_attribute: XM_XPATH_EXPRESSION
		do
			content.promote (an_offer)
			if content.was_expression_replaced then
				content := content.replacement_expression; adopt_child_expression (content)
				reset_static_properties
			end
			if href /= Void then
				href.promote (an_offer)
				if href.was_expression_replaced then
					href := href.replacement_expression; adopt_child_expression (href)
					reset_static_properties
				end
			end
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_attribute := a_cursor.item
				an_attribute.promote (an_offer)
				if an_attribute.was_expression_replaced then
					an_attribute := an_attribute.replacement_expression; adopt_child_expression (an_attribute)
					reset_static_properties
					a_cursor.replace (an_attribute)
				end
				a_cursor.forth
			end
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			an_output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			a_uri: UT_URI
			an_iri_reference,	a_uri_to_use: STRING
			an_error: XM_XPATH_ERROR_VALUE
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_tail_call := Void
			a_transformer := a_context.transformer
			a_new_context := a_context.new_minor_context
			if a_new_context.is_temporary_destination then
				create an_error.make_from_string ("Attempt to evaluate xsl:document while writing a temporary tree",
															 Xpath_errors_uri, "XTDE1480", Dynamic_error)
				an_error.set_location (system_id, line_number)
				a_transformer.report_fatal_error (an_error)
			else
				an_output_resolver := a_transformer.output_resolver
				if href = Void then
					a_result := a_transformer.principal_result
					if a_result.is_document_started then
						create an_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", a_transformer.principal_result_uri),
																	 Xpath_errors_uri, "XTDE1490", Dynamic_error)
						an_error.set_location (system_id, line_number)
						a_transformer.report_fatal_error (an_error)
					end
				else
					href.evaluate_as_string (a_context)
					if href.last_evaluated_string.is_error then
						href.last_evaluated_string.error_value.set_location (system_id, line_number)
						a_transformer.report_fatal_error (href.last_evaluated_string.error_value)
					else
						an_output_resolver := a_transformer.output_resolver
						create a_uri.make (a_transformer.principal_result_uri)
						an_iri_reference := escaped_uri (href.last_evaluated_string.string_value)
						create a_uri.make_resolve (a_uri, an_iri_reference)
						a_uri_to_use := a_uri.full_reference
						if a_context.available_documents.is_document_mapped (a_uri.full_uri) then
							create an_error.make_from_string (STRING_.concat ("Attempt to write to a URI that has already been read: ", a_uri_to_use),
																		 Xpath_errors_uri, "XTRE1500", Dynamic_error)
						elseif an_output_resolver.output_destinations.has (a_uri_to_use) then
							create an_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", a_uri_to_use),
																		 Xpath_errors_uri, "XTDE1490", Dynamic_error)
							an_error.set_location (system_id, line_number)
							a_transformer.report_fatal_error (an_error)
						else
							an_output_resolver.resolve (a_uri)
							a_result := an_output_resolver.last_result
							if a_result = Void then
								create an_error.make_from_string (an_output_resolver.error_message, Gexslt_eiffel_type_uri, "OUTPUT_RESOLVER_ERROR", Dynamic_error)
								an_error.set_location (system_id, line_number)
								a_transformer.report_fatal_error (an_error)
							else
								process_formatting_attributes (a_new_context, a_transformer)
							end
						end
					end
				end
			end
			if not a_transformer.is_error then
				-- TODO - next-in-chain processing
				a_new_context.change_output_destination (computed_property_set, a_result, True, validation_action, schema_type)
				a_receiver := a_new_context.current_receiver
				a_receiver.start_document
				content.process (a_new_context)
				a_receiver.end_document
				a_receiver.close
				an_output_resolver.close (a_result, computed_property_set)
				if a_result.error_message /= Void then
					a_transformer.report_warning (a_result.error_message, Void)
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
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
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
						a_cursor := formatting_attributes.new_cursor; a_cursor.start
					until
						a_cursor.after
					loop
						a_fingerprint := a_cursor.key
						an_expression := a_cursor.item
						an_expression.evaluate_as_string (a_context)
						a_value :=  an_expression.last_evaluated_string
						if a_value.is_error then
							a_value.error_value.set_location (system_id, line_number)
							a_transformer.report_fatal_error (a_value.error_value)
							a_cursor.go_after
						else
							computed_property_set.set_property (a_fingerprint, a_value.string_value, namespace_resolver)
							a_cursor.forth
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

