note

	description:

		"Objects that represent compiled xsl:result-documents"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2021, Colin Adams and others"
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

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_URL_ENCODING
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_global_property_set, a_local_property_set: XM_XSLT_OUTPUT_PROPERTIES; an_href: detachable XM_XPATH_EXPRESSION; a_format: detachable XM_XPATH_EXPRESSION;
			a_base_uri: STRING; a_validation_action: INTEGER; a_schema_type: detachable XM_XPATH_SCHEMA_TYPE;
			some_formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER];
			a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER; a_content: XM_XPATH_EXPRESSION)
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
			href := an_href
			validation_action := a_validation_action
			schema_type := a_schema_type
			formatting_attributes := some_formatting_attributes
			namespace_resolver := a_namespace_resolver
			content := a_content
			format := a_format
			if attached href as l_href then
				adopt_child_expression (l_href)
			end
			adopt_child_expression (content)
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
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

	href: detachable XM_XPATH_EXPRESSION
			--	Optional URI for output destination

	base_uri: STRING
			-- Base URI

	http_method: detachable STRING
			-- Value of gexslt:method extension attribute;
			-- Intended principally for http protocol, but value is unchecked here.

	validation_action: INTEGER
			-- Validation_action

	schema_type: detachable XM_XPATH_SCHEMA_TYPE
			-- Schema type

	formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- Overrides of xsl:output attributes

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Optional namespace resolver

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := empty_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
		do
			create Result.make (2 + formatting_attributes.count)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
			if attached href as l_href then Result.put (l_href, 2) end
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

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "xsl:result-document"))
			std.error.put_new_line
			content.display (a_level + 1)
		end

feature -- Setting

	set_http_method (a_method: like http_method)
			-- Set `http_method' to `a_method'.
		require
			a_method_not_void: a_method /= Void
		do
			http_method := a_method
		ensure
			http_method_set: http_method = a_method
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_content (l_replacement_item)
			end
			if content.is_error then
				set_replacement (a_replacement, content)
			else
				if attached href as l_href then
					l_replacement.put (Void)
					l_href.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_new_href then
						set_href (l_new_href)
						if l_new_href.is_error then
							set_replacement (a_replacement, l_new_href)
						end
					end
				end
				if a_replacement.item = Void and attached format as l_format then
					l_replacement.put (Void)
					l_format.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_new_format then
						set_format (l_new_format)
						if l_new_format.is_error then
							set_replacement (a_replacement, l_new_format)
						end
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
						check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
							if l_attribute /= l_replacement_item then
								l_attribute := l_replacement_item
								adopt_child_expression (l_attribute)
								l_cursor.replace (l_attribute)
								reset_static_properties
							end
						end
						l_cursor.forth
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_content (l_replacement_item)
			end
			if content.is_error then
				set_replacement (a_replacement, content)
			elseif attached href as l_href then
				l_replacement.put (Void)
				l_href.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_href then
					set_href (l_new_href)
					if l_new_href.is_error then
						set_replacement (a_replacement, l_new_href)
					end
				end
			end
			if a_replacement.item = Void and attached format as l_format then
				l_replacement.put (Void)
				l_format.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_format then
					set_format (l_new_format)
					if l_new_format.is_error then
						set_replacement (a_replacement, l_new_format)
					end
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
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
						if l_attribute /= l_replacement_item then
							l_attribute := l_replacement_item
							adopt_child_expression (l_attribute)
							l_cursor.replace (l_attribute)
							reset_static_properties
						end
					end
					l_cursor.forth
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
		do
			create l_replacement.make (Void)
			content.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				set_content (l_replacement_item)
			end
			if content.is_error then
				set_replacement (a_replacement, content)
			elseif attached href as l_href then
				l_replacement.put (Void)
				l_href.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_href then
					set_href (l_new_href)
					if l_new_href.is_error then
						set_replacement (a_replacement, l_new_href)
					end
				end
			end
			if a_replacement.item = Void and attached format as l_format then
				l_replacement.put (Void)
				l_format.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_format then
					set_format (l_new_format)
					if l_new_format.is_error then
						set_replacement (a_replacement, l_new_format)
					end
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
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						if l_attribute /= l_replacement_item then
							l_attribute := l_replacement_item
							adopt_child_expression (l_attribute)
							l_cursor.replace (l_attribute)
							reset_static_properties
						end
					end
					l_cursor.forth
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_attribute: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			content.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_content (l_replacement_item)
			end
			if attached href as l_href then
				l_replacement.put (Void)
				l_href.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_href (l_replacement_item)
				end
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
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if l_attribute /= l_replacement_item then
						l_attribute := l_replacement_item
						adopt_child_expression (l_attribute)
						l_cursor.replace (l_attribute)
						reset_static_properties
					end
				end
				l_cursor.forth
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_result: detachable XM_XSLT_TRANSFORMATION_RESULT
			l_output_resolver: detachable XM_XSLT_OUTPUT_URI_RESOLVER
			l_receiver: XM_XPATH_SEQUENCE_RECEIVER
			l_uri: detachable UT_URI
			l_iri_reference, l_uri_to_use: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_response: KI_CHARACTER_INPUT_STREAM
			l_cwd: KI_PATHNAME
		do
			check attached a_context.transformer as l_context_transformer then
				l_transformer := l_context_transformer
				l_new_context := a_context.new_minor_context
				if l_new_context.is_temporary_destination then
					create l_error.make_from_string ("Attempt to evaluate xsl:document while writing a temporary tree",
																 Xpath_errors_uri, "XTDE1480", Dynamic_error)
					l_error.set_location (system_id, line_number)
					l_transformer.report_fatal_error (l_error)
				else
					l_output_resolver := l_transformer.output_resolver
					if attached http_method as l_http_method then
						l_output_resolver.set_http_method (l_http_method)
					end
					if not attached href as l_href then
						check attached l_transformer.principal_result as l_principal_result then
							l_result := l_principal_result
						end
						if l_result.is_document_started then
							check attached l_transformer.principal_result_uri as l_principal_result_uri then
								create l_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", l_principal_result_uri),
																		 Xpath_errors_uri, "XTDE1490", Dynamic_error)
							end
							l_error.set_location (system_id, line_number)
							l_transformer.report_fatal_error (l_error)
						else
							l_transformer.discard_principal_emitter
							process_formatting_attributes (l_new_context, l_transformer)
						end
					else
						l_href.evaluate_as_string (a_context)
						check postcondition_of_evaluate_as_string: attached l_href.last_evaluated_string as l_href_last_evaluated_string then
							if attached l_href_last_evaluated_string.error_value as l_error_value then
								check is_error: l_href_last_evaluated_string.is_error end
								l_error_value.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error_value)
							else
								check
									attached l_transformer.principal_result_uri as l_principal_result_uri
									attached l_transformer.principal_result as l_principal_result
								then
									l_iri_reference := escaped_uri (l_href_last_evaluated_string.string_value)
									if STRING_.same_string (l_principal_result_uri, "stdout:") then
											-- Use the current working directory as base uri
											-- when the principal output is stdout.
										l_cwd := file_system.string_to_pathname (file_system.current_working_directory)
										l_uri := file_uri.pathname_to_uri (l_cwd)
									else
										create l_uri.make (l_principal_result_uri)
									end
									create l_uri.make_resolve (l_uri, l_iri_reference)
									l_uri_to_use := l_uri.full_reference
									check attached a_context.available_documents as l_context_available_documents then
										if l_context_available_documents.is_document_mapped (l_uri.full_uri) then
											create l_error.make_from_string (STRING_.concat ("Attempt to write to a URI that has already been read: ", l_uri_to_use),
											Xpath_errors_uri, "XTRE1500", Dynamic_error)
											l_error.set_location (system_id, line_number)
											l_transformer.report_fatal_error (l_error)
										elseif (l_principal_result.is_document_started and STRING_.same_string (l_principal_result_uri, l_uri_to_use)) or l_output_resolver.output_destinations.has (l_uri_to_use) then
											create l_error.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", l_uri_to_use),
																						 Xpath_errors_uri, "XTDE1490", Dynamic_error)
											l_error.set_location (system_id, line_number)
											l_transformer.report_fatal_error (l_error)
										else
											l_output_resolver.resolve (l_uri)
											l_result := l_output_resolver.last_result
											if l_result = Void then
												check attached l_output_resolver.error_message as l_output_resolver_error_message then
													create l_error.make_from_string (l_output_resolver_error_message, Gexslt_eiffel_type_uri, "OUTPUT_RESOLVER_ERROR", Dynamic_error)
													l_error.set_location (system_id, line_number)
													l_transformer.report_fatal_error (l_error)
												end
											else
												if STRING_.same_string (l_principal_result_uri, l_uri_to_use) then
													l_transformer.discard_principal_emitter
												end
												process_formatting_attributes (l_new_context, l_transformer)
											end
										end
									end
								end
							end
						end
					end
				end
				if not l_transformer.is_error then
					-- TODO - next-in-chain processing
					check
						l_result /= Void
						l_output_resolver /= Void
					then
						l_new_context.change_output_destination (computed_property_set, l_result, True, validation_action, schema_type)
						check attached l_new_context.current_receiver as l_new_context_current_receiver then
							l_receiver := l_new_context_current_receiver
							l_receiver.start_document
							content.generate_events (l_new_context)
							l_receiver.end_document
							l_receiver.close
							check attached computed_property_set as l_computed_property_set then
								l_output_resolver.close (l_result, l_computed_property_set)
							end
							if attached l_result.error_message as l_result_error_message then
								l_transformer.report_warning (l_result_error_message, Void)
							elseif attached l_result.response_stream as l_result_response_stream and l_uri /= Void then
								l_response := l_result_response_stream
								if l_response.is_open_read then
									l_transformer.set_response_stream (l_response, l_uri.full_reference)
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	content: XM_XPATH_EXPRESSION
			-- Sequence constructor

	format: detachable XM_XPATH_EXPRESSION
			-- Format attribute if not known at compile time

	computed_property_set: detachable XM_XSLT_OUTPUT_PROPERTIES
			-- Merged and computed output properties

	set_content (a_content: XM_XPATH_EXPRESSION)
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

	set_href (a_href: detachable XM_XPATH_EXPRESSION)
			-- Ensure `href' = `a_href'.
		do
			if href /= a_href then
				href := a_href
				if a_href /= Void then
					adopt_child_expression (a_href)
					reset_static_properties
				end
			end
		ensure
			set: href = a_href
		end

	set_format (a_format: XM_XPATH_EXPRESSION)
			-- Ensure `format' = `a_format'.
		do
			if format /= a_format then
				format := a_format
				if attached format as l_format then
					adopt_child_expression (l_format)
					reset_static_properties
				end
			end
		ensure
			set: format = a_format
		end

	process_format_attribute (a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER)
			-- Evaluate and process `format'.
		require
			format_not_void: format /= Void
			context_not_void: a_context /= Void
			transformer_not_void: a_transformer /= Void
			no_previous_error: not a_transformer.is_error
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_parser: XM_XPATH_QNAME_PARSER
			a_uri: detachable STRING
			a_fingerprint: INTEGER
		do
			check precondition_format_not_void: attached format as l_format then
				l_format.evaluate_as_string (a_context)
				check postcondition_of_evaluate_as_string: attached l_format.last_evaluated_string as l_format_last_evaluated_string then
					if attached l_format_last_evaluated_string.error_value as l_error_value then
						check is_error: l_format_last_evaluated_string.is_error end
						create an_error.make_from_string (STRING_.concat ("Error evaluating 'format' attribute at runtime. Error text was: ", l_error_value.error_message),
																	 Xpath_errors_uri, "XTDE1460", Dynamic_error)
						a_transformer.report_fatal_error (an_error)
					else
						create a_parser.make (l_format_last_evaluated_string.string_value)
						if not a_parser.is_valid then
							create an_error.make_from_string ("'format' attribute does not evaluate to a lexical QName",
																		 Xpath_errors_uri, "XTDE1460", Dynamic_error)
							a_transformer.report_fatal_error (an_error)
						else
							check
								a_parser_is_valid: attached a_parser.optional_prefix as l_optional_prefix
								a_parser_is_valid_2: attached a_parser.local_name as l_local_name
							then
								a_uri := namespace_resolver.uri_for_defaulted_prefix (l_optional_prefix, False)
								if a_uri = Void then
									create an_error.make_from_string ("The evaluated prefix in the 'format' attribute is undeclared",
																				 Xpath_errors_uri, "XTDE1460", Dynamic_error)
									a_transformer.report_fatal_error (an_error)
								else
									if shared_name_pool.is_name_code_allocated (l_optional_prefix, a_uri, l_local_name) then
										a_fingerprint := shared_name_pool.fingerprint (a_uri, l_local_name)
									else
										shared_name_pool.allocate_name (l_optional_prefix, a_uri, l_local_name)
										a_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
									end
									if executable.has_output_properties (a_fingerprint) then
										computed_property_set := executable.output_properties (a_fingerprint)
									else
										create an_error.make_from_string (STRING_.concat ("Thre is no output definition named ", l_format_last_evaluated_string.string_value),
																					 Xpath_errors_uri, "XTDE1460", Dynamic_error)
										a_transformer.report_fatal_error (an_error)
									end
								end
							end
						end
					end
				end
			end
		ensure
			error_or_computed_property_set_not_void: not a_transformer.is_error implies computed_property_set /= Void
		end

	process_formatting_attributes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_transformer: XM_XSLT_TRANSFORMER)
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
						check postcondition_of_evaluate_as_string: attached an_expression.last_evaluated_string as l_last_evaluated_string then
							a_value := l_last_evaluated_string
							if attached a_value.error_value as l_error_value then
								check is_error: a_value.is_error end
								l_error_value.set_location (system_id, line_number)
								a_transformer.report_fatal_error (l_error_value)
								l_cursor.go_after
							else
								check attached computed_property_set as l_computed_property_set then
									l_computed_property_set.set_property (a_fingerprint, a_value.string_value, namespace_resolver)
								end
								l_cursor.forth
							end
						end
					end
				end
			end
		ensure
			error_or_computed_property_set_not_void: not a_transformer.is_error implies computed_property_set /= Void
		end

	merge_local_properties
			-- Merge `local_property_set' into `computed_property_set'.
		require
			computed_property_set_not_void: computed_property_set /= Void
		do
			check precondition_computed_property_set_not_void: attached computed_property_set as l_computed_property_set then
				if not local_property_set.method.is_empty then
					l_computed_property_set.set_method (local_property_set.method, Platform.Maximum_integer - 3)
				end
				if not local_property_set.is_default_version then
					l_computed_property_set.set_version (local_property_set.version, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_encoding_set then
					l_computed_property_set.set_encoding (local_property_set.encoding, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_byte_order_mark_set then
					l_computed_property_set.set_byte_order_mark_required (local_property_set.byte_order_mark_required, Platform.Maximum_integer - 3)
				end
				l_computed_property_set.merge_cdata_sections (local_property_set.cdata_section_elements)
				if attached local_property_set.doctype_public as l_local_property_set_doctype_public then
					l_computed_property_set.set_doctype_public (l_local_property_set_doctype_public, Platform.Maximum_integer - 3)
				end
				if attached local_property_set.doctype_system as l_local_property_set_doctype_system then
					l_computed_property_set.set_doctype_system (l_local_property_set_doctype_system, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_escape_uri_attributes_set then
					l_computed_property_set.set_escape_uri_attributes (local_property_set.escape_uri_attributes, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_include_content_type_set then
					l_computed_property_set.set_include_content_type (local_property_set.include_content_type, Platform.Maximum_integer - 3)
				end
				if not local_property_set.is_default_indent then
					l_computed_property_set.set_indent (local_property_set.indent, Platform.Maximum_integer - 3)
				end
				if not local_property_set.is_default_media_type then
					l_computed_property_set.set_media_type (local_property_set.media_type, Platform.Maximum_integer - 3)
				end
				if attached local_property_set.normalization_form as l_local_property_set_normalization_form then
					l_computed_property_set.set_normalization_form (l_local_property_set_normalization_form, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_omit_xml_declaration_set then
					l_computed_property_set.set_omit_xml_declaration (local_property_set.omit_xml_declaration, Platform.Maximum_integer - 3)
				end
				if local_property_set.is_standalone_set then
					if not attached local_property_set.standalone as l_local_property_set_standalone then
						l_computed_property_set.set_standalone ("omit", Platform.Maximum_integer - 3)
					else
						l_computed_property_set.set_standalone (l_local_property_set_standalone, Platform.Maximum_integer - 3)
					end
				end
				if local_property_set.is_undeclare_prefixes_set then
					l_computed_property_set.set_undeclare_prefixes (local_property_set.undeclare_prefixes, Platform.Maximum_integer - 3)
				end
				l_computed_property_set.merge_character_maps (local_property_set.used_character_maps)
			end
		end

	escaped_uri (a_uri_string: STRING): STRING
			-- Escaped version of `a_uri_string'
		require
			uri_string_not_void: a_uri_string /= Void
		do
			Result := escape_custom (utf8.to_utf8 (a_uri_string), unescaped_iri_characters, False)
		ensure
			escaped_uri_not_void: Result /= Void
		end

	unescaped_iri_characters: DS_HASH_SET [CHARACTER]
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

