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

	XM_XPATH_DEBUGGING_ROUTINES

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XSLT_VALIDATION
	
	DT_SHARED_SYSTEM_CLOCK

	UC_SHARED_STRING_EQUALITY_TESTER

	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XSLT_SHARED_EMITTER_FACTORY

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION; a_stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
			stylesheet_compiler_not_void: a_stylesheet_compiler /= Void
			executable_compiled: a_stylesheet_compiler.executable /= Void
		do
			configuration := a_configuration
			output_resolver := a_configuration.output_resolver
			error_listener := configuration.error_listener
			stylesheet_compiler := a_stylesheet_compiler
			executable := stylesheet_compiler.executable
			rule_manager := executable.rule_manager
			decimal_format_manager := executable.decimal_format_manager
			create document_pool.make
			initial_mode := -1
			recovery_policy := Recover_with_warnings
			create parser_factory
			create user_data_table.make_with_equality_testers (10, Void, string_equality_tester)
			create current_date_time.make_from_epoch (0)
		ensure
			configuration_set: configuration = a_configuration
			stylesheet_compiler_set: stylesheet_compiler = a_stylesheet_compiler
		end
			
feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	configuration: XM_XSLT_CONFIGURATION
			-- User-selectable configuration parameters

	current_date_time: DT_DATE_TIME

	key_manager: XM_XSLT_KEY_MANAGER is
			-- Key manager
		require
			executable_not_void: executable /= Void
		do
			Result := executable.key_manager
		ensure
			key_manager_not_void: Result /= Void
		end

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	current_mode: XM_XSLT_MODE
			-- Current mode

	current_template: XM_XSLT_COMPILED_TEMPLATE
			-- Current template

	initial_template: XM_XSLT_COMPILED_TEMPLATE
			-- Initial template

	output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			-- Output URI resolver

	principal_result: XM_XSLT_TRANSFORMATION_RESULT
			-- Unamed output definition

	principal_result_uri: STRING
		-- System id of unamed output definition

	current_item: XM_XPATH_ITEM is
			-- Current item
		require
			current_iterator_not_off: current_iterator /= Void and then not current_iterator.off
		do
			Result := current_iterator.item
		ensure
			current_item_not_void: Result /= Void
		end

	document_pool: XM_XPATH_DOCUMENT_POOL
			-- Document pool

	stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			-- Stylesheet compiler

	rule_manager: XM_XSLT_RULE_MANAGER
			-- Manager of template-matching rules

	decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			-- Manager of decimal formats

	bindery: XM_XSLT_BINDERY
			-- Bound variables

	recovery_policy: INTEGER
			-- Recovery policy when warnings or errors are encountered

	current_receiver: XM_XSLT_SEQUENCE_RECEIVER
			-- Receiver to which output is currently being written.

	trace_listener: XM_XSLT_TRACE_LISTENER
			-- Trace listener

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	current_group_iterator: XM_XSLT_GROUP_ITERATOR
			-- Current group iterator

	current_regexp_iterator: XM_XSLT_REGEXP_ITERATOR
			-- Current regular expression iterator

	last_remembered_number: MA_DECIMAL
			--	Last remembered number

	last_remembered_node: XM_XPATH_NODE
			-- Last remembered nod
	
	remembered_number (a_node: XM_XPATH_NODE): MA_DECIMAL is
			-- Number of a node if it is the last remembered one
		require
			node_not_void: a_node /= Void
		do
			if a_node.is_same_node (last_remembered_node) then
				Result := last_remembered_number
			else
				create Result.make_zero
			end
		ensure
			positive_result: Result.is_positive
		end

	user_data (an_object: HASHABLE; a_name_key: STRING): ANY is
			-- User data associated with `an_object'
		require
			object_not_void: an_object /= Void
			name_key_meaningful: a_name_key /= Void and then a_name_key.count > 0
		local
			a_key: STRING
		do
			a_key := STRING_.concat (an_object.hash_code.out, " ")
			a_key := STRING_.appended_string (a_key, a_name_key)
			if user_data_table.has (a_key) then
				Result := user_data_table.item (a_key)
			end
		end

feature -- Status report

	is_tracing: BOOLEAN is
			-- Is tracing enabled?
		do
			Result := trace_listener /= Void
		end

	is_error: BOOLEAN
			-- Has an error occured?

	saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT is
			-- Current state
		do
			create Result.make (current_iterator, current_mode, current_template, current_group_iterator, current_regexp_iterator)
		ensure
			saved_context_not_void: Result /= Void
		end

feature -- Status setting

	report_warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Report a warning.
		require
			message_not_void: a_message /= Void
		do
			error_listener.warning (a_message, a_locator)
		end

	report_recoverable_error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Report a recoverable error.
		require
			error_not_void: an_error /= Void
		do
			error_listener.error (an_error, a_locator)
			if not error_listener.recovered then
				is_error := True
			end
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Report a recoverable error.
		require
			error_not_void: an_error /= Void
		do
			error_listener.fatal_error (an_error, a_locator)
			is_error := True
		end

	restore_context (a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT) is
			-- Restore state.
		require
			saved_context_not_void: a_saved_context /= Void
		do
			current_iterator := a_saved_context.iterator
			current_mode := a_saved_context.mode
			current_template := a_saved_context.template
			current_group_iterator := a_saved_context.group_iterator
			current_regexp_iterator := a_saved_context.regexp_iterator
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
			-- Created evaluation context
		require
			bindery_not_void: bindery /= Void
		do
			create Result.make (Current)
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
		do
			if configuration.is_tiny_tree_model then
				create {XM_XPATH_TINY_BUILDER} Result.make
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
	
	put_user_data (an_object: HASHABLE; a_name_key: STRING; some_user_data: ANY) is
			-- User data associated with `an_object'
		require
			object_not_void: an_object /= Void
			name_key_meaningful: a_name_key /= Void and then a_name_key.count > 0
		local
			a_key: STRING
		do
			a_key := STRING_.concat (an_object.hash_code.out, " ")
			a_key := STRING_.appended_string (a_key, a_name_key)
			if user_data_table.has (a_key) then
				if some_user_data = Void then
					user_data_table.remove (a_key)
				else
					user_data_table.put (some_user_data, a_key)
				end
			elseif some_user_data /= Void then
				user_data_table.put (some_user_data, a_key)
			end
		end

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
		ensure
			iterator_set: current_iterator = an_iterator
		end

	set_current_group_iterator (a_group_iterator: XM_XSLT_GROUP_ITERATOR) is
			-- Set `current_group_iterator'.
		do
			current_group_iterator := a_group_iterator
		ensure
			group_iterator_set: current_group_iterator = a_group_iterator
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
				create an_error.make_from_string (STRING_.concat ("Unable to locate a template named ", a_template_name), "", "XT0040", Dynamic_error)
				report_fatal_error (an_error, Void)
			end
		end

	set_initial_mode (a_mode_name: STRING) is
			-- Set initial mode.
		require
			mode_name_not_void: a_mode_name /= Void
			expanded_name: is_valid_expanded_name (a_mode_name)
		do
			if not shared_name_pool.is_expanded_name_allocated (a_mode_name) then
				shared_name_pool.allocate_expanded_name (a_mode_name)
			end
			initial_mode := shared_name_pool.fingerprint_from_expanded_name (a_mode_name)
		end

	set_current_mode (a_mode: XM_XSLT_MODE) is
			-- Set `current_mode'
		do
			current_mode := a_mode
		ensure
			mode_set: current_mode = a_mode
		end

	set_current_template (a_template: XM_XSLT_COMPILED_TEMPLATE) is
			-- Set `current_template'
		do
			current_template := a_template
		ensure
			template_set: current_template = a_template
		end

	create_new_context (an_item: XM_XPATH_ITEM) is
			-- Create new context with `an_item' as the context item and the only node in the current node list.
		require
			context_item_not_void: an_item /= Void
		local
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			create a_singleton_iterator.make (an_item)
			set_current_iterator (a_singleton_iterator)
			current_iterator.start
		ensure
			context_item: current_iterator.item = an_item
		end
			
	clear_document_pool is
			-- Empty `document_pool'.
			-- This might need to be done between multiple
			--  transformations, but you lose caching benefits if you do call it.
		do
			create document_pool.make
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
			an_expression_factory.make_expression (a_parameter_value, executable.static_context, 1, 0)
			if an_expression_factory.is_parse_error then
				report_recoverable_error (an_expression_factory.parsed_error_value, Void)
			else
				xpath_parameters.force (an_expression_factory.parsed_expression, a_fingerprint)
			end
		end

	register_document (a_document: XM_XPATH_DOCUMENT; a_uri: STRING) is
			-- Register a document.
		require
			document_not_void: a_document /= Void
			uri_not_void: a_uri /= Void
			document_not_registered: not document_pool.is_mapped (a_uri)
		do
			document_pool.add (a_document, a_uri)
			if not shared_name_pool.is_document_allocated (a_document) then
				shared_name_pool.allocate_document_number (a_document)
			end
		ensure
			document_mapped: document_pool.is_mapped (a_uri)
			document_allocated: shared_name_pool.is_document_allocated (a_document)
		end

	set_receiver (a_receiver: XM_XSLT_SEQUENCE_RECEIVER) is
			-- Set receiver to which output is currently being written.
		require
			receiver_not_void: a_receiver /= Void
		do
			current_receiver := a_receiver
		ensure
			receiver_set: current_receiver = a_receiver
		end

	reset_output_destination (a_receiver: XM_XSLT_SEQUENCE_RECEIVER) is
			-- Close the current receiver, and revert to a previous receiver.
		require
			current_receiver_not_void: current_receiver /= Void
		do
			if temporary_destination_depth > 0 then temporary_destination_depth := temporary_destination_depth - 1 end
			current_receiver.end_document
			current_receiver := a_receiver
		ensure
			receiver_set: current_receiver = a_receiver
		end
	
	change_to_sequence_output_destination (a_receiver: XM_XSLT_SEQUENCE_RECEIVER) is
			-- Set the output destination to write to a sequence.
		require
			receiver_not_void: a_receiver /= Void
		do
			temporary_destination_depth := temporary_destination_depth + 1
			current_receiver := a_receiver
		ensure
			receiver_set: current_receiver = a_receiver
			temporary_destination_depth_increased_by_one: temporary_destination_depth = old temporary_destination_depth + 1
		end

	change_to_text_output_destination (a_buffer: STRING) is
			-- Set the output destination to write to a string.
		require
			buffer_not_void: a_buffer /= Void
		do
			temporary_destination_depth := temporary_destination_depth + 1
			create {XM_XSLT_SIMPLE_CONTENT_OUTPUTTER} current_receiver.make (a_buffer, Current)
		ensure
			temporary_destination_depth_increased_by_one: temporary_destination_depth = old temporary_destination_depth + 1
		end

	change_output_destination (properties: XM_XSLT_OUTPUT_PROPERTIES; a_result: XM_XSLT_TRANSFORMATION_RESULT
										is_final: BOOLEAN; validation: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE) is
			-- Set a new output destination, supplying the output format details.
		require
			result_not_void: a_result /= void
			schema_type_not_yet_supported: a_schema_type = Void
		local
			a_complex_outputter: XM_XSLT_COMPLEX_CONTENT_OUTPUTTER
			some_properties: XM_XSLT_OUTPUT_PROPERTIES
			a_receiver: XM_XPATH_RECEIVER
			a_namespace_reducer: XM_XSLT_NAMESPACE_REDUCER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if is_final and then temporary_destination_depth > 0 then
				create an_error.make_from_string ("Cannot switch to a final result destination while writing a temporary tree", "", "XT1480", Dynamic_error)
				report_fatal_error (an_error, Void)
			else
				if not is_final then temporary_destination_depth := temporary_destination_depth + 1 end
				if properties = Void then
					create some_properties.make (0)
				else
					some_properties := properties
				end
				-- set_output_properties TODO
				a_receiver := selected_receiver (a_result, some_properties)

				if not is_error then
					-- TODO: add a validator to the pipeline if required
					
					-- Add a filter to remove duplicate namespaces
					
					create a_namespace_reducer.make (a_receiver)
					create a_complex_outputter.make (a_namespace_reducer)
					a_complex_outputter.start_document
					current_receiver := a_complex_outputter
				end
			end
		end

	reset_global_context is
			-- Reset the context to point to the root of the principal source document as the singleton focus.
		local
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			create a_singleton_iterator.make (principal_source_document)
			set_current_iterator (a_singleton_iterator)
			current_iterator.start
			current_mode := Void
			current_template := Void
			current_group_iterator := Void
			current_regexp_iterator := Void
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
		do
			utc_system_clock.set_date_time_to_now (current_date_time)
			if a_source /= Void then
				if	document_pool.is_mapped (a_source.system_id) then
					a_start_node := document_pool.document (a_source.system_id)
				else
					a_parser := new_parser
					a_builder := new_builder (a_parser)
					a_source.send (a_parser, new_stripper (a_builder), False)
					if a_builder.has_error then
						create an_error.make_from_string (a_builder.last_error, Gexslt_eiffel_type_uri, "BUILD_ERROR", Static_error)
						report_fatal_error (an_error, Void)
					else
						a_document := a_builder.document
						register_document (a_document, a_source.system_id)
						a_start_node := a_document
					end
				end
			end

			if not is_error then
				transform_document (a_start_node, a_result)
			end
			configuration.reset_entity_resolver
		end

	apply_templates (a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mode: XM_XSLT_MODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Process selected nodes using the handlers registered for `a_mode'
		require
			sequence_iterator_not_void: a_sequence_iterator /= Void
			no_error: not is_error
		local
			a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_saved_mode: XM_XSLT_MODE
			a_node: XM_XPATH_NODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
			a_last_tail_call: like last_tail_call
		do
			a_saved_iterator := current_iterator
			a_saved_mode := current_mode
			set_current_iterator (a_sequence_iterator)
			set_current_mode (a_mode)
			from
				a_sequence_iterator.start
			until
				is_error or else a_sequence_iterator.after
			loop

				-- process any tail calls returned from previous nodes

				from
				until
					is_error or else a_last_tail_call = Void
				loop
					a_last_tail_call.process_leaving_tail (Current)
					a_last_tail_call := a_last_tail_call.last_tail_call
				end
				if not is_error then
					a_node ?= a_sequence_iterator.item
					check
						item_is_a_node: a_node /= Void
						-- guarenteed by static type checking
					end
					
					-- find the node handler [i.e., the template rule] for this node
					
					a_node_handler := rule_manager.template_rule (a_node, a_mode, Current)
					if not is_error then
						if a_node_handler = Void then
							
							-- Use the default action for the node. No need to open a new stack frame!
							
							perform_default_action (a_node, some_parameters, some_tunnel_parameters)
						else
							if some_tunnel_parameters /= Void and then some_tunnel_parameters.count > 0
								or else a_node_handler.is_stack_frame_needed then
								bindery.open_stack_frame (some_parameters, some_tunnel_parameters)
								if is_tracing then
									trace_listener.trace_current_item_start (a_node)
								end
								a_node_handler.process_leaving_tail (Current)
								a_last_tail_call := a_node_handler.last_tail_call
								if is_tracing then
									trace_listener.trace_current_item_finish (a_node)
								end
								bindery.close_stack_frame
							else
								if is_tracing then
									trace_listener.trace_current_item_start (a_node)
								end
								a_node_handler.process_leaving_tail (Current)
								a_last_tail_call := a_node_handler.last_tail_call
								if is_tracing then
									trace_listener.trace_current_item_finish (a_node)
								end
							end
						end
					end
				end
				a_sequence_iterator.forth
			end
			set_current_mode (a_saved_mode)
			set_current_iterator (a_saved_iterator)
			last_tail_call := a_last_tail_call
		end

	apply_imports (a_minimum_precedence, a_maximum_precedence: INTEGER; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Apply a template imported from the stylesheet containing the current template.
		require
			no_error: not is_error
		local
			a_mode: XM_XSLT_MODE
			a_context_node: XM_XPATH_NODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_mode := current_mode
			if current_iterator = Void or else current_iterator.off then
				create an_error.make_from_string ("Context item is not set whilst applying imports.", "", "XT0565", Dynamic_error)
				report_fatal_error (an_error, Void)
			else
				a_context_node ?= current_iterator.item
				if a_context_node = Void then
					create an_error.make_from_string ("Context item is not a node whilst applying imports.", "", "XT0565", Dynamic_error)
					report_fatal_error (an_error, Void)
				else
					a_node_handler := rule_manager.imported_template_rule (a_context_node, a_mode, a_minimum_precedence, a_maximum_precedence, Current)
					if a_node_handler = Void then

						-- Use the default action for the node.

						perform_default_action (a_context_node, some_parameters, some_tunnel_parameters)
					else
						bindery.open_stack_frame (some_parameters, some_tunnel_parameters)
						a_node_handler.process (Current)
						bindery.close_stack_frame
					end
				end
			end
		end

	find_next_match (some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Find and apply next matching template.
		require
			no_error: not is_error
			current_template_not_void: current_template /= Void
		local
			a_mode: XM_XSLT_MODE
			a_context_node: XM_XPATH_NODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_mode := current_mode
			if current_iterator = Void or else current_iterator.off then
				create an_error.make_from_string ("Context item is not set whilst searching for next match.", "", "XT0565", Dynamic_error)
				report_fatal_error (an_error, Void)
			else
				a_context_node ?= current_iterator.item
				if a_context_node = Void then
					create an_error.make_from_string ("Context item is not a node whilst searching for next match.", "", "XT0565", Dynamic_error)
					report_fatal_error (an_error, Void)
				else
					a_node_handler := rule_manager.next_match_handler (a_context_node, a_mode, current_template, Current)
					if a_node_handler = Void then

						-- Use the default action for the node.

						perform_default_action (a_context_node, some_parameters, some_tunnel_parameters)
					else
						bindery.open_stack_frame (some_parameters, some_tunnel_parameters)
						a_node_handler.process (Current)
						bindery.close_stack_frame
					end
				end
			end
		end

feature {XM_XSLT_TRANSFORMER} -- Transformation internals

	transform_document (a_start_node: XM_XPATH_NODE; a_result: XM_XSLT_TRANSFORMATION_RESULT) is
			-- Transform document supplied as in-memory tree.
		require
			executable_not_void: executable /= Void
			initial_template_or_start_node_not_void: a_start_node = Void implies initial_template /= Void
			destination_result_not_void: a_result /= Void
			no_error_yet: not is_error
		local
			properties: XM_XSLT_OUTPUT_PROPERTIES
		do
			principal_result := a_result
			principal_result_uri := a_result.system_id
			initialize_transformer (a_start_node)
			if not is_error then
				properties := executable.default_output_properties
				
				-- TODO: overlay properties defined by API
				-- TODO: stylesheet chaining
				
				change_output_destination (properties, a_result, True, Validation_preserve, Void)
				
				-- Process the source document using the handlers that have been set up.
				
				if initial_template = Void then
					perform_transformation (a_start_node)
				else
					initial_template.process (Current)
				end
				
				if is_tracing then
					trace_listener.stop_tracing
				end
				
				reset_output_destination (Void)
				std.output.flush
			end
		end
		
	perform_transformation (a_start_node: XM_XPATH_NODE) is
			--  Perform transformation.
		require
			start_node_in_document: a_start_node /= Void and then a_start_node.document_root /= Void
			no_error_yet: not is_error
		local
			a_sequence_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
			a_last_tail_call: like last_tail_call
		do
			if not is_error then
				create a_sequence_iterator.make (a_start_node)
				from
					apply_templates (a_sequence_iterator, rule_manager.mode (initial_mode), Void, Void)
					a_last_tail_call := last_tail_call
				until
					is_error or else finished
				loop
					if a_last_tail_call /= Void then
						a_last_tail_call.process_leaving_tail (Current)
						a_last_tail_call := a_last_tail_call.last_tail_call
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

	last_tail_call: XM_XSLT_TAIL_CALL
			-- Residue from `apply_templates'

	temporary_destination_depth: INTEGER
			-- Count of temporary output destinations

	parameters: XM_XSLT_PARAMETER_SET
			-- Global parameters supplied to the transformer

	user_data_table: DS_HASH_TABLE [ANY, STRING]
			-- User data map

	xpath_parameters: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- XPath-valued global parameters

	perform_default_action (a_node: XM_XPATH_NODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Perform default action for `a_node'.
		require
			node_not_void: a_node /= Void
		local
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_last_tail_call: like last_tail_call
		do
			inspect
				a_node.node_type
			when Document_node, Element_node then
				a_sequence_iterator := a_node.new_axis_iterator (Child_axis)
				from
					apply_templates (a_sequence_iterator, current_mode, some_parameters, some_tunnel_parameters)
					a_last_tail_call := last_tail_call
				until
					a_last_tail_call = Void
				loop
					a_last_tail_call.process_leaving_tail (Current)
					a_last_tail_call := a_last_tail_call.last_tail_call
				end
			when Text_node, Attribute_node then
				current_receiver.notify_characters (a_node.string_value, 0)
			when Comment_node, Processing_instruction_node, Namespace_node then

				-- No action

			end
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
			an_index: INTEGER
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
					if a_method.item (1) = '{' then
						an_index := a_method.index_of ('}', 3)
						check
							closing_brace_found: an_index > 0
							-- stylesheet compilation will have ensured this
						end
						a_method_uri := a_method.substring (2, an_index - 1)
						a_method_local_name := a_method.substring (an_index + 1, a_method.count)
					else
						a_method_uri := ""; a_method_local_name := a_method
					end
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
		do
			trace_listener := configuration.trace_listener
			if is_tracing then
				trace_listener.start_tracing
			end
			output_resolver.output_destinations.wipe_out

			-- Create a new bindery, to clear out any variables from previous runs
			
			bindery := executable.new_bindery

			if a_start_node /= Void then
				principal_source_document := a_start_node.document_root
				create_new_context (a_start_node)

				-- If XPath parameters were supplied, set them up
				
				if xpath_parameters /= Void then
					if parameters = Void then
						create parameters.make_empty
					end
					apply_xpath_parameters (new_xpath_context)
				end
			elseif xpath_parameters /= Void then
				create an_error.make_from_string ("XPath parameters cannot be specified without a source document", Gexslt_eiffel_type_uri, "PARAMETERS_WITHOUT_SOURCE_DOCUMENT", Dynamic_error)
				report_fatal_error (an_error, Void)
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
		do
			create an_expression_factory
			from
				a_cursor := xpath_parameters.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_fingerprint := a_cursor.key
				a_value := an_expression_factory.created_closure (a_cursor.item, a_context, True)
				parameters.put (a_value, a_fingerprint) -- replaces existing value
				a_cursor.forth
			end
		end

invariant

	parser_factory_not_void: parser_factory /= Void
	configuration_not_void: configuration /= Void
	stylesheet_compiler_not_void: stylesheet_compiler /= Void
	document_pool_not_void: document_pool /= Void
	executable_not_void: executable /= Void
	rule_manager_not_void: rule_manager /= Void
	decimal_format_manager_not_void: decimal_format_manager /= Void
	positive_temporary_destination_depth: temporary_destination_depth >= 0
	error_listener_not_void: error_listener /= Void
	user_data_table_not_void: user_data_table /= Void
	reporting_policy: -- TODO

end
	
