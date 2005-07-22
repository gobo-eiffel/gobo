indexing

	description:

		"Objects that hold user-selected configuration options"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONFIGURATION

inherit

	XM_XPATH_CONFIGURATION
		redefine
			is_tracing, trace
		end

	XM_STRING_MODE

	XM_RESOLVER_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XSLT_VALIDATION

	MA_SHARED_DECIMAL_CONTEXT
		export {NONE} all end

	MA_DECIMAL_CONSTANTS
		export {NONE} all end

create

	make, make_with_defaults

feature {NONE} -- Initialization

	make (an_entity_resolver: like entity_resolver;
			a_uri_resolver: like uri_resolver;
			an_output_resolver: like output_resolver;
			an_error_listener: like error_listener;
			an_encoder_factory: like encoder_factory) is
			-- Establish invariant.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
			uri_resolver_not_void: a_uri_resolver /= Void
			output_resolver_not_void: an_output_resolver /= Void
			error_listener_not_void: an_error_listener /= Void
			encoder_factory_not_void: 	an_encoder_factory /= Void
		do
			encoder_factory := an_encoder_factory
			set_string_mode_mixed
			recovery_policy := Recover_with_warnings
			entity_resolver := an_entity_resolver
			uri_resolver := a_uri_resolver
			output_resolver := an_output_resolver
			set_error_listener (an_error_listener)
			shared_decimal_context.set_digits (18)
			saved_base_uri := entity_resolver.uri
			create extension_functions.make_default
			create media_type_map.make
			assume_html_is_xhtml := True
			use_xpointer := True
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
			uri_resolver_set: uri_resolver = a_uri_resolver
			output_resolver_set: output_resolver = an_output_resolver
			error_listener_set: error_listener = an_error_listener
			encoder_factory_set: encoder_factory = an_encoder_factory
		end

	make_with_defaults is
			-- Establish invariant using defaults.
		local
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_encoder_factory: XM_XSLT_ENCODER_FACTORY
			a_catalog_resolver: XM_CATALOG_RESOLVER
			an_output_resolver: XM_XSLT_DEFAULT_OUTPUT_URI_RESOLVER
			a_security_manager: XM_XSLT_DEFAULT_SECURITY_MANAGER
		do
			a_catalog_resolver := new_catalog_resolver
			create an_encoder_factory
			create error_reporter.make_standard
			create an_error_listener.make (Recover_with_warnings, error_reporter)
			create a_security_manager.make
			create an_output_resolver.make (a_security_manager)
			make (a_catalog_resolver, a_catalog_resolver, an_output_resolver, an_error_listener, an_encoder_factory)
		end

feature -- Access

	trace_listener: XM_XSLT_TRACE_LISTENER
			-- Trace listener

	error_reporter: UT_ERROR_HANDLER
			-- Error reporter for standard error and trace listeners

	entity_resolver: XM_URI_EXTERNAL_RESOLVER
			-- Entity resolver

	uri_resolver: XM_URI_REFERENCE_RESOLVER
			-- URI resolver

	output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			-- Output URI resolver

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Encoder factory

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

	is_tiny_tree_model: BOOLEAN
			-- Should the tiny tree model be used for XML source?

	recovery_policy: INTEGER
			-- Recovery policy when warnings or errors are encountered

	extension_functions: DS_ARRAYED_LIST [XM_XPATH_FUNCTION_LIBRARY]
			-- Libraries of extension functions

	media_type_map: XM_XSLT_MEDIA_TYPE_MAP
			-- URI to media-type mapping rules

	assume_html_is_xhtml: BOOLEAN
			-- Do we treat text/html as application/xhtml+xml (on the assumption that the HTTP server is lying for MSIE)?

	use_xpointer: BOOLEAN
			-- Should we use XPointer for XML media types?

	is_tracing: BOOLEAN is
			-- Is tracing enabled?
		do
			Result := trace_listener /= Void
		end

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	default_media_type (a_uri: STRING): UT_MEDIA_TYPE is
			-- Media-type associated with `a_uri' (only used when resolver returns no information)
		require
			uri_not_empty: a_uri /= Void and then a_uri.count > 0
		once

			-- This implementation always returns application/xml - sub-class and redefine if this is not satisfactory

			create Result.make ("application", "xml")
		end

	final_execution_phase: INTEGER
			-- Last phase to be executed

feature -- Element change

	add_extension_function_library (a_function_library: XM_XPATH_FUNCTION_LIBRARY) is
			-- Add an extension-function library.
		require
			function_library_not_void: a_function_library /= Void
		do
			extension_functions.force_last (a_function_library)
		ensure
			library_added: extension_functions.last = a_function_library
		end

	reset_entity_resolver is
			-- Reset `entity_resolver' stack to initial condition.
		do
			entity_resolver.reset_uri_stack (saved_base_uri)
		end

	set_digits (digits: INTEGER) is
			-- Set the preceision for decimal and integer arithmetic.
		require
			sufficient_precision: digits >= 18
		do
			shared_decimal_context.set_digits (digits)
		ensure
			digits_set: shared_decimal_context.digits = digits
		end
			
	set_line_numbering (on_or_off: BOOLEAN) is
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
		end

	set_external_function_tracing (on_or_off: BOOLEAN) is
			-- Turn tracing of external functions `on_or_off'.
		do
			is_trace_external_functions := on_or_off
		ensure
			set: is_trace_external_functions = on_or_off
		end

	set_trace_listener (a_trace_listener: XM_XSLT_TRACE_LISTENER) is
			-- Set `trace_listener'.
		require
			trace_listener_may_be_void: True
		do
			trace_listener := a_trace_listener
		ensure
			trace_listener_set: trace_listener = a_trace_listener
		end

	set_entity_resolver (an_entity_resolver: like entity_resolver) is
			-- Set `entity_resolver'.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
		do
			entity_resolver := an_entity_resolver
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
		end

	set_uri_resolver (a_uri_resolver: like uri_resolver) is
			-- Set `uri_resolver'.
		require
			uri_resolver_not_void: a_uri_resolver /= Void
		do
			uri_resolver := a_uri_resolver
		ensure
			uri_resolver_set: uri_resolver = a_uri_resolver
		end

	set_output_resolver (an_output_resolver: like output_resolver) is
			-- Set `output_resolver'.
		require
			output_resolver_not_void: an_output_resolver /= Void
		do
			output_resolver := an_output_resolver
		ensure
			output_resolver_set: output_resolver = an_output_resolver
		end

	set_recovery_policy (a_recovery_policy: INTEGER) is
			-- Set recovery policy.
		require
			valid_recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
		do
			recovery_policy := a_recovery_policy
			error_listener.set_recovery_policy (recovery_policy)
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

	set_error_listener (an_error_listener: like error_listener) is
			-- Set error listener.
		require
			error_listener_not_void: an_error_listener /= Void
		do
			error_listener := an_error_listener
			error_listener.set_recovery_policy (recovery_policy)
		end

	use_tiny_tree_model (true_or_false: BOOLEAN) is
			-- Switch on/off use of tiny tree model for source XML.
		do
			is_tiny_tree_model := true_or_false
		ensure
			set: is_tiny_tree_model = true_or_false
		end

	do_not_assume_xhtml is
			-- Do not assume that text/html is really application/xhtml+xml.
		do
			assume_html_is_xhtml := False
		ensure
			really_html: not assume_html_is_xhtml
		end

	do_not_use_xpointer is
			-- Do not use XPointer for XML media types
		do
			use_xpointer := False
		ensure
			no_xpointer_usage: not use_xpointer
		end

	trace (a_label, a_value: STRING) is
			-- Create trace entry.
		do
			if trace_listener.is_tracing then
				trace_listener.trace_user_entry (a_label, a_value)
			end
		end

	set_final_execution_phase (a_phase: INTEGER) is
			-- Set last phase to be executed.
		require
			final_execution_phase_in_range: a_phase <= Run_to_completion and then a_phase >= Stop_after_principal_source
		do
			final_execution_phase := a_phase
		ensure
			phase_set: final_execution_phase = a_phase
		end
			
feature {XM_XSLT_TRANSFORMER, XM_XSLT_INSTRUCTION} -- Transformation

	element_validator (a_receiver: XM_XPATH_RECEIVER; a_name_code: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE;
							 a_validation_action: INTEGER): XM_XPATH_RECEIVER is
			-- A receiver that can be used to validate an element,
			--  and that passes the validated element on to a target receiver.
			-- If validation is not supported, the returned receiver
			--  will be the target receiver.
		require
			current_receiver_not_void: a_receiver /= Void
			validation_action: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
			-- Not sure about the others - anyway, they are not used yet
		do

			-- Basic XSLT processor version

			Result := a_receiver
		ensure
			element_validator_not_void: Result /= Void
		end

	document_validator (a_receiver: XM_XPATH_RECEIVER; a_system_id: STRING; a_validation_action: INTEGER): XM_XPATH_RECEIVER is
		-- A receiver that can be used to validate a document,
			--  and that passes the validated element on to a target receiver.
			-- If validation is not supported, the returned receiver
			--  will be the target receiver.
		require
			current_receiver_not_void: a_receiver /= Void
			validation_action: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
			system_id_not_void: a_system_id /= Void
		do
			Result := a_receiver
		ensure
			document_validator_not_void: Result /= Void
		end

feature {XM_XSLT_STYLESHEET_COMPILER, XM_XSLT_MODULE} -- Compliation
	
	are_external_functions_allowed: BOOLEAN
			-- Are extension functions allowed?

feature {XM_XSLT_EXPRESSION_CONTEXT} -- Debugging

	is_trace_external_functions: BOOLEAN
			-- Is tracing of external functions turned on?
	
feature {NONE} -- Implementation

	saved_base_uri: UT_URI
			-- Bodge - saved base URI from `entity_resolver'`

invariant

	entity_resolver_not_void: entity_resolver /= Void
	output_resolver_not_void: output_resolver /= Void
	error_listener_not_void: error_listener /= Void
	error_reporter_not_void: error_reporter /= Void
	encoder_factory_not_void: encoder_factory /= Void
	recovery_policy: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover
	extension_functions_not_void: extension_functions /= Void
	media_type_map_not_void: media_type_map /= Void
	final_execution_phase_in_range: final_execution_phase <= Run_to_completion and then final_execution_phase >= Stop_after_principal_source

end
