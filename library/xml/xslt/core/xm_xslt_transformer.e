indexing

	description:

		"XSLT transformers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMER

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_TRANSFORMER

	XM_XSLT_SERIALIZER
	
	XM_XPATH_NAME_UTILITIES

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XSLT_VALIDATION

	DT_SHARED_SYSTEM_CLOCK
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	XM_XSLT_SHARED_EMITTER_FACTORY
		export {NONE} all end

	XM_XSLT_TEMPLATE_ROUTINES
		export {NONE} all end

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_configuration: like configuration; a_executable: like executable; a_factory: like transformer_factory) is
			-- Establish invariant.
		require
			a_configuration_not_void: a_configuration /= Void
			a_executable_not_void: a_executable /= Void
			a_factory_not_void: a_factory /= Void
		local
			l_date_time: DT_DATE_TIME
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			transformer_factory := a_factory
			configuration := a_configuration
			output_resolver := a_configuration.output_resolver
			error_listener := configuration.error_listener
			executable := a_executable
			rule_manager := executable.rule_manager
			decimal_format_manager := executable.decimal_format_manager
			clear_document_pool
			initial_mode := -1
			recovery_policy := Recover_with_warnings
			create parser_factory
			create user_data_table.make_default
			create l_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (l_date_time)
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			create l_time_zone.make (implicit_timezone.fixed_offset)
			create current_date_time.make (l_date_time, l_time_zone)
			create remembered_numbers.make_default
			create response_streams.make_with_equality_testers (7, Void, string_equality_tester)
		ensure
			configuration_set: configuration = a_configuration
			executable_set: executable = a_executable
			transformer_factory_set: transformer_factory = a_factory
		end

feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	configuration: XM_XSLT_CONFIGURATION
			-- User-selectable configuration parameters

	transformer_factory: XM_XSLT_TRANSFORMER_FACTORY
			-- Transformer factory

	current_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME

	key_manager: XM_XSLT_KEY_MANAGER is
			-- Key manager
		do
			Result := executable.key_manager
		ensure
			key_manager_not_void: Result /= Void
		end

	bindery: XM_XSLT_BINDERY
			-- Global parameter/variable bindings

	initial_template: XM_XSLT_COMPILED_TEMPLATE
			-- Initial template

	output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			-- Output URI resolver

	principal_result: XM_XSLT_TRANSFORMATION_RESULT
			-- Unamed output definition

	principal_result_uri: STRING
		-- System id of unamed output definition

	principal_receiver: XM_XPATH_SEQUENCE_RECEIVER
			-- Receiver for unnamed output definition

	document_pool: XM_XPATH_DOCUMENT_POOL
			-- Document pool

	rule_manager: XM_XSLT_RULE_MANAGER
			-- Manager of template-matching rules

	decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			-- Manager of decimal formats

	recovery_policy: INTEGER
			-- Recovery policy when warnings or errors are encountered

	trace_listener: XM_XSLT_TRACE_LISTENER
			-- Trace listener

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates

	response_stream (a_uri: STRING): KI_CHARACTER_INPUT_STREAM is
			-- Response body from `a_uri';
			-- Caller must not close the stream, but instead call `discard_response'.
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
			a_uri_available: has_response_from (a_uri)
		do
			Result := response_streams.item (a_uri)
		ensure
			response_stream_not_void: Result /= Void
			response_stream_readable: Result.is_open_read
		end

	remembered_number (a_node: XM_XPATH_NODE; a_instruction: XM_XSLT_COMPILED_NUMBER): DS_CELL [INTEGER_64] is
			-- Number of a node if it is the last remembered one for `a_instruction'
		require
			a_node_not_void: a_node /= Void
			a_instruction_not_void: a_instruction /= Void
		local
			l_pair: DS_PAIR [XM_XPATH_NODE, INTEGER_64]
		do
			if remembered_numbers.has (a_instruction) then
				l_pair := remembered_numbers.item (a_instruction)
				if a_node.is_same_node (l_pair.first) then
					create Result.make (l_pair.second)
				end
			end
		end

	function_results_cache (a_function: XM_XSLT_COMPILED_USER_FUNCTION): DS_HASH_TABLE [XM_XPATH_VALUE, STRING] is
			-- Value associated with `a_function'
		require
			function_not_void: a_function /= Void
		do
			if user_data_table.has (a_function) then
				Result := user_data_table.item (a_function)
			end
		end

	cached_unparsed_text (a_uri, an_encoding: STRING): STRING is
			-- Unparsed text cached by XPath unparsed-text-available(`a_uri', `an_encoding') function
		require
			uri_not_empty: a_uri /= Void and then not a_uri.is_empty
		do
			if last_unparsed_text_uri /= Void then
				if STRING_.same_string (a_uri, last_unparsed_text_uri) then
					if (an_encoding = Void and then last_unparsed_encoding = Void)
						or else STRING_.same_string (an_encoding, last_unparsed_encoding) then
						Result := last_unparsed_text
					end
				end
			end
		end

	encoder_factory: XM_XSLT_ENCODER_FACTORY is
			-- Factory for output encoders
		do
			Result := configuration.encoder_factory
		end

feature -- Status report

	is_tracing: BOOLEAN is
			-- Is tracing enabled?
		do
			Result := trace_listener /= Void
		end

	has_response_from (a_uri: STRING): BOOLEAN is
			-- Is a response body avaialble as a result of an xsl:result-document call to `a_uri'?
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
		do
			Result := response_streams.has (a_uri)
		end

feature -- Setting

	set_remembered_number (a_number: INTEGER_64; a_node: XM_XPATH_NODE; a_instruction: XM_XSLT_COMPILED_NUMBER) is
			-- Set remembered number.
		require
			node_not_void: a_node /= Void
			a_instruction_not_void: a_instruction /= Void
		local
			l_pair: DS_PAIR [XM_XPATH_NODE, INTEGER_64]
		do
			create l_pair.make (a_node, a_number)
			remembered_numbers.force (l_pair, a_instruction)
		ensure
			a_instruction_has_remembered_number: remembered_numbers.has (a_instruction)
			correct_node: remembered_numbers.item (a_instruction).first = a_node
			correct_number: remembered_numbers.item (a_instruction).second = a_number
		end

	set_response_stream (a_response: KI_CHARACTER_INPUT_STREAM; a_uri: STRING) is
			-- Save `a_response' indexed by `a_uri'.
		require
			a_response_not_void: a_response /= Void
			a_response_readable: a_response.is_open_read
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
			a_uri_not_yet_available: not has_response_from (a_uri)
		do
			response_streams.force_new (a_response, a_uri)
		ensure
			a_uri_available: has_response_from (a_uri)
		end

feature -- Creation

	new_message_emitter (a_properties: XM_XSLT_OUTPUT_PROPERTIES): XM_XPATH_RECEIVER is
			-- New destination for xsl:message
		do
			Result := configuration.new_message_emitter (Current, a_properties)
		ensure
			new_message_emitter_not_void: Result /= Void
		end

	new_xpath_context: XM_XSLT_EVALUATION_CONTEXT is
			-- New dynamic context
		do
			create Result.make (Current)
		ensure
			Major_context_created: Result /= Void and then not Result.is_minor
		end

	new_stripper (a_builder: XM_XPATH_BUILDER): XM_XSLT_STRIPPER is
			-- Stripper configured to implement the whitespace stripping rules
		require
			builder_not_void: a_builder /= Void
		do
			Result := executable.new_stripper (Current, a_builder)
		ensure
			stripper_not_void: Result /= Void
		end

	new_parser: XM_PARSER is
			-- XML Parser
		do
			Result := parser_factory.new_eiffel_parser
			if configuration.is_dtd_suppressed then
				Result.set_entity_resolver (configuration.entity_resolver)
			else
				Result.set_resolver (configuration.entity_resolver)
			end
			Result.copy_string_mode (configuration)
		ensure
			parser_not_void: Result /= Void
		end

	new_builder (a_parser: XM_PARSER; a_base_uri: STRING; a_document_uri: UT_URI): XM_XPATH_BUILDER is
			-- Builder for XML source.
		require
			a_parser_not_void: a_parser /= Void
			a_base_uri_not_void: a_base_uri /= Void
			absolute_document_uri: a_document_uri /= Void and then a_document_uri.is_absolute
		local
			a_node_factory: XM_XPATH_NODE_FACTORY
			a_locator: XM_XPATH_RESOLVER_LOCATOR
			a_tiny_builder: XM_XPATH_TINY_BUILDER
		do
			if configuration.is_tiny_tree_model then
				create a_tiny_builder.make (a_base_uri, a_document_uri)
				a_tiny_builder.set_reporting_sizes (configuration.is_reporting_tiny_tree_statistics)
				a_tiny_builder.set_defaults (configuration.estimated_nodes, configuration.estimated_attributes, configuration.estimated_namespaces, configuration.estimated_characters)
				Result := a_tiny_builder
			else
				create a_node_factory
				create {XM_XPATH_TREE_BUILDER} Result.make (a_node_factory, a_base_uri, a_document_uri)
			end
			Result.set_line_numbering (configuration.is_line_numbering)
			create a_locator.make (a_parser)
			Result.set_document_locator (a_locator)
		ensure
			builder_not_void: Result /= Void
		end

feature -- Basic operations

	save_function_results (a_result_table: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]; a_function: XM_XSLT_COMPILED_USER_FUNCTION) is
			-- User data associated with `an_object'
		require
			function_not_void: a_function /= Void
		do
			if user_data_table.has (a_function) then
				if a_result_table = Void then
					user_data_table.remove (a_function)
				else
					user_data_table.put (a_result_table, a_function)
				end
			elseif a_result_table /= Void then
				user_data_table.put (a_result_table, a_function)
			end
		end

	set_initial_template (a_template_name: STRING) is
			-- Set initial template.
		require
			template_name_not_void: a_template_name /= Void
			expanded_name: is_valid_expanded_name (a_template_name)
		local
			a_fingerprint: INTEGER
			a_compiled_templates_index: DS_HASH_TABLE [XM_XSLT_COMPILED_TEMPLATE, INTEGER]
			an_error: XM_XPATH_ERROR_VALUE
		do
			if not shared_name_pool.is_expanded_name_allocated (a_template_name) then
				shared_name_pool.allocate_expanded_name (a_template_name)
			end
			a_fingerprint := shared_name_pool.fingerprint_from_expanded_name (a_template_name)
			a_compiled_templates_index := executable.compiled_templates_index
			if a_compiled_templates_index.has (a_fingerprint) then
				initial_template := a_compiled_templates_index.item (a_fingerprint)
				if initial_template.has_required_parameters then
					create an_error.make_from_string (("Initial template must not have any required parameters"), Xpath_errors_uri, "XTDE0060", Dynamic_error)
					report_fatal_error (an_error)
				end
			else
				initial_template := Void
				create an_error.make_from_string (STRING_.concat ("Unable to locate a template named ", a_template_name), Xpath_errors_uri, "XTDE0040", Dynamic_error)
				report_fatal_error (an_error)
			end
		end

	set_initial_mode (a_mode_name: STRING) is
			-- Set initial mode.
		require
			mode_name_not_void: a_mode_name /= Void
			expanded_name: is_valid_expanded_name (a_mode_name)
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if not shared_name_pool.is_expanded_name_allocated (a_mode_name) then
				shared_name_pool.allocate_expanded_name (a_mode_name)
			end
			initial_mode := shared_name_pool.fingerprint_from_expanded_name (a_mode_name)
			if not rule_manager.is_mode_registered (initial_mode) then
				create an_error.make_from_string (STRING_.concat (a_mode_name, " is not a mode declared within the transformation"), Xpath_errors_uri, "XTDE0045", Dynamic_error)
				report_fatal_error (an_error)
			end
		end

	clear_document_pool is
			-- Empty `document_pool'.
			-- This might need to be done between multiple
			--  transformations, but you lose caching benefits if you do call it.
		do
			create document_pool.make (executable.isolation_level)
		end

	clear_parameters is
			-- Remove all global parameters.
		do
			parameters := Void
		end

	set_string_parameter (a_parameter_value, a_parameter_name: STRING) is
			-- Set a global string-valued parameter on the stylesheet.
		require
			parameter_name_not_void: a_parameter_name /= Void and then is_valid_expanded_name (a_parameter_name)
			parameter_value_not_void: a_parameter_value /= Void
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_fingerprint: INTEGER
		do
			if parameters = Void then
				create parameters.make_empty
			end
			if not shared_name_pool.is_expanded_name_allocated (a_parameter_name) then
				shared_name_pool.allocate_expanded_name (a_parameter_name)
			end
			a_fingerprint := shared_name_pool.fingerprint_from_expanded_name (a_parameter_name)
			create a_string_value.make (a_parameter_value)
			parameters.put (a_string_value, a_fingerprint) -- this does a replace of an existing parameter of the same name
		end

	set_xpath_parameter (a_parameter_value, a_parameter_name: STRING) is
			-- Set a global xpath-valued parameter on the stylesheet.
		require
			parameter_name_not_void: a_parameter_name /= Void and then is_valid_expanded_name (a_parameter_name)
			parameter_value_not_void: a_parameter_value /= Void
		local
			l_fingerprint: INTEGER
			l_expression_factory: XM_XPATH_EXPRESSION_FACTORY
		do
			if xpath_parameters = Void then
				create xpath_parameters.make_map_default
			end
			if not shared_name_pool.is_expanded_name_allocated (a_parameter_name) then
				shared_name_pool.allocate_expanded_name (a_parameter_name)
			end
			l_fingerprint := shared_name_pool.fingerprint_from_expanded_name (a_parameter_name)
			create l_expression_factory
			l_expression_factory.make_expression (a_parameter_value, static_context, 1, 0, 1, executable.system_id (1))
			if l_expression_factory.is_parse_error then
				report_recoverable_error (l_expression_factory.parsed_error_value)
			else
				xpath_parameters.force (l_expression_factory.parsed_expression, l_fingerprint)
			end
		end

	set_initial_context (a_expression: STRING) is
			-- Set initial context node from XPath in `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
			a_expression_not_empty: not a_expression.is_empty
		do
			initial_context_expression := a_expression
		ensure
			initial_context_expression_set: initial_context_expression = a_expression
		end

	register_document (a_document: XM_XPATH_DOCUMENT; a_media_type: UT_MEDIA_TYPE; a_uri: STRING) is
			-- Register a document.
		require
			document_not_void: a_document /= Void
			uri_not_void: a_uri /= Void
			document_not_registered: not document_pool.is_document_mapped (a_uri)
		do
			document_pool.add (a_document, a_media_type, a_uri)
		ensure
			document_mapped: document_pool.is_document_mapped (a_uri)
		end

	resolve_next_destination (a_system_id, a_base_uri: STRING; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Resolve destination for transforming `a_result' via stylesheet `a_system_id'
		require
			system_id_not_void: a_system_id /= Void
			base_uri_not_void: a_base_uri /= Void
			initial_result_not_void: a_result /= Void
			no_previous_error: not is_error
		local
			l_absolute_uri, l_uri: UT_URI
			l_uri_source: XM_XSLT_URI_SOURCE
			l_transformer: XM_XSLT_TRANSFORMER
			l_transformer_receiver: XM_XSLT_TRANSFORMER_RECEIVER
			l_error: XM_XPATH_ERROR_VALUE
		do
			next_resolved_destination := Void
			create l_uri.make (a_base_uri)
			create l_absolute_uri.make_resolve (l_uri, a_system_id)
			create l_uri_source.make (l_absolute_uri.full_reference)
			transformer_factory.create_new_transformer (l_uri_source, l_absolute_uri)
			if transformer_factory.was_error then
				create l_error.make_from_string (transformer_factory.last_error_message, Gexslt_eiffel_type_uri, "CREATE_TRANSFORMER", Dynamic_error)
				report_fatal_error (l_error)
			else
				l_transformer := transformer_factory.created_transformer
				create l_transformer_receiver.make (l_transformer, principal_result_uri, a_result)
				create next_resolved_destination.make_receiver (l_transformer_receiver)
			end
		ensure
			error_or_destination_not_void: not is_error implies next_resolved_destination /= Void
		end

	cache_unparsed_text (a_text, a_uri, an_encoding: STRING) is
			-- Cache results of XPath unparsed-text-available(`a_uri', `an_encoding') function.
		require
			text_not_void: a_text /= Void
			uri_not_empty: a_uri /= Void and then not a_uri.is_empty
		do
			last_unparsed_text_uri := a_uri
			last_unparsed_text := a_text
			last_unparsed_encoding := an_encoding
		ensure
			text_cached: last_unparsed_text = a_uri
			uri_saved: last_unparsed_text_uri = a_uri
			encoding_saved: last_unparsed_encoding = an_encoding
		end

	clear_unparsed_text_cache is
			-- Clear cached results of XPath unparsed-text-available(`a_uri', `an_encoding') function.
		do
			last_unparsed_text_uri := Void
			last_unparsed_text := Void
			last_unparsed_encoding := Void
		ensure
			text_cleared: last_unparsed_text = Void
			uri_cleared: last_unparsed_text_uri = Void
			encoding_cleared: last_unparsed_encoding = Void
		end

	discard_principal_emitter is
			-- Close principal receiver and ensure no XML declaration is written.
		require
			principal_receiver_not_void: principal_receiver /= Void
		local
 			l_complex: XM_XSLT_COMPLEX_CONTENT_OUTPUTTER
 			l_receiver: XM_XPATH_RECEIVER
 			l_proxy: XM_XPATH_PROXY_RECEIVER
			l_emitter: XM_XSLT_EMITTER
		do
 			l_complex ?= principal_receiver
			if l_complex /= Void then
				from
 					l_receiver := l_complex.next_receiver
  					l_proxy ?= l_receiver
  				until
					l_proxy = Void
				loop
 					l_receiver := l_proxy.base_receiver
 					l_proxy ?= l_receiver
 				end
 				l_emitter ?= l_receiver
			else
				l_emitter ?= principal_receiver
 			end
			if l_emitter /= Void then
				l_emitter.suppress_late_open
			end
			principal_receiver.end_document
			principal_receiver.close
		end
		
feature -- Transformation

	transform (a_source: XM_XSLT_SOURCE; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Transform `a_source' to `a_result' using `executable'.
		require
			initial_template_or_source_not_void: a_source = Void implies initial_template /= Void
			result_not_void: a_result /= Void
			no_error_yet: not is_error
		local
			l_start_node: XM_XPATH_NODE
			l_builder: XM_XPATH_BUILDER
			l_parser: XM_PARSER
			l_document: XM_XPATH_DOCUMENT
			l_error: XM_XPATH_ERROR_VALUE
			l_media_type: UT_MEDIA_TYPE
			l_media_type_map: XM_XSLT_MEDIA_TYPE_MAP
			l_fragment_id: STRING
			l_date_time: DT_DATE_TIME
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_uri: UT_URI
		do
			create l_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (l_date_time)
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			create l_time_zone.make (implicit_timezone.fixed_offset)
			create current_date_time.make (l_date_time, l_time_zone) -- reset for each transformations
			if a_source /= Void then
				a_source.ignore_media_types
				if	document_pool.is_document_mapped (a_source.system_id) then
					l_document := document_pool.document (a_source.system_id)
					if a_source.fragment_identifier /= Void then
						l_media_type := document_pool.media_type (a_source.system_id)
						if l_media_type = Void then l_media_type := configuration.default_media_type (a_source.system_id) end
						l_media_type_map := configuration.media_type_map
						l_media_type_map.check_fragment_processing_rules (l_media_type, configuration.assume_html_is_xhtml)
						if l_media_type_map.may_use_xpointer then
							l_start_node := fragment_node (l_document, a_source.fragment_identifier)
						elseif l_media_type_map.may_use_id then
							l_start_node := l_document.selected_id (l_fragment_id)
							if l_start_node = Void then
								create l_error.make_from_string ("Fragment identifier did not select a node", Xpath_errors_uri, "XTRE1160", Dynamic_error)
								report_recoverable_error (l_error)
								if not is_error then
									l_start_node := l_document
								end
							end
						else
							create l_error.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type", Xpath_errors_uri, "XTRE1160", Dynamic_error)
							report_recoverable_error (l_error)
							if not is_error then
								l_start_node := l_document
							end
						end
					else
						l_start_node := l_document
					end
				elseif configuration.is_uri_written (a_source.system_id) or STRING_.same_string (a_source.system_id, a_result.system_id) then
					create l_error.make_from_string ("The system has already written to source URI " + a_source.system_id, Xpath_errors_uri, "XTRE1500", Dynamic_error)
				else
					l_parser := new_parser
					create a_uri.make (a_source.uri_reference)
					l_builder := new_builder (l_parser, a_source.uri_reference, a_uri)
					a_source.send (l_parser, new_stripper (l_builder), a_uri, False)
					l_media_type := a_source.media_type
					if l_builder.has_error then
						create l_error.make_from_string (l_builder.last_error, Gexslt_eiffel_type_uri, "BUILD_ERROR", Static_error)
						report_fatal_error (l_error)
					else
						l_document := l_builder.current_root.as_document
						register_document (l_document, l_media_type, a_source.system_id)
						l_fragment_id := a_source.fragment_identifier
						if l_fragment_id = Void then
							l_start_node := l_document
						else
							l_media_type := document_pool.media_type (a_source.system_id)
							if l_media_type = Void then l_media_type := configuration.default_media_type (a_source.system_id) end
							l_media_type_map := configuration.media_type_map
							l_media_type_map.check_fragment_processing_rules (l_media_type, configuration.assume_html_is_xhtml)
							if l_media_type_map.may_use_xpointer then
								l_start_node := fragment_node (l_document, l_fragment_id)
							elseif l_media_type_map.may_use_id then
								l_start_node := l_document.selected_id (l_fragment_id)
								if l_start_node = Void then
									create l_error.make_from_string ("Fragment identifier did not select a node", Xpath_errors_uri, "XTRE1160", Dynamic_error)
									report_recoverable_error (l_error)
									if not is_error then
										l_start_node := l_document
									end
								end
							else
								create l_error.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type",
																			 Xpath_errors_uri, "XTRE1160", Dynamic_error)
								report_recoverable_error (l_error)
								if not is_error then
									l_start_node := l_document
								end
							end
						end
					end
				end
			end

			if l_start_node /= Void and initial_context_expression /= Void then
				evaluate_initial_context_node (l_start_node)
				if not is_error then
					l_start_node := last_context_node
				end
			end
			if not is_error and then configuration.final_execution_phase = Run_to_completion then
				transform_document (l_start_node, a_result)
			end
			configuration.reset_entity_resolver
		end

feature -- Removal
	
	discard_response (a_uri: STRING) is
			-- Close and discard response from `a_uri'.
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
			a_uri_available: has_response_from (a_uri)
		do
			if response_streams.item (a_uri).is_closable then
				response_streams.item (a_uri).close
			end
			response_streams.remove (a_uri)
		ensure
			a_uri_not_available: not has_response_from (a_uri)
		end

feature {NONE} -- Implementation

	last_context_node: XM_XPATH_NODE
			-- Result from `evaluate_initial_context_node'

	evaluate_initial_context_node (a_start: XM_XPATH_NODE) is
			-- Evaluate `initial_context_expression' against `a_start' and set `last_context_node' to resulting node.
		require
			initial_context_expression_not_void: initial_context_expression /= Void
		local
			l_expression_factory: XM_XPATH_EXPRESSION_FACTORY
			l_expression: XM_XPATH_EXPRESSION
			l_result: DS_CELL [XM_XPATH_ITEM]
			l_context: like new_xpath_context
		do
			create l_expression_factory
			l_expression_factory.make_expression (initial_context_expression, static_context, 1, 0, 1, executable.system_id (1))
			if l_expression_factory.is_parse_error then
				report_fatal_error (l_expression_factory.parsed_error_value)
			else
				l_expression := l_expression_factory.parsed_expression
				create l_result.make (Void)
				l_context := new_xpath_context
				l_context.set_current_iterator (create {XM_XPATH_SINGLETON_NODE_ITERATOR}.make (a_start))
				l_expression.evaluate_item (l_result, l_context)
				if l_result.item = Void then
					last_context_node := Void
				elseif l_result.item.is_error then
					report_fatal_error (l_result.item.error_value)
				elseif l_result.item.is_node then
					last_context_node := l_result.item.as_node
				else
					report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Initial context expression does not evaluate to a single node", Xpath_errors_uri, "XPTY0004", Dynamic_error))
				end
			end
		end
	
feature {XM_XSLT_TRANSFORMER, XM_XSLT_TRANSFORMER_RECEIVER, XM_XSLT_TRANSFORMATION} -- Transformation internals

	transform_document (a_start_node: XM_XPATH_NODE; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Transform document supplied as in-memory tree.
		require
			initial_template_or_start_node_not_void: a_start_node = Void implies initial_template /= Void
			destination_result_not_void: a_result /= Void
			no_error_yet: not is_error
		local
			l_properties: XM_XSLT_OUTPUT_PROPERTIES
			l_next_uri: STRING
			l_transformation_result: XM_XSLT_TRANSFORMATION_RESULT
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_parameter_set: XM_XSLT_PARAMETER_SET
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
		do
			principal_result := a_result
			principal_result_uri := a_result.system_id
			initialize_transformer (a_start_node)
			if not is_error then
				l_properties := executable.default_output_properties
				l_transformation_result := a_result
				-- TODO: overlay properties defined by API

				-- Stylesheet chaining

				l_next_uri := l_properties.next_in_chain
				if l_next_uri /= Void then
					resolve_next_destination (l_next_uri, l_properties.next_in_chain_base_uri, a_result)
					if not is_error then l_transformation_result := next_resolved_destination end
				end
			end
			if not is_error then
				initial_context.change_output_destination (l_properties, l_transformation_result, True, Validation_preserve, Void)
			end
			if not is_error then
				principal_receiver := initial_context.current_receiver
				principal_result.set_principal_receiver (principal_receiver)
				check
					opened: principal_receiver.is_open
					-- change_output_destination ensures this
				end
				principal_receiver.start_document
			end				
			if not is_error then
				
				-- Process the source document using the handlers that have been set up.
				
				if initial_template = Void then
					perform_transformation (a_start_node)
				else
					l_context := initial_context.new_context
					l_context.open_stack_frame (initial_template.slot_manager)
					create l_parameter_set.make_empty
					l_context.set_local_parameters (l_parameter_set)
					create l_parameter_set.make_empty
					l_context.set_tunnel_parameters (l_parameter_set)
					from
						create l_tail.make (Void)
						initial_template.expand (l_tail, l_context)
					until
						l_tail.item = Void
					loop
						l_tail_call := l_tail.item
						l_tail.put (Void)
						l_tail_call.generate_tail_call (l_tail, l_context) 
					end
				end
				
				if is_tracing then
					trace_listener.stop_tracing
				end
			end
			if not is_error then
				if principal_receiver /= Void and then (not principal_receiver.is_document_started and principal_receiver.is_written) then
					report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat ("Attempt to generate two result trees to URI ", principal_result_uri),
						Xpath_errors_uri, "XTDE1490", Dynamic_error))
				elseif principal_receiver /= Void and then principal_receiver.is_document_started then
					principal_receiver.end_document
					principal_receiver.close
					principal_result.flush
				end
				if l_transformation_result.error_message /= Void then
					report_warning (l_transformation_result.error_message, Void)
				end
			end
		end

feature {XM_XSLT_TRANSFORMER} -- Transformation internals

	perform_transformation (a_start_node: XM_XPATH_NODE) is
			--  Perform transformation.
		require
			start_node_in_document: a_start_node /= Void and then a_start_node.document_root /= Void
			no_error_yet: not is_error
		local
			l_sequence_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			l_finished: BOOLEAN
			l_local_parameters, l_tunnel_parameters: XM_XSLT_PARAMETER_SET
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
		do
			if initial_mode /= -1 and initial_template /= Void then
				report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Initial mode and initial template are mutually exclusive", Xpath_errors_uri, "XTDE0047", Dynamic_error))
			end
			if not is_error then
				create l_sequence_iterator.make (a_start_node)
				from
					create l_tail.make (Void)
					create l_local_parameters.make_empty
					create l_tunnel_parameters.make_empty
					apply_templates (l_tail, l_sequence_iterator, rule_manager.mode (initial_mode), l_local_parameters, l_tunnel_parameters, initial_context)
				until
					is_error or else l_finished
				loop
					l_tail_call := l_tail.item
					l_tail.put (Void)
					if l_tail_call /= Void then
						l_tail_call.generate_tail_call (l_tail, initial_context)
					else
						l_finished := True
					end
				end
			end
		end

feature -- Implementation

	parser_factory: XM_EIFFEL_PARSER_FACTORY
			-- parser factory

	principal_source_document: XM_XPATH_DOCUMENT
			-- Principal document to be transformed

	initial_mode: INTEGER
			-- Fingerprint of initial mode

	initial_context: XM_XSLT_EVALUATION_CONTEXT
			-- Initial dynamic context for a transformation

	initial_context_expression: STRING
			-- XPath expression for initial context node

	temporary_destination_depth: INTEGER
			-- Count of temporary output destinations

	parameters: XM_XSLT_PARAMETER_SET
			-- Global parameters supplied to the transformer

	user_data_table: DS_HASH_TABLE [DS_HASH_TABLE [XM_XPATH_VALUE, STRING], XM_XSLT_COMPILED_USER_FUNCTION]
			-- User data map

	xpath_parameters: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- XPath-valued global parameters

	next_resolved_destination: XM_XSLT_TRANSFORMATION_RESULT
			-- Transformation result for next transformation in chain

	last_unparsed_text_uri, last_unparsed_text, last_unparsed_encoding: STRING
			-- Cached result from XPath unparsed-text-available(`a_uri', `an_encoding') function

	cached_static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Cached static context from `executable'

	remembered_numbers: DS_HASH_TABLE [DS_PAIR [XM_XPATH_NODE, INTEGER_64], XM_XSLT_COMPILED_NUMBER]
			-- Cache of last numbers for a node by xsl:number instructon

	response_streams: DS_HASH_TABLE [KI_CHARACTER_INPUT_STREAM, STRING]
			-- HTTP POST (for example) response bodies indexed by URI

	static_context: XM_XSLT_EXPRESSION_CONTEXT is
			-- Static context from `executable'
		do

			-- The purpose of the clone is to keep compiled stylesheets read-only,
			--  so they can be safely cached

			if cached_static_context = Void then
				cached_static_context := executable.static_context.cloned_object
			end
			Result := cached_static_context
		ensure
			result_not_void: Result /= Void
			cached: cached_static_context /= Void
		end

	selected_receiver (a_result: XM_XSLT_TRANSFORMATION_RESULT; some_properties: XM_XSLT_OUTPUT_PROPERTIES): XM_XPATH_RECEIVER is
			-- Receiver selected according to inputs
		require
			result_not_void: a_result /= Void
			properties_not_void: some_properties /= Void
		local
			l_emitter: XM_XSLT_EMITTER
			l_method: STRING
			l_method_uri, l_method_local_name: STRING
			l_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]
		do
			if a_result.is_emitter then
				l_emitter := a_result.emitter
				l_emitter.set_output_properties (some_properties)
				Result := l_emitter
			elseif a_result.is_receiver then
				Result := a_result.receiver
			else
				check
					stream: a_result.is_stream
				end
				l_method := some_properties.method
				if l_method.count = 0 then
					l_method_uri := ""; l_method_local_name := ""
				else
					l_method_uri := namespace_uri_from_expanded_name (l_method)
					l_method_local_name := local_name_from_expanded_name (l_method)
				end
				if some_properties.used_character_maps.count > 0 then
					l_character_map_index := executable.character_map_index
					check
						character_map_index: l_character_map_index /= Void
						-- as it will have been compiled in - we have already checked
						-- that the xsl:character-maps have been declared.
					end
				end
				check
					valid_output_method: emitter_factory.is_valid_output_method (l_method_uri, l_method_local_name)
					-- compiler ensures this
				end
				Result := emitter_factory.new_receiver (l_method_uri, l_method_local_name, Current, a_result.stream, some_properties,  l_character_map_index)
			end
		ensure
			selected_receiver_not_void: Result /= Void or else is_error
		end

	initialize_transformer (a_start_node: XM_XPATH_NODE) is
			-- Initialize in preparation for a transformation.
		local
			l_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			l_missing: DS_LIST [STRING]
		do
			trace_listener := configuration.trace_listener
			if is_tracing then
				trace_listener.start_tracing
			end
			output_resolver.output_destinations.wipe_out

			-- Create a new bindery, to clear out any variables from previous runs

			bindery := executable.new_bindery
			initial_context := new_xpath_context
			if a_start_node /= Void then
				principal_source_document := a_start_node.document_root
				create l_singleton_iterator.make (principal_source_document)
				initial_context.set_current_iterator (l_singleton_iterator)
				initial_context.current_iterator.start
			end

			-- If XPath parameters were supplied, set them up

			if xpath_parameters /= Void then
				if parameters = Void then
					create parameters.make_empty
				end
				apply_xpath_parameters (new_xpath_context)
			end

			-- If parameters were supplied, set them up

			if not is_error then
				if parameters = Void then
					create parameters.make_empty
				end
				l_missing := executable.missing_required_global_parameters (parameters)
				if not l_missing.is_empty then
					report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (missing_parameters_message (l_missing), Xpath_errors_uri, "XTDE0050", Dynamic_error))
				else
					bindery.define_global_parameters (parameters)
				end
			end
		end

	apply_xpath_parameters (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Set XPath values on global parameters.
		require
			context_not_void: a_context /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			a_fingerprint: INTEGER
			an_expression_factory: XM_XPATH_EXPRESSION_FACTORY
			a_value: XM_XPATH_VALUE
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			create an_expression_factory
			from
				a_cursor := xpath_parameters.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_fingerprint := a_cursor.key
				a_computed_expression ?= a_cursor.item
				if a_computed_expression /= Void then
					an_expression_factory.create_closure (a_computed_expression, a_context, Many_references)
					a_value := an_expression_factory.last_created_closure
				else
					a_value ?= a_cursor.item
				end
				parameters.put (a_value, a_fingerprint) -- replaces existing value
				a_cursor.forth
			end
		end

	fragment_node (a_document: XM_XPATH_DOCUMENT; a_fragment_identifier: STRING): XM_XPATH_NODE is
			-- Node identified by `a_fragment_identifier' via xpointer
		require
			fragment_identifier_not_void: a_fragment_identifier /= Void
			-- Also, it has had all encodings removed (i.e. it is fit to pass direct to XPointer)
		local
			an_xpointer_processor: XM_XPATH_XPOINTER
			an_element_scheme: XM_XPATH_XPOINTER_ELEMENT_SCHEME
			an_xpath_scheme: XM_XPATH_XPOINTER_XPATH_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
			a_value: XM_XPATH_VALUE
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			a_node_value: XM_XPATH_SINGLETON_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_xpointer_processor.make (False)
			create an_element_scheme.make
			create an_xpath_scheme.make
			create an_xmlns_scheme.make
			an_xpointer_processor.register_scheme (an_element_scheme)
			an_xpointer_processor.register_scheme (an_xmlns_scheme)
			an_xpointer_processor.register_scheme (an_xpath_scheme)
			an_xpointer_processor.evaluate (a_fragment_identifier, a_document)
			a_value := an_xpointer_processor.value
			an_empty_sequence ?= a_value
			if a_value.is_error or else an_empty_sequence /= Void then
				if a_value.is_error then
					create an_error.make_from_string (STRING_.concat("XPointer reported an error: ", a_value.error_value.description) ,
																 Xpath_errors_uri, "XTRE1160", Dynamic_error)
				else
					create an_error.make_from_string ("XPointer failed to select a node." , Xpath_errors_uri, "XTRE1160", Dynamic_error)
				end
				report_recoverable_error (an_error)
				if not is_error then
					Result := a_document
				end
			else
				a_node_value ?= a_value
				if a_node_value = Void then
					a_sequence_extent ?= a_value
					check
						sequence_extent: a_sequence_extent /= Void
						-- Only remaining possibility
					end
					if a_sequence_extent.is_node_sequence and then a_sequence_extent.count = 1 then
						check
							result_is_a_node: a_sequence_extent.item_at (1).is_node
							-- from the condition of the if clause
						end
						Result := a_sequence_extent.item_at (1).as_node
					else
						create an_error.make_from_string ("XPointer returned something other than a single node",
																	 Xpath_errors_uri, "XTRE1160", Dynamic_error)
						report_recoverable_error (an_error)
						if not is_error then
							Result := a_document
						end
					end
				else
					Result := a_node_value.node
				end
			end
		ensure
			error_or_not_void: not is_error implies Result /= Void
		end

	missing_parameters_message (a_missing: DS_LIST [STRING]): STRING is
			-- Text of message for error XTDE0050
		require
			a_missing_not_void: a_missing /= Void
			a_missing_not_empty: not a_missing.is_empty
		local
			l_cursor: DS_LIST_CURSOR [STRING]
		do
			from
				l_cursor := a_missing.new_cursor
				l_cursor.start
				Result := STRING_.concat ("The following required global parameters were not supplied: ", l_cursor.item)
			until
				l_cursor.after
			loop
				Result := STRING_.appended_string (Result, " ")
				Result := STRING_.appended_string (Result, l_cursor.item)
				l_cursor.forth
			end
		ensure
			missing_parameters_message_not_void: Result /= Void
			missing_parameters_message_not_empty: not Result.is_empty
		end

invariant

	parser_factory_not_void: parser_factory /= Void
	configuration_not_void: configuration /= Void
	document_pool_not_void: document_pool /= Void
	executable_not_void: executable /= Void
	rule_manager_not_void: rule_manager /= Void
	decimal_format_manager_not_void: decimal_format_manager /= Void
	positive_temporary_destination_depth: temporary_destination_depth >= 0
	error_listener_not_void: error_listener /= Void
	user_data_table_not_void: user_data_table /= Void
	transformer_factory_not_void: transformer_factory /= Void
	implicit_timezone_not_void: implicit_timezone /= Void
	current_date_time_not_void: current_date_time /= Void
	output_resolver_not_void: output_resolver /= Void
	initial_context_expression_not_empty: initial_context_expression /= Void implies not initial_context_expression.is_empty
	remembered_numbers_not_void: remembered_numbers /= Void
	response_streams_not_void: response_streams /= Void
	
end

