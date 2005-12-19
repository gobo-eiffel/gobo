indexing

	description:

		"XSLT transformers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMER

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_TRANSFORMER
		
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

	make (a_configuration: XM_XSLT_CONFIGURATION; an_executable: XM_XSLT_EXECUTABLE) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
			executable_not_void: an_executable /= Void
		local
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			configuration := a_configuration
			output_resolver := a_configuration.output_resolver
			error_listener := configuration.error_listener
			executable := an_executable
			rule_manager := executable.rule_manager
			decimal_format_manager := executable.decimal_format_manager
			create document_pool.make (executable.document_isolation_levels, executable.collection_isolation_levels)
			initial_mode := -1
			recovery_policy := Recover_with_warnings
			create parser_factory
			create user_data_table.make_default
			create a_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (a_date_time)
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			create a_time_zone.make (implicit_timezone.fixed_offset)
			create current_date_time.make (a_date_time, a_time_zone)
			create transformer_factory.make (configuration)
		ensure
			configuration_set: configuration = a_configuration
			executable_set: executable = an_executable
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
		require
			executable_not_void: executable /= Void
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

	last_remembered_number: MA_DECIMAL
			--	Last remembered number

	last_remembered_node: XM_XPATH_NODE
			-- Last remembered nod
	
	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates

	remembered_number (a_node: XM_XPATH_NODE): MA_DECIMAL is
			-- Number of a node if it is the last remembered one
		require
			node_not_void: a_node /= Void
		do
			if a_node.is_same_node (last_remembered_node) then
				Result := last_remembered_number
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

feature -- Status report

	is_tracing: BOOLEAN is
			-- Is tracing enabled?
		do
			Result := trace_listener /= Void
		end

	is_error: BOOLEAN
			-- Has an error occured

	last_error: XM_XPATH_ERROR_VALUE
			-- Last reported fatal error

	last_set_tail_call: XM_XPATH_TAIL_CALL is
			-- Last tail call set by `set_last_tail_call'
		do
			Result := last_tail_call
		end

feature -- Status setting

	set_last_tail_call (a_tail_call: XM_XPATH_TAIL_CALL) is
			-- Set residue from `apply_templates'
		do
			last_tail_call := a_tail_call
		end

	report_warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Report a warning.
		require
			message_not_void: a_message /= Void
		do
			error_listener.warning (a_message, a_locator)
		end

	report_recoverable_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a recoverable error.
		require
			error_not_void: an_error /= Void
		do
			if an_error.type = Type_error or else (an_error.type = Dynamic_error and then STRING_.same_string (an_error.namespace_uri, Xpath_errors_uri)
																and then STRING_.same_string (an_error.code.substring (1, 4), "XTDE")) then

				-- XSLT recoverable error codes start with XTRE, not XTDE

				report_fatal_error (an_error)
			else
				error_listener.error (an_error)
				if not error_listener.recovered then
					is_error := True
				end
			end
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a recoverable error.
		require
			error_not_void: an_error /= Void
		do
			if not is_error then

				-- We only report the first error;
				-- Otherwise, an error can get reported twice.
				
				error_listener.fatal_error (an_error)
				is_error := True
				last_error := an_error
			end
		end

	set_remembered_number (a_number: MA_DECIMAL; a_node: XM_XPATH_NODE) is
			-- Set remembered number.
		require
			node_not_void: a_node /= Void
			number_not_void: a_number /= Void
		do
			last_remembered_number := a_number -- CAUTION - should we copy??
			last_remembered_node := a_node
		ensure
			last_remembered_node_set: last_remembered_node = a_node
			last_remembered_number_set: last_remembered_number = a_number -- CAUTION - should we copy??
		end

feature -- Creation

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
			Result.set_resolver (configuration.entity_resolver)
			Result.copy_string_mode (configuration)
		ensure
			parser_not_void: Result /= Void
		end

	new_builder (a_parser: XM_PARSER): XM_XPATH_BUILDER is
			-- Builder for XML source.
		require
			parser_not_void: a_parser /= Void
		local
			a_node_factory: XM_XPATH_NODE_FACTORY
			a_locator: XM_XPATH_RESOLVER_LOCATOR
			a_tiny_builder: XM_XPATH_TINY_BUILDER
		do
			if configuration.is_tiny_tree_model then
				create a_tiny_builder.make
				a_tiny_builder.set_reporting_sizes (configuration.is_reporting_tiny_tree_statistics)
				a_tiny_builder.set_defaults (configuration.estimated_nodes, configuration.estimated_attributes, configuration.estimated_namespaces, configuration.estimated_characters)
				Result := a_tiny_builder
			else
				create a_node_factory
				create {XM_XPATH_TREE_BUILDER} Result.make (a_node_factory)
			end
			Result.set_line_numbering (configuration.is_line_numbering)
			create a_locator.make (a_parser)
			Result.set_document_locator (a_locator)
		ensure
			builder_not_void: Result /= Void
		end

feature -- Element change
	
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
			else
				initial_template := Void
				create an_error.make_from_string (STRING_.concat ("Unable to locate a template named ", a_template_name), Xpath_errors_uri, "XT0040", Dynamic_error)
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
				create an_error.make_from_string (STRING_.concat (a_mode_name, " is not a mode within the stylesheet"), Gexslt_eiffel_type_uri, "INVALID_INITIAL_MODE", Dynamic_error)
				report_fatal_error (an_error)
			end
		end
			
	clear_document_pool is
			-- Empty `document_pool'.
			-- This might need to be done between multiple
			--  transformations, but you lose caching benefits if you do call it.
		do
			create document_pool.make (executable.document_isolation_levels, executable.collection_isolation_levels)
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
			a_fingerprint: INTEGER
			an_expression_factory: XM_XPATH_EXPRESSION_FACTORY
		do
			if xpath_parameters = Void then
				create xpath_parameters.make_map_default
			end
			if not shared_name_pool.is_expanded_name_allocated (a_parameter_name) then
				shared_name_pool.allocate_expanded_name (a_parameter_name)
			end
			a_fingerprint := shared_name_pool.fingerprint_from_expanded_name (a_parameter_name)
			create an_expression_factory
			an_expression_factory.make_expression (a_parameter_value, static_context, 1, 0, 1, executable.system_id (1))
			if an_expression_factory.is_parse_error then
				report_recoverable_error (an_expression_factory.parsed_error_value)
			else
				xpath_parameters.force (an_expression_factory.parsed_expression, a_fingerprint)
			end
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
			an_absolute_uri, a_uri: UT_URI
			a_uri_source: XM_XSLT_URI_SOURCE
			a_transformer: XM_XSLT_TRANSFORMER
			a_transformer_receiver: XM_XSLT_TRANSFORMER_RECEIVER
			an_error: XM_XPATH_ERROR_VALUE
		do
			next_resolved_destination := Void
			create a_uri.make (a_base_uri)
			create an_absolute_uri.make_resolve (a_uri, a_system_id)
			create a_uri_source.make (an_absolute_uri.full_reference)
			transformer_factory.create_new_transformer (a_uri_source)
			if transformer_factory.was_error then
				create an_error.make_from_string (transformer_factory.last_error_message, Gexslt_eiffel_type_uri, "CREATE_TRANSFORMER", Dynamic_error)
				report_fatal_error (an_error)
			else
				a_transformer := transformer_factory.created_transformer
				create a_transformer_receiver.make (a_transformer, principal_result_uri, a_result)
				create next_resolved_destination.make_receiver (a_transformer_receiver)
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

feature -- Transformation

	transform (a_source: XM_XSLT_SOURCE; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Transform `a_source' to `a_result' using `executable'.
		require
			executable_not_void: executable /= Void
			initial_template_or_source_not_void: a_source = Void implies initial_template /= Void
			result_not_void: a_result /= Void
			no_error_yet: not is_error
		local
			a_start_node: XM_XPATH_NODE
			a_builder: XM_XPATH_BUILDER
			a_parser: XM_PARSER
			a_document: XM_XPATH_DOCUMENT
			an_error: XM_XPATH_ERROR_VALUE
			a_media_type: UT_MEDIA_TYPE
			a_media_type_map: XM_XSLT_MEDIA_TYPE_MAP
			a_fragment_id: STRING
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			create a_time_zone.make (implicit_timezone.fixed_offset)
			create a_date_time.make_from_epoch (0)
			create current_date_time.make (a_date_time, a_time_zone)
			if a_source /= Void then
				a_source.ignore_media_types
				if	document_pool.is_document_mapped (a_source.system_id) then
					a_document := document_pool.document (a_source.system_id)
					if a_source.fragment_identifier /= Void then
						a_media_type := document_pool.media_type (a_source.system_id)
						if a_media_type = Void then a_media_type := configuration.default_media_type (a_source.system_id) end
						a_media_type_map := configuration.media_type_map
						a_media_type_map.check_fragment_processing_rules (a_media_type, configuration.assume_html_is_xhtml)
						if a_media_type_map.may_use_xpointer then
							a_start_node := fragment_node (a_document, a_source.fragment_identifier)
						elseif a_media_type_map.may_use_id then
							a_start_node := a_document.selected_id (a_fragment_id)
							if a_start_node = Void then
								create an_error.make_from_string ("Fragment identifier did not select a node", Xpath_errors_uri, "XT1160", Dynamic_error)
								report_recoverable_error (an_error)
								if not is_error then
									a_start_node := a_document
								end
							end
						else
							create an_error.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type", Xpath_errors_uri, "XT1160", Dynamic_error)
							report_recoverable_error (an_error)
							if not is_error then
								a_start_node := a_document
							end
						end
					else
						a_start_node := a_document
					end
				else
					a_parser := new_parser
					a_builder := new_builder (a_parser)
					a_source.send (a_parser, new_stripper (a_builder), False)
					a_media_type := a_source.media_type
					if a_builder.has_error then
						create an_error.make_from_string (a_builder.last_error, Gexslt_eiffel_type_uri, "BUILD_ERROR", Static_error)
						report_fatal_error (an_error)
					else
						a_document := a_builder.current_root.as_document
						register_document (a_document, a_media_type, a_source.system_id)
						a_fragment_id := a_source.fragment_identifier
						if a_fragment_id = Void then
							a_start_node := a_document
						else
							a_media_type := document_pool.media_type (a_source.system_id)
							if a_media_type = Void then a_media_type := configuration.default_media_type (a_source.system_id) end
							a_media_type_map := configuration.media_type_map
							a_media_type_map.check_fragment_processing_rules (a_media_type, configuration.assume_html_is_xhtml)
							if a_media_type_map.may_use_xpointer then
								a_start_node := fragment_node (a_document, a_fragment_id)
							elseif a_media_type_map.may_use_id then
								a_start_node := a_document.selected_id (a_fragment_id)
								if a_start_node = Void then
									create an_error.make_from_string ("Fragment identifier did not select a node", Xpath_errors_uri, "XT1160", Dynamic_error)
									report_recoverable_error (an_error)
									if not is_error then
										a_start_node := a_document
									end
								end
							else
								create an_error.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type",
																			 Xpath_errors_uri, "XT1160", Dynamic_error)
								report_recoverable_error (an_error)
								if not is_error then
									a_start_node := a_document
								end
							end
						end
					end
				end
			end

			if not is_error and then configuration.final_execution_phase = Run_to_completion then
				transform_document (a_start_node, a_result)
			end
			configuration.reset_entity_resolver
		end

feature {XM_XSLT_TRANSFORMER, XM_XSLT_TRANSFORMER_RECEIVER} -- Transformation internals

	transform_document (a_start_node: XM_XPATH_NODE; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Transform document supplied as in-memory tree.
		require
			executable_not_void: executable /= Void
			initial_template_or_start_node_not_void: a_start_node = Void implies initial_template /= Void
			destination_result_not_void: a_result /= Void
			no_error_yet: not is_error
		local
			properties: XM_XSLT_OUTPUT_PROPERTIES
			a_next_uri: STRING
			a_transformation_result: XM_XSLT_TRANSFORMATION_RESULT
			a_context: XM_XSLT_EVALUATION_CONTEXT
			a_parameter_set: XM_XSLT_PARAMETER_SET
		do
			principal_result := a_result
			principal_result_uri := a_result.system_id
			initialize_transformer (a_start_node)
			if not is_error then
				properties := executable.default_output_properties
				a_transformation_result := a_result
				-- TODO: overlay properties defined by API
				
				-- Stylesheet chaining

				a_next_uri := properties.next_in_chain
				if a_next_uri /= Void then
					resolve_next_destination (a_next_uri, properties.next_in_chain_base_uri, a_result)
					if not is_error then a_transformation_result := next_resolved_destination end
				end
				if not is_error then
					initial_context.change_output_destination (properties, a_transformation_result, True, Validation_preserve, Void)
					initial_context.current_receiver.start_document

					-- Process the source document using the handlers that have been set up.
					
					if initial_template = Void then
						perform_transformation (a_start_node)
					else
						a_context := initial_context.new_context
						a_context.open_stack_frame (initial_template.slot_manager)
						create a_parameter_set.make_empty
						a_context.set_local_parameters (a_parameter_set)
						create a_parameter_set.make_empty
						a_context.set_tunnel_parameters (a_parameter_set)						
						initial_template.process (a_context)
					end
					
					if is_tracing then
						trace_listener.stop_tracing
					end
					
					if initial_context.current_receiver.is_document_started then initial_context.current_receiver.end_document end
					if initial_context.current_receiver.is_open then initial_context.current_receiver.close end
					std.output.flush
					if a_transformation_result.error_message /= Void then
						report_warning (a_transformation_result.error_message, Void)
					end
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
			a_sequence_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
			some_local_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
		do
			if not is_error then
				create a_sequence_iterator.make (a_start_node)
				from
					create some_local_parameters.make_empty
					create some_tunnel_parameters.make_empty
					apply_templates (a_sequence_iterator, rule_manager.mode (initial_mode), some_local_parameters, some_tunnel_parameters, initial_context)
				until
					is_error or else finished
				loop
					if last_tail_call /= Void then
						last_tail_call.process_leaving_tail (initial_context)
						last_tail_call := last_tail_call.last_tail_call
					else
						finished := True
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

	last_tail_call: XM_XPATH_TAIL_CALL
			-- Residue from `apply_templates'

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
			an_emitter: XM_XSLT_EMITTER
			a_method: STRING
			a_method_uri, a_method_local_name: STRING
			a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]
		do
			if a_result.is_emitter then
				an_emitter := a_result.emitter
				an_emitter.set_output_properties (some_properties)
				Result := an_emitter
			elseif a_result.is_receiver then
				Result := a_result.receiver
			else
				check
					stream: a_result.is_stream
				end
				a_method := some_properties.method
				if a_method.count = 0 then
					a_method_uri := ""; a_method_local_name := ""
				else
					a_method_uri := namespace_uri_from_expanded_name (a_method)
					a_method_local_name := local_name_from_expanded_name (a_method)
				end
				if some_properties.used_character_maps.count > 0 then
					a_character_map_index := executable.character_map_index
					check
						character_map_index: a_character_map_index /= Void
						-- as it will have been compiled in - we have already checked
						-- that the xsl:character-maps have been declared.
					end
				end
				check
					valid_output_method: emitter_factory.is_valid_output_method (a_method_uri, a_method_local_name)
					-- compiler ensures this
				end
				Result := emitter_factory.new_receiver (a_method_uri, a_method_local_name, Current, a_result.stream, some_properties,  a_character_map_index)
				a_result.set_principal_receiver (Result)
			end
		ensure
			selected_receiver_not_void: Result /= Void or else is_error
			principal_receiver_set: Result /= Void implies a_result.principal_receiver /= Void
		end

	initialize_transformer (a_start_node: XM_XPATH_NODE) is
			-- Initialize in preparation for a transformation.
		require
			executable_not_void: executable /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
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
				create a_singleton_iterator.make (principal_source_document)
				initial_context.set_current_iterator (a_singleton_iterator)
				initial_context.current_iterator.start

				-- If XPath parameters were supplied, set them up
				
				if xpath_parameters /= Void then
					if parameters = Void then
						create parameters.make_empty
					end
					apply_xpath_parameters (new_xpath_context)
				end
			elseif xpath_parameters /= Void then

				-- TODO: well, why shouldn't it be OK? No good reason. An empty context item is fine.
				
				create an_error.make_from_string ("XPath parameters cannot be specified without a source document", Gexslt_eiffel_type_uri, "PARAMETERS_WITHOUT_SOURCE_DOCUMENT", Dynamic_error)
				report_fatal_error (an_error)
			end

			-- If parameters were supplied, set them up

			if parameters /= Void and then not is_error then
				bindery.define_global_parameters (parameters)
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
																 Xpath_errors_uri, "XT1160", Dynamic_error)
				else
					create an_error.make_from_string ("XPointer failed to select a node." , Xpath_errors_uri, "XT1160", Dynamic_error)
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
																	 Xpath_errors_uri, "XT1160", Dynamic_error)
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

end
	
