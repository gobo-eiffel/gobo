note

	description:

		"Objects that represent an XSLT evaluation context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_EVALUATION_CONTEXT

inherit

	XM_XPATH_CONTEXT
		redefine
			current_date_time, new_context, set_local_variable, is_uri_written
		end

	XM_XPATH_ERROR_TYPES

create

	make, make_restricted, make_minor

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER)
			-- Establish invariant for major context.
		require
			transformer_not_void: a_transformer /= Void
		do
			make_minor (a_transformer)
			is_minor := False
			create internal_local_parameters.make_empty
			create internal_local_variable_frame.make_empty
		ensure
			transformer_set: transformer = a_transformer
			not_restricted: not is_restricted
			not_pattern: not is_pattern
		end

	make_minor (a_transformer: XM_XSLT_TRANSFORMER)
			-- Establish invariant for minor context.
		require
			transformer_not_void: a_transformer /= Void
		do
			transformer := a_transformer
			clear_last_cache
			collation_map := a_transformer.executable.collation_map
			is_minor := True
			configuration := a_transformer.configuration
		ensure
			transformer_set: transformer = a_transformer
			not_restricted: not is_restricted
			not_pattern: not is_pattern
		end

	make_restricted (a_static_context: like static_context; a_collation_map: like collation_map; a_configuration: like configuration)
			-- Create a restricted context for [xsl:]use-when.
		require
			static_context_not_void: a_static_context /= Void
			configuration_not_void: a_configuration /= Void
		local
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			l_internal_implicit_timezone: like internal_implicit_timezone
		do
			configuration := a_configuration
			is_restricted := True
			clear_last_cache
			static_context := a_static_context
			collation_map := a_collation_map
			create l_internal_implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			internal_implicit_timezone := l_internal_implicit_timezone
			create a_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (a_date_time)
			create a_time_zone.make (l_internal_implicit_timezone.fixed_offset)
			create internal_date_time.make (a_date_time, a_time_zone)
			create internal_local_variable_frame.make_empty
			create internal_local_parameters.make_empty
		ensure
			restricted: is_restricted
			static_context_set: static_context = a_static_context
			collation_map_set: collation_map = a_collation_map
			not_pattern: not is_pattern
		end

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- System configuration

	caller: detachable like Current
			-- Calling context

	transformer: detachable XM_XSLT_TRANSFORMER
			-- Transformer

	local_variable_frame: detachable XM_XPATH_STACK_FRAME
			-- Local variables in scope
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.local_variable_frame
				end
			else
				Result := internal_local_variable_frame
			end
		end

	current_mode: detachable XM_XSLT_MODE
			-- Current mode
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.current_mode
				end
			else
				Result := internal_current_mode
			end
		end

	current_template: detachable XM_XSLT_RULE
			-- Rule for current template
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.current_template
				end
			else
				Result := internal_current_template
			end
		end

	current_group_iterator: detachable  XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
			-- Current group iterator
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.current_group_iterator
				end
			else
				Result := internal_current_group_iterator
			end
		end

	current_regexp_iterator: detachable XM_XSLT_REGEXP_ITERATOR
			-- Current regexp iterator
		do
			if is_pattern then
				Result := Void
			elseif is_minor then
				check attached caller as l_caller then
					Result := l_caller.current_regexp_iterator
				end
			else
				Result := internal_current_regexp_iterator
			end
		ensure then
			current_regexp_iterator_void_for_patterns: is_pattern implies Result = Void
		end

	tunnel_parameters:  detachable XM_XSLT_PARAMETER_SET
			-- Tunnel parameters
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.tunnel_parameters
				end
			else
				Result := internal_tunnel_parameters
			end
		end

	local_parameters:  XM_XSLT_PARAMETER_SET
			-- Tunnel parameters
		do
			if is_minor then
				check attached caller as l_caller then
					Result := l_caller.local_parameters
				end
			else
				check attached internal_local_parameters as l_internal_local_parameters then
					Result := l_internal_local_parameters
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	is_local_parameter_supplied (a_fingerprint: INTEGER; is_tunnel: BOOLEAN): BOOLEAN
			-- Does `a_fingerprint' represent a supplied local parameter?
		local
			a_parameter_set: detachable XM_XSLT_PARAMETER_SET
		do
			if is_tunnel then
				a_parameter_set := tunnel_parameters
			else
				a_parameter_set := local_parameters
			end
			if a_parameter_set /= Void then
				Result := a_parameter_set.has (a_fingerprint)
			end
		end

	static_context: detachable XM_XPATH_STATIC_CONTEXT
			-- Static context

	last_parsed_document: detachable XM_XPATH_DOCUMENT
			-- Result from last call to `build_document'

	last_parsed_media_type: detachable UT_MEDIA_TYPE
			-- Auxiliary result from last call to `build_document'

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions
		do
			if is_restricted then
				check invariant_static_context_not_void: attached static_context as l_static_context then
					Result := l_static_context.available_functions
				end
			else
				check attached transformer as l_transformer then
					Result := l_transformer.executable.function_library
				end
			end
		end

	available_documents: detachable XM_XPATH_DOCUMENT_POOL
			-- Available documents
		do
			if not is_restricted then
				check attached transformer as l_transformer then
					Result := l_transformer.document_pool
				end
			end
		end

	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates
		do
			if is_restricted then
				check attached internal_implicit_timezone as l_internal_implicit_timezone then
					Result := l_internal_implicit_timezone
				end
			else
				check attached transformer as l_transformer then
					Result := l_transformer.implicit_timezone
				end
			end
		end

	security_manager: XM_XPATH_SECURITY_MANAGER
			-- Security manager
		do
			check attached transformer as l_transformer then
				Result := l_transformer.configuration.output_resolver.security_manager
			end
		end

	current_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Current date-time
		do
			if not is_restricted then
				check attached transformer as l_transformer then
					Result := l_transformer.current_date_time
				end
			else
				check attached internal_date_time as l_internal_date_time then
					Result := l_internal_date_time
				end
			end
		end

	is_current_item_available: BOOLEAN
			-- May `current()' be called without error?
		do
			if not is_restricted then
				Result := attached current_iterator as l_current_iterator and then not l_current_iterator.is_error and then not l_current_iterator.off
			end
		end

	tail_call_function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			-- Next tail call

feature -- Status report

	last_build_error: detachable STRING
			-- Error message from last call to `build_document'

	is_minor: BOOLEAN
			-- Is `Current' limited in what it may change?

	is_pattern: BOOLEAN
			-- Is `Current' used for pattern evaluation?

	has_push_processing: BOOLEAN
			-- Is push-processing to a receiver implemented?
		do
			Result := True
		end

	is_process_error: BOOLEAN
			-- Has a processing error occurred?
		do
			check attached transformer as l_transformer then
				Result := l_transformer.is_error
			end
		end

	is_uri_written (a_uri: STRING): BOOLEAN
			-- Has `a_uri' been written to yet?
		do
			check
				attached transformer as l_transformer
				attached l_transformer.principal_result_uri as l_principal_result_uri
			then
				Result := STRING_.same_string (a_uri, l_principal_result_uri) or else Precursor (a_uri)
			end
		end

feature -- Status setting

	set_pattern
			-- Set `is_pattern' to `Trye'.
		do
			is_pattern := True
		ensure
			pattern_set: is_pattern
		end

feature -- Creation

	new_context: like Current
			-- Create a copy of `Current'
		do
			if is_minor then
				Result := new_major_context (Current)
			else
				Result := Precursor
				--Result.set_caller (Current)
			end
		end

	new_major_context (a_minor_context: XM_XSLT_EVALUATION_CONTEXT): like Current
			-- Create a copy of `Current'
		require
			minor_context_not_void: a_minor_context /= Void and then a_minor_context.is_minor
		do
			check attached a_minor_context.transformer as l_minor_context_transformer then
				create Result.make (l_minor_context_transformer)
				Result.set_current_iterator (a_minor_context.current_iterator)
				Result.set_local_parameters (a_minor_context.local_parameters)
				check attached a_minor_context.local_variable_frame as l_local_variable_frame then
					Result.set_stack_frame (l_local_variable_frame)
				end
				Result.set_last (a_minor_context.cached_last)
				Result.set_current_receiver (a_minor_context.current_receiver)
				Result.set_temporary_destination (a_minor_context.is_temporary_destination)
				Result.set_caller (a_minor_context)
				if attached a_minor_context.tunnel_parameters as l_tunnel_parameters then
					Result.set_tunnel_parameters (l_tunnel_parameters)
				end
				Result.set_current_mode (a_minor_context.current_mode)
				Result.set_current_template (a_minor_context.current_template)
				Result.set_current_group_iterator (a_minor_context.current_group_iterator)
				Result.set_current_regexp_iterator (a_minor_context.current_regexp_iterator)
			end
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

	new_minor_context: like Current
			-- Create a minor copy of `Current'
		do
			check attached transformer as l_transformer then
				create Result.make_minor (l_transformer)
				Result.set_caller (Current)
				Result.set_current_iterator (current_iterator)
				Result.set_current_receiver (current_receiver)
				Result.set_temporary_destination (is_temporary_destination)
				Result.set_last (cached_last)
				if is_pattern then
					Result.set_pattern
				end
			end
		ensure then
			pattern_status_preserved: Result.is_pattern = is_pattern
		end

	new_pattern_context: XM_XSLT_EVALUATION_CONTEXT
			-- Create a minor copy of `Current'
		do
			Result := new_minor_context
			Result.set_pattern
		ensure
			new_pattern_context_not_void: Result /= Void
			pattern_context: Result.is_pattern
		end

	new_clean_context: like Current
			-- Created clean context (for XSLT function calls)
		do
			check attached transformer as l_transformer then
				create Result.make (l_transformer)
			end
		end

feature -- Element change


	set_stack_frame (a_local_variable_frame: attached like local_variable_frame)
			-- Set stack frame.
		do
			internal_local_variable_frame := a_local_variable_frame
		end

	reset_stack_frame_map (a_slot_manager: XM_XPATH_SLOT_MANAGER; a_parameter_count: INTEGER)
			-- Reset `local_variable_frame.slot_manager' and conditionally resize `local_variable_frame.variables'.
		require
			a_slot_manager_not_void: a_slot_manager /= Void
			non_negative_parameter_count: a_parameter_count >= 0
			a_parameter_count_small_enough: a_parameter_count <= a_slot_manager.number_of_variables
			major_context: not is_minor
		do
			check attached local_variable_frame as l_local_variable_frame then
				l_local_variable_frame.set_slot_manager (a_slot_manager, a_parameter_count)
			end
		ensure
			slot_manager_set: attached local_variable_frame as l_local_variable_frame and then l_local_variable_frame.slot_manager = a_slot_manager
			correct_size: l_local_variable_frame.variables.count = a_slot_manager.number_of_variables
		end

	set_tail_call (a_function: XM_XSLT_COMPILED_USER_FUNCTION; a_variables: ARRAY [detachable XM_XPATH_VALUE])
			-- Set `a_function' as the next tail call, with `a_variables' on stack frame.
		require
			a_function_not_void: a_function /= Void
			a_variables_not_void: a_variables /= Void
		local
			i: INTEGER
			l_variables: like a_variables
		do
			tail_call_function := a_function
			check attached local_variable_frame as l_local_variable_frame then
				if a_variables.count /= l_local_variable_frame.variables.count then
					create l_variables.make_filled (Void, 1, a_function.slot_manager.number_of_variables)
					from
						i := 1
					until
						i > a_variables.count
					loop
						l_variables.put (a_variables.item (i), i)
						i := i + 1
					end
					l_local_variable_frame.set_variables (l_variables)
				else
					from
						i := 1
					until
						i > a_variables.count
					loop
						l_local_variable_frame.variables.put (a_variables.item (i), i)
						i := i + 1
					end
				end
			end
		ensure
			tail_call_function_set: tail_call_function = a_function
			minimum_variables_count: attached local_variable_frame as l_local_variable_frame and then l_local_variable_frame.variables.count >= a_variables.count
		end

	clear_tail_call_function
			-- Set `tail_call_function' to `Void'.
		do
			tail_call_function := Void
		ensure
			tail_call_function = Void
		end

	open_stack_frame (a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- Set stack frame.
		local
			an_array: ARRAY [detachable XM_XPATH_VALUE]
		do
			create an_array.make_filled (Void, 1, a_slot_manager.number_of_variables)
			create internal_local_variable_frame.make (a_slot_manager, an_array)
		end


	open_sized_stack_frame (a_slot_count: INTEGER)
			-- Set stack frame.
		local
			an_array: ARRAY [detachable XM_XPATH_VALUE]
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			create an_array.make_filled (Void, 1, a_slot_count)
			create a_slot_manager.make
			a_slot_manager.set_number_of_variables (a_slot_count)
			create internal_local_variable_frame.make (a_slot_manager, an_array)
		end

	set_caller (a_caller: like Current)
			-- Set calling context.
		require
			caller_not_void: a_caller /= Void
		do
			caller := a_caller
		ensure
			set: caller = a_caller
		end

	set_last (a_last_value: INTEGER)
			-- Set result of XPath last() function.
		do
			cached_last := a_last_value
		ensure
			set: cached_last = a_last_value
		end

	set_local_variable (a_value: XM_XPATH_VALUE; a_slot_number: INTEGER)
			-- Set the value of a local variable.
		do
			if is_minor then
				check attached caller as l_caller then
					l_caller.set_local_variable (a_value, a_slot_number)
				end
			else
				Precursor (a_value, a_slot_number)
			end
		end

	ensure_local_parameter_set (a_fingerprint: INTEGER; is_tunnel: BOOLEAN; a_slot_number: INTEGER)
			-- Ensure local parameter is bound to local variable in slot `a_slot_number'.
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: is_valid_local_variable (a_slot_number)
			is_local_parameter_supplied (a_fingerprint, is_tunnel)
		local
			a_parameter_set: detachable XM_XSLT_PARAMETER_SET
			a_value: XM_XPATH_VALUE
		do
			if is_minor then
				check attached caller as l_caller then
					l_caller.ensure_local_parameter_set (a_fingerprint, is_tunnel, a_slot_number)
				end
			else
				if is_tunnel then
					a_parameter_set := tunnel_parameters
				else
					a_parameter_set := local_parameters
				end
				check
					a_parameter_set /= Void
					-- because of pre-condition label `is_local_parameter_supplied'
				then
					a_value := a_parameter_set.value (a_fingerprint)
					if a_value /= Void then
						check attached local_variable_frame as l_local_variable_frame then
							l_local_variable_frame.variables.put (a_value, a_slot_number)
						end
					end
				end
			end
		end

	set_local_parameters (a_parameter_set: like internal_local_parameters)
			-- Set `local_parameters'.
		require
			parameter_set_not_void: a_parameter_set /= Void
			major_context: not is_minor
		do
			internal_local_parameters := a_parameter_set
		ensure
			set: local_parameters = a_parameter_set
		end

	set_tunnel_parameters (a_parameter_set: like internal_local_parameters)
			-- Set `tunnel_parameters'.
		require
			parameter_set_not_void: a_parameter_set /= Void
			major_context: not is_minor
		do
			internal_tunnel_parameters := a_parameter_set
		ensure
			set: tunnel_parameters = a_parameter_set
		end

	set_current_group_iterator (an_iterator: like current_group_iterator)
			-- Set `current_iterator'.
		do
			internal_current_group_iterator := an_iterator
		ensure
			set: current_group_iterator = an_iterator
		end

	set_current_regexp_iterator (an_iterator: like current_regexp_iterator)
			-- Set `current_regexp_iterator'.
		do
			internal_current_regexp_iterator := an_iterator
		ensure
			set: current_regexp_iterator = an_iterator
		end

	set_current_mode (a_mode: like current_mode)
			-- Set `current_mode'.
		require
			major_context: not is_minor
		do
			if (a_mode /= Void and then not a_mode.is_default_mode) or else  internal_current_mode /= Void then
				internal_current_mode := a_mode
			end
		end

	set_current_template (a_template: like current_template)
			-- Set `current_template'.
		require
			major_context: not is_minor
		do
			internal_current_template := a_template
		ensure
			template_set: current_template = a_template
		end

	build_document (a_uri_reference: STRING)
			-- Build a document.
		local
			l_uri_resolver: XM_URI_REFERENCE_RESOLVER
			l_parser: XM_PARSER
			l_builder: XM_XPATH_BUILDER
			l_source: XM_XSLT_URI_SOURCE
			l_executable: XM_XSLT_EXECUTABLE
			l_uri: UT_URI
		do
			check attached transformer as l_transformer then
				if attached l_transformer.timer as l_transformer_timer then
					l_transformer_timer.time_document_building
				end
				is_build_document_error := False
				last_parsed_document := Void
				last_parsed_media_type := Void
				create l_uri.make (a_uri_reference)
				l_uri_resolver := l_transformer.configuration.uri_resolver
				l_uri_resolver.resolve_uri (a_uri_reference)
				if attached l_uri_resolver.last_uri_reference_error as l_last_uri_reference_error then
					check has_error: l_uri_resolver.has_uri_reference_error end
					set_build_error (l_last_uri_reference_error)
				else
					if l_uri_resolver.has_media_type then
						last_parsed_media_type := l_uri_resolver.last_media_type
					end
					l_parser := l_transformer.new_parser
					check attached l_uri_resolver.last_system_id as l_uri_resolver_last_system_id then
						l_builder := l_transformer.new_builder (l_parser, l_uri_resolver_last_system_id.full_uri, l_uri)
						create l_source.make (l_uri_resolver_last_system_id.full_uri)
						check attached l_uri_resolver.last_uri_reference_stream as l_uri_resolver_last_uri_reference_stream then
							l_source.send_from_stream (l_uri_resolver_last_uri_reference_stream, l_uri_resolver_last_system_id, l_parser, l_builder, False)
							if attached l_builder.last_error as l_builder_last_error then
								check has_error: l_builder.has_error end
								set_build_error (l_builder_last_error)
							else
								if attached {XM_XPATH_DOCUMENT} l_builder.current_root as l_last_parsed_document then
									last_parsed_document := l_last_parsed_document
									l_executable := l_transformer.executable
								else
									last_parsed_document := Void
								end
							end
						end
					end
				end
				if attached l_transformer.timer as l_transformer_timer then
					l_transformer_timer.mark_document_built
					l_transformer.configuration.error_reporter.report_error_message ("Time to build " + a_uri_reference + " was " + l_transformer_timer.document_build_time.precise_out + " seconds")
				end
				l_transformer.configuration.reset_entity_resolver
			end
		end

	change_to_sequence_output_destination (a_receiver: XM_XPATH_SEQUENCE_RECEIVER)
			-- Change to a temporary destination
		do
			set_receiver (a_receiver)
			is_temporary_destination := True
			if not a_receiver.is_open then a_receiver.open end
		end

	change_output_destination (properties: detachable XM_XSLT_OUTPUT_PROPERTIES; a_result: XM_XSLT_TRANSFORMATION_RESULT
										is_final: BOOLEAN; validation: INTEGER; a_schema_type: detachable XM_XPATH_SCHEMA_TYPE)
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
			if is_final and then is_temporary_destination then
				create an_error.make_from_string ("Cannot switch to a final result destination while writing a temporary tree",
															 Xpath_errors_uri, "XTDE1480", Dynamic_error)
				check attached transformer as l_transformer then
					l_transformer.report_fatal_error (an_error)
				end
			else
				if properties = Void then
					create some_properties.make (0)
				else
					some_properties := properties
				end
				check attached transformer as l_transformer then
					check attached l_transformer.selected_receiver (a_result, some_properties) as  l_selected_receiver then
						a_receiver := l_selected_receiver
					end
					a_result.set_principal_receiver (a_receiver)
					if not l_transformer.is_error and not a_receiver.is_open then
						-- TODO: add a validator to the pipeline if require

						-- Add a filter to remove duplicate namespaces

						create a_namespace_reducer.make (a_receiver)
						create a_complex_outputter.make (a_namespace_reducer)
						a_complex_outputter.open
						current_receiver := a_complex_outputter
					end
				end
			end
		ensure
			current_receiver_opened: attached transformer as l_transformer and then not l_transformer.is_error implies attached current_receiver as l_current_receiver
				and then l_current_receiver.is_open
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE)
			-- Report a fatal error.
		do
			check attached transformer as l_transformer then
				l_transformer.report_fatal_error (an_error)
			end
		end

feature {NONE} -- Implementation

	saved_receiver: like current_receiver
			-- Previous value for `current_receiver'

	set_build_error (a_message: STRING)
			-- Set `last_build_error'.
		require
			message_not_void: a_message /= Void
		do
			last_build_error := a_message
			is_build_document_error := True
		ensure
			error_set: last_build_error = a_message
			is_build_document_error: is_build_document_error
		end

	internal_local_variable_frame: detachable XM_XPATH_STACK_FRAME
			-- Local variables for major context

	internal_local_parameters: detachable  XM_XSLT_PARAMETER_SET
			--	 Local parameters for major context

	internal_current_group_iterator: detachable XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
			-- Current group iterator

	internal_current_mode: detachable XM_XSLT_MODE
			-- Current mode

	internal_current_template: detachable XM_XSLT_RULE
			-- Rule for current template

	internal_current_regexp_iterator: detachable XM_XSLT_REGEXP_ITERATOR
			-- Current regexp iterator

	internal_tunnel_parameters: detachable XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

	internal_implicit_timezone: detachable DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit timezone for restricted contexts

invariant

	transformer_conditionally_not_void: not is_restricted implies transformer /= Void
	static_context_void: not is_restricted implies static_context = Void
	static_context_not_void: is_restricted implies static_context /= Void
	local_variables: is_minor implies internal_local_variable_frame = Void
	local_variables_not_void: not is_minor implies internal_local_variable_frame /= Void
	local_parameters: is_minor implies internal_local_parameters = Void
	local_parameters_not_void: not is_minor implies internal_local_parameters /= Void
	tunnel_parameters: is_minor implies internal_tunnel_parameters = Void
	group_iterator: is_minor implies internal_current_group_iterator = Void
	mode: is_minor implies internal_current_mode = Void
	template: is_minor implies internal_current_template = Void
	regexp: is_minor implies internal_current_regexp_iterator = Void
	pattern_context_implies_minor: is_pattern implies is_minor
	configuration_not_void: configuration /= Void

end

