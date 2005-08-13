indexing

	description:

		"Objects that represent an XSLT evaluation context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EVALUATION_CONTEXT

inherit

	XM_XPATH_CONTEXT
		redefine
			current_date_time, new_context, set_local_variable
		end

	XM_XPATH_ERROR_TYPES

create

	make, make_restricted, make_minor

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER) is
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
		end

	make_minor (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Establish invariant for minor context.
		require
			transformer_not_void: a_transformer /= Void
		do
			transformer := a_transformer
			cached_last := -1
			collation_map := transformer.executable.collation_map
			is_minor := True
			configuration := transformer.configuration
		ensure
			transformer_set: transformer = a_transformer
			not_restricted: not is_restricted
		end

	make_restricted (a_static_context: XM_XSLT_EXPRESSION_CONTEXT; a_collation_map: like collation_map; a_configuration: like configuration) is
			-- Create a restricted context for [xsl:]use-when.
		require
			static_context_not_void: a_static_context /= Void
		do
			configuration := a_configuration
			is_restricted := True
			static_context := a_static_context
			collation_map := a_collation_map
			create internal_date_time.make_from_epoch (0)
			create internal_local_variable_frame.make_empty
			create internal_local_parameters.make_empty
		ensure
			restricted: is_restricted
			static_context_set: static_context = a_static_context
			collation_map_set: collation_map = a_collation_map
		end

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- System configuration

	caller: like Current
			-- Calling context

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	local_variable_frame: XM_XPATH_STACK_FRAME is
			-- Local variables in scope
		do
			if is_minor then
				Result := caller.local_variable_frame
			else
				Result := internal_local_variable_frame
			end
		end

	current_mode: XM_XSLT_MODE is
			-- Current mode
		do
			if is_minor then
				Result := caller.current_mode
			else
				Result := internal_current_mode
			end
		end

	current_template: XM_XSLT_COMPILED_TEMPLATE is
			-- Current template
		do
			if is_minor then
				Result := caller.current_template
			else
				Result := internal_current_template
			end
		end

	current_group_iterator:  XM_XSLT_GROUP_ITERATOR is
			-- Current group iterator
		do
			if is_minor then
				Result := caller.current_group_iterator
			else
				Result := internal_current_group_iterator
			end
		end

	current_regexp_iterator:  XM_XSLT_REGEXP_ITERATOR is
			-- Current regexp iterator
		do
			if is_minor then
				Result := caller.current_regexp_iterator
			else
				Result := internal_current_regexp_iterator
			end
		end
	
	tunnel_parameters:  XM_XSLT_PARAMETER_SET is
			-- Tunnel parameters
		do
			if is_minor then
				Result := caller.tunnel_parameters
			else
				Result := internal_tunnel_parameters
			end
		end

	local_parameters:  XM_XSLT_PARAMETER_SET is
			-- Tunnel parameters
		do
			if is_minor then
				Result := caller.local_parameters
			else
				Result := internal_local_parameters
			end
		ensure
			result_not_void: Result /= Void
		end
	
	is_local_parameter_supplied (a_fingerprint: INTEGER; is_tunnel: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent a supplied local parameter?
		local
			a_parameter_set: XM_XSLT_PARAMETER_SET
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


	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Static context

	last_parsed_document: XM_XPATH_DOCUMENT
			-- Result from last call to `build_document'

	last_parsed_media_type: UT_MEDIA_TYPE
			-- Auxiliary result from last call to `build_document'
	
	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		do
			if is_restricted then
				Result := static_context.available_functions
			else
				Result := transformer.executable.function_library
			end
		end

	available_documents: XM_XPATH_DOCUMENT_POOL is
			-- Available documents
		do
			if not is_restricted then
				Result := transformer.document_pool
			end
		end
	
	security_manager: XM_XPATH_SECURITY_MANAGER is
			-- Security manager
		do
			Result := transformer.configuration.output_resolver.security_manager
		end

	current_date_time: DT_DATE_TIME is
			-- Current date-time
		do
			if not is_restricted then
				Result := transformer.current_date_time
			else
				Result := internal_date_time
			end
		end

	is_current_item_available: BOOLEAN is
			-- May `current()' be called without error?
		do
			if not is_restricted then
				Result := current_iterator /= Void and then not current_iterator.is_error and then not current_iterator.off
			end
		end

feature -- Status report

	last_build_error: STRING
			-- Error message from last call to `build_document'

	is_minor: BOOLEAN
			-- Is `Current' limited in what it may change?

	has_push_processing: BOOLEAN is
			-- Is push-processing to a receiver implemented?
		do
			Result := True
		end

	is_process_error: BOOLEAN is
			-- Has a processing error occured?
		do
			Result := transformer.is_error
		end

feature -- Creation

	new_context: like Current is
			-- Create a copy of `Current'
		do
			if is_minor then
				Result := new_major_context (Current)
			else
				Result := Precursor
				Result.set_caller (Current)
			end
		end
	
	new_major_context (a_minor_context: XM_XSLT_EVALUATION_CONTEXT): like Current is
			-- Create a copy of `Current'
		require
			minor_context_not_void: a_minor_context /= Void and then a_minor_context.is_minor
		do
			create Result.make (a_minor_context.transformer)
			Result.set_current_iterator (a_minor_context.current_iterator)
			Result.set_local_parameters (a_minor_context.local_parameters)
			Result.set_stack_frame (a_minor_context.local_variable_frame)
			Result.set_last (a_minor_context.cached_last)
			Result.set_current_receiver (a_minor_context.current_receiver)
			Result.set_temporary_destination (a_minor_context.is_temporary_destination)
			Result.set_caller (a_minor_context)
			if a_minor_context.tunnel_parameters /= Void then
				Result.set_tunnel_parameters (a_minor_context.tunnel_parameters)
			end
			Result.set_current_mode (a_minor_context.current_mode)
			Result.set_current_template (a_minor_context.current_template)
			Result.set_current_group_iterator (a_minor_context.current_group_iterator)
			Result.set_current_regexp_iterator (a_minor_context.current_regexp_iterator)
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

	new_minor_context: like Current is
			-- Create a minor copy of `Current'
		do
			create Result.make_minor (transformer)
			Result.set_caller (Current)
			Result.set_last (cached_last)
			Result.set_current_iterator (current_iterator)
			Result.set_current_receiver (current_receiver)
			Result.set_temporary_destination (is_temporary_destination)
		end

	new_clean_context: like Current is
			-- Created clean context (for XSLT function calls)
		do
			create Result.make (transformer)
			Result.set_caller (Current)
		end

feature -- Element change

	
	set_stack_frame (a_local_variable_frame: like local_variable_frame) is
			-- Set stack frame.
		do
			internal_local_variable_frame := a_local_variable_frame
		end

	open_stack_frame (a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Set stack frame.
		local
			an_array: ARRAY [XM_XPATH_VALUE]
		do
			create an_array.make (1, a_slot_manager.number_of_variables)
			create internal_local_variable_frame.make (a_slot_manager, an_array)
		end


	open_sized_stack_frame (a_slot_count: INTEGER) is
			-- Set stack frame.
		local
			an_array: ARRAY [XM_XPATH_VALUE]
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			create an_array.make (1, a_slot_count)
			create a_slot_manager.make
			a_slot_manager.set_number_of_variables (a_slot_count)
			create internal_local_variable_frame.make (a_slot_manager, an_array)
		end

	set_caller (a_caller: like Current) is
			-- Set calling context.
		require
			caller_not_void: a_caller /= Void
		do
			caller := a_caller
		ensure
			set: caller = a_caller
		end

	set_last (a_last_value: INTEGER) is
			-- Set result of XPath last() function.
		do
			cached_last := a_last_value
		ensure
			set: cached_last = a_last_value
		end
			
	set_local_variable (a_value: XM_XPATH_VALUE; a_slot_number: INTEGER) is
			-- Set the value of a local variable.
		do
			if is_minor then
				caller.set_local_variable (a_value, a_slot_number)
			else
				Precursor (a_value, a_slot_number)
			end
		end

	ensure_local_parameter_set (a_fingerprint: INTEGER; is_tunnel: BOOLEAN; a_slot_number: INTEGER) is
			-- Ensure local parameter is bound to local variable in slot `a_slot_number'.
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: is_valid_local_variable (a_slot_number)
			is_local_parameter_supplied (a_fingerprint, is_tunnel)
		local
			a_parameter_set: XM_XSLT_PARAMETER_SET
			a_value: XM_XPATH_VALUE
		do
			if is_minor then
				caller.ensure_local_parameter_set (a_fingerprint, is_tunnel, a_slot_number)
			else
				if is_tunnel then
					a_parameter_set := tunnel_parameters
				else
					a_parameter_set := local_parameters
				end
				check
					a_parameter_set /= Void
					-- because of pre-condition label `is_local_parameter_supplied'
				end
				a_value := a_parameter_set.value (a_fingerprint)
				if a_value /= Void then
					local_variable_frame.variables.put (a_value, a_slot_number)
				end
			end
		end

	set_local_parameters (a_parameter_set: like internal_local_parameters) is
			-- Set `local_parameters'.
		require
			parameter_set_not_void: a_parameter_set /= Void
			major_context: not is_minor
		do
			internal_local_parameters := a_parameter_set
		ensure
			set: local_parameters = a_parameter_set
		end
					 
	set_tunnel_parameters (a_parameter_set: like internal_local_parameters) is
			-- Set `tunnel_parameters'.
		require
			parameter_set_not_void: a_parameter_set /= Void
			major_context: not is_minor
		do
			internal_tunnel_parameters := a_parameter_set
		ensure
			set: tunnel_parameters = a_parameter_set
		end

	set_current_group_iterator (an_iterator: like current_group_iterator) is
			-- Set `current_iterator'.
		do
			internal_current_group_iterator := an_iterator
		ensure
			set: current_group_iterator = an_iterator
		end

	set_current_regexp_iterator (an_iterator: like current_regexp_iterator) is
			-- Set `current_regexp_iterator'.
		do
			internal_current_regexp_iterator := an_iterator
		ensure
			set: current_regexp_iterator = an_iterator
		end

	set_current_mode (a_mode: like current_mode) is
			-- Set `current_mode'.
		require
			major_context: not is_minor
		do
			if (a_mode /= Void and then not a_mode.is_default_mode) or else  internal_current_mode /= Void then
				internal_current_mode := a_mode
			end
		end

	set_current_template (a_template: like current_template) is
			-- Set `current_template'.
		require
			major_context: not is_minor
		do
			internal_current_template := a_template
		ensure
			template_set: current_template = a_template
		end
	
	build_document (a_uri_reference: STRING) is
			-- Build a document.
		local
			a_uri_resolver: XM_URI_REFERENCE_RESOLVER
			a_parser: XM_PARSER
			a_builder: XM_XPATH_BUILDER
			a_source: XM_XSLT_URI_SOURCE
		do
			is_build_document_error := False
			last_parsed_document := Void
			last_parsed_media_type := Void
			a_uri_resolver := transformer.configuration.uri_resolver
			a_uri_resolver.resolve_uri (a_uri_reference)
			if a_uri_resolver.has_uri_reference_error then
				set_build_error (a_uri_resolver.last_uri_reference_error)
			else
				if a_uri_resolver.has_media_type then
					last_parsed_media_type := a_uri_resolver.last_media_type
				end
				a_parser := transformer.new_parser
				a_builder := transformer.new_builder (a_parser)
				create a_source.make (a_uri_resolver.last_system_id.full_uri)
				a_source.send_from_stream (a_uri_resolver.last_uri_reference_stream, a_uri_resolver.last_system_id, a_parser, a_builder, False)
				if a_builder.has_error then
					set_build_error (a_builder.last_error)
				else
					last_parsed_document	?= a_builder.current_root
				end
			end
			transformer.configuration.reset_entity_resolver
		end

	change_to_sequence_output_destination (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Change to a temporary destination
		do
			set_receiver (a_receiver)
			is_temporary_destination := True
			if not a_receiver.is_open then a_receiver.open end
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
			if is_final and then is_temporary_destination then
				create an_error.make_from_string ("Cannot switch to a final result destination while writing a temporary tree",
															 Xpath_errors_uri, "XTDE1480", Dynamic_error)
				transformer.report_fatal_error (an_error, Void)
			else
				if properties = Void then
					create some_properties.make (0)
				else
					some_properties := properties
				end
				-- set_output_properties TODO
				a_receiver := transformer.selected_receiver (a_result, some_properties)

				if not transformer.is_error then
					-- TODO: add a validator to the pipeline if required
					
					-- Add a filter to remove duplicate namespaces
					
					create a_namespace_reducer.make (a_receiver)
					create a_complex_outputter.make (a_namespace_reducer)
					a_complex_outputter.open
					current_receiver := a_complex_outputter
				end
			end
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a fatal error.
		do
			transformer.report_fatal_error (an_error, Void)
		end

feature {NONE} -- Implementation

	set_build_error (a_message: STRING) is
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

	internal_local_variable_frame: XM_XPATH_STACK_FRAME
			-- Local variables for major context

	internal_local_parameters:  XM_XSLT_PARAMETER_SET
			--	 Local parameters for major context

	internal_current_group_iterator: XM_XSLT_GROUP_ITERATOR
			-- Current group iterator

	internal_current_mode: XM_XSLT_MODE
			-- Current mode

	internal_current_template: XM_XSLT_COMPILED_TEMPLATE
			-- Current template

	internal_current_regexp_iterator: XM_XSLT_REGEXP_ITERATOR
			-- Current regexp iterator

	internal_tunnel_parameters: XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

invariant

	transformer_not_void: not is_restricted implies transformer /= Void
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

end
	
