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

	XM_XPATH_AXIS

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XSLT_VALIDATION
	
	DT_SHARED_SYSTEM_CLOCK

	UC_SHARED_STRING_EQUALITY_TESTER

	XM_XPATH_SHARED_EXPRESSION_TESTER

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION; a_prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
			stylesheet_not_void: a_prepared_stylesheet /= Void
		do
			configuration := a_configuration
			error_listener := configuration.error_listener
			if error_listener.is_impure then
				error_listener := error_listener.new_instance
			end
			prepared_stylesheet := a_prepared_stylesheet
			executable := prepared_stylesheet.executable
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
			prepared_stylesheet_set: prepared_stylesheet = a_prepared_stylesheet
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
			--Current iterator

	current_mode: XM_XSLT_MODE
			-- Current mode

	current_template: XM_XSLT_COMPILED_TEMPLATE
			-- Current template

	initial_template: XM_XSLT_COMPILED_TEMPLATE
			-- Initial template

	current_item: XM_XPATH_ITEM is
			-- Current item
		require
			current_iterator_not_off: current_iterator /= Void and then not current_iterator.off
		do
			Result := current_iterator.item
		ensure
			current_item_not_void: Result /= Void
		end

	document_pool: XM_XSLT_DOCUMENT_POOL
			-- Document pool

	prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			-- Compiled stylesheet

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

	message_emitter: XM_XSLT_MESSAGE_EMITTER
			-- Emitter for writing xsl:messages

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

	is_tracing: BOOLEAN
			-- Is tracing enabled?

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

	report_recoverable_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Report a recoverable error.
		require
			message_not_void: a_message /= Void
		do
			error_listener.error (a_message, a_locator)
			if not error_listener.recovered then
				is_error := True
			end
		end

	report_fatal_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Report a recoverable error.
		require
			message_not_void: a_message /= Void
		do
			error_listener.fatal_error (a_message, a_locator)
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
		local
			a_stripper_mode: XM_XSLT_MODE
		do
			if configuration.is_strip_all_white_space then
				todo ("new_stripper", true)
				-- create {XM_XSLT_ALL_ELEMENT_STRIPPER} Result.make (Current, a_builder)
			else
				Result := executable.new_stripper (Current, a_builder)
			end
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

	set_message_emitter (a_message_emitter: like message_emitter) is
			-- Set `message_emitter'.
		require
			message_emitter_not_void: a_message_emitter /= Void
		do
			message_emitter := a_message_emitter
		ensure
			message_emitter_set: message_emitter = a_message_emitter
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
				report_fatal_error ("Unable to locate a template named " + a_template_name, Void)
			end
		end

	set_initial_mode (a_mode_name: STRING) is
			-- Set initial mode.
		require
			mode_name_not_void: a_mode_name /= Void
			expanded_name: is_valid_expanded_name (a_mode_name)
		local
			a_fingerprint: INTEGER
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
			an_expression: XM_XPATH_EXPRESSION
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
				report_recoverable_error (an_expression_factory.parsed_error_value.error_message, Void)
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
		do
			if is_final and then temporary_destination_depth > 0 then
				report_fatal_error ("Cannot switch to a final result destination while writing a temporary tree", Void)
			else
				if not is_final then temporary_destination_depth := temporary_destination_depth + 1 end
				if properties = Void then
					create some_properties.make
				else
					some_properties := properties
				end
				-- set_output_properties TODO
				a_receiver := selected_receiver (a_result, some_properties)

				-- TODO: add a validator to the pipeline if required

				-- Add a filter to remove duplicate namespaces

				create a_namespace_reducer.make (a_receiver)
				create a_complex_outputter.make (a_namespace_reducer)
				a_complex_outputter.start_document
				current_receiver := a_complex_outputter
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
		do
			utc_system_clock.set_date_time_to_now (current_date_time)
			if a_source /= Void then

				-- Hm. This certainly applies to a uri source, but may need
				-- additional logic for other sources
				
				a_parser := new_parser
				a_builder := new_builder (a_parser)
				a_source.send (a_parser, new_stripper (a_builder), False)
				if a_builder.has_error then
					report_fatal_error (a_builder.last_error, Void)
				else
					a_document := a_builder.document
					register_document (a_document, a_source.system_id)
					a_start_node := a_document
				end
			end

			if not is_error then
				transform_document (a_start_node, a_result)
			end
		end

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
			initialize_transformer (a_start_node)
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

			reset_output_destination (Void)
		end
		
	perform_transformation (a_start_node: XM_XPATH_NODE) is
			--  Perform transformation.
		require
			start_node_in_document: a_start_node /= Void and then a_start_node.document_root /= Void
			no_error_yet: not is_error
		local
			a_sequence_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
		do
			if not is_error then
				create a_sequence_iterator.make (a_start_node)
				from
					apply_templates (a_sequence_iterator, rule_manager.mode (initial_mode), Void, Void)
				until
					is_error or else finished
				loop
					if last_tail_call /= Void then
						last_tail_call.process_leaving_tail (Current)
						last_tail_call := last_tail_call.last_tail_call
					else
						finished := True
					end
				end
			end
		end

	apply_templates (a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mode: XM_XSLT_MODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Process selected nodes using the handlers registered for `a_mode'
		require
			sequence_iterator_not_void: a_sequence_iterator /= Void
			no_error: not is_error
		local
			saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			saved_mode: XM_XSLT_MODE
			a_node: XM_XPATH_NODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
		do
			saved_iterator := current_iterator
			saved_mode := current_mode
			last_tail_call := Void
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
					is_error or else last_tail_call = Void
				loop
					last_tail_call.process_leaving_tail (Current)
					last_tail_call := last_tail_call.last_tail_call
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
								if is_tracing then todo ("apply_templates - tracing", True) end
								bindery.open_stack_frame (some_parameters, some_tunnel_parameters)
								a_node_handler.process_leaving_tail (Current)
								last_tail_call := a_node_handler.last_tail_call
								bindery.close_stack_frame
							else
								if is_tracing then todo ("apply_templates - tracing", True) end
								a_node_handler.process_leaving_tail (Current)
								last_tail_call := a_node_handler.last_tail_call
							end
						end
					end
				end
				a_sequence_iterator.forth
			end
			set_current_mode (saved_mode)
			set_current_iterator (saved_iterator)
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
		do
			inspect
				a_node.node_type
			when Document_node, Element_node then
				a_sequence_iterator := a_node.new_axis_iterator (Child_axis)
				from
					apply_templates (a_sequence_iterator, current_mode, some_parameters, some_tunnel_parameters)
				until
					last_tail_call = Void
				loop
					last_tail_call.process_leaving_tail (Current)
					last_tail_call := last_tail_call.last_tail_call
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
			a_target: XM_XPATH_RECEIVER
			an_emitter: XM_XSLT_EMITTER
			an_html_emitter: XM_XSLT_HTML_EMITTER
			an_html_indenter: XM_XSLT_HTML_INDENTER
			an_xhtml_emitter: XM_XSLT_XHTML_EMITTER
			an_xml_emitter: XM_XSLT_XML_EMITTER
			an_xml_indenter: XM_XSLT_XML_INDENTER
			an_uncommitted_emitter: XM_XSLT_UNCOMMITTED_EMITTER
			a_method: STRING
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

				-- `a_target' is the start of the output pipeline, the receiver that
				--  instructions will actually write to (except that other things like a
				--  namespace reducer may get added in front of it).
				-- `an_emitter' is the last thing in the output pipeline, the receiver
				--  that actually generates characters or bytes that are written to `a_result.stream'
				
				a_method := some_properties.method

				-- TODO: add character map stuff

				if a_method.count = 0 then
					create an_uncommitted_emitter.make (Current, a_result.stream, some_properties)
					a_target := an_uncommitted_emitter

					-- TODO character map expander
				elseif STRING_.same_string (a_method, "html") then
					create an_html_emitter.make (Current, a_result.stream, some_properties)
					a_target := an_html_emitter
					if some_properties.indent then
						create an_html_indenter.make (Current, an_html_emitter, some_properties)
						a_target := an_html_indenter
					end
					-- TODO - character map expander stuff
				elseif STRING_.same_string (a_method, "xml") then
					create an_xml_emitter.make (Current, a_result.stream, some_properties)
					a_target := an_xml_emitter
					if some_properties.indent then
						create an_xml_indenter.make (Current, an_xml_emitter, some_properties)
						a_target := an_xml_indenter
					end
					-- TODO: character map expander stuff and CDATA filter
					
				elseif STRING_.same_string (a_method, "xhtml") then
					create an_xhtml_emitter.make (Current, a_result.stream, some_properties)
					a_target := an_xhtml_emitter
					if some_properties.indent then
						create an_html_indenter.make (Current, an_xhtml_emitter, some_properties)
						a_target := an_html_indenter
					end
					-- TODO: character map expander stuff
				elseif STRING_.same_string (a_method, "text") then
					todo ("selected_receiver - text method", True)
				else
					todo ("selected_receiver - QName method", True)
				end
				Result := a_target
			end
		ensure
			selected_receiver_not_void: Result /= Void			
		end

	initialize_transformer (a_start_node: XM_XPATH_NODE) is
			-- Initialize inpreparation for a transformation.
		require
			executable_not_void: executable /= Void
		do
			-- TODO: open trace listener

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
				report_recoverable_error ("XPath parameters cannot be specified without a source document", Void)
			end

			-- If parameters were supplied, set them up

			if parameters /= Void then
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
			a_message: STRING
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
				a_value := an_expression_factory.created_closure (a_cursor.item, a_context)
				parameters.put (a_value, a_fingerprint) -- replaces existing value
				a_cursor.forth
			end
		end

invariant

	parser_factory_not_void: parser_factory /= Void
	configuration_not_void: configuration /= Void
	stylesheet_not_void: prepared_stylesheet /= Void
	document_pool_not_void: document_pool /= Void
	executable_not_void: executable /= Void
	rule_manager_not_void: rule_manager /= Void
	decimal_format_manager_not_void: decimal_format_manager /= Void
	positive_temporary_destination_depth: temporary_destination_depth >= 0
	error_listener_not_void: error_listener /= Void
	user_data_table_not_void: user_data_table /= Void
	reporting_policy: -- TODO

end
	
