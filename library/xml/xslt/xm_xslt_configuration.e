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

	XM_STRING_MODE

	XM_RESOLVER_FACTORY

	XM_XPATH_SHARED_NAME_POOL

	XM_XSLT_CONFIGURATION_CONSTANTS

	XM_XSLT_VALIDATION

	MA_SHARED_DECIMAL_CONTEXT

	MA_DECIMAL_CONSTANTS

	XM_XPATH_SHARED_FUNCTION_FACTORY

creation

	make, make_with_defaults

feature {NONE} -- Initialization

	make (an_entity_resolver: XM_EXTERNAL_RESOLVER;
			an_error_listener: XM_XSLT_ERROR_LISTENER;
			a_system_function_factory: XM_XSLT_SYSTEM_FUNCTION_FACTORY;
			an_encoder_factory: XM_XSLT_ENCODER_FACTORY) is
			-- Establish invariant.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
			error_listener_not_void: an_error_listener /= Void
			system_function_factory: a_system_function_factory /= Void
			encoder_factory_not_void: 	an_encoder_factory /= Void
		do
			function_factory.register_system_function_factory (a_system_function_factory)
			encoder_factory := an_encoder_factory
			set_string_mode_mixed
			recovery_policy := Recover_with_warnings
			entity_resolver := an_entity_resolver
			error_listener := an_error_listener
			if error_listener.is_impure then
				error_listener.set_recovery_policy (Recover_with_warnings)
			end
			shared_decimal_context.set_digits (18)
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
			error_listener_set: error_listener = an_error_listener
			encoder_factory_set: encoder_factory = an_encoder_factory
		end

	make_with_defaults is
			-- Establish invariant using defaults.
		local
			a_system_function_factory: XM_XSLT_SYSTEM_FUNCTION_FACTORY
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
			an_encoder_factory: XM_XSLT_ENCODER_FACTORY
			a_catalog_resolver: XM_CATALOG_RESOLVER
		do
			create a_catalog_resolver
			create an_encoder_factory
			create a_system_function_factory
			create error_reporter.make_standard
			create an_error_listener.make (Recover_with_warnings, error_reporter)
			make (a_catalog_resolver, an_error_listener, a_system_function_factory, an_encoder_factory)
		end

feature -- Access

	are_external_functions_allowed: BOOLEAN
			-- Are extension functions allowed?

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	error_reporter: UT_ERROR_HANDLER
			-- Error reporter for standard error and trace listeners

	entity_resolver: XM_EXTERNAL_RESOLVER
			-- Entity resolver

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Encoder factory

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

	is_strip_all_white_space: BOOLEAN
			-- Is all white space to be stripped from source documents?

	is_tiny_tree_model: BOOLEAN
			-- Should the tiny tree model be used for XML source?

	recovery_policy: INTEGER
			-- Recovery policy when warnings or errors are encountered

	element_validator (a_receiver: XM_XPATH_RECEIVER; a_name_code: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE;
							 a_validation_action: INTEGER; a_validation_context: ANY): XM_XPATH_RECEIVER is
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

feature -- Element change

	set_digits (digits: INTEGER) is
			-- Set the preceision for decimal and integer arithmetic.
		require
			sufficient_precision: digits = 0 or else digits >= 18
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

	set_entity_resolver (an_entity_resolver: XM_EXTERNAL_RESOLVER) is
			-- Set `entity_resolver'.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
		do
			entity_resolver := an_entity_resolver
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
		end

	set_strip_all_white_space (strip_all_white_space: BOOLEAN) is
			-- Set `is_strip_all_white_space'.
		do
			is_strip_all_white_space := strip_all_white_space
		ensure
			set: is_strip_all_white_space = strip_all_white_space
		end

	set_recovery_policy (a_recovery_policy: INTEGER) is
			-- Set recovery policy.
		require
			valid_recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
		do
			recovery_policy := a_recovery_policy
			if error_listener.is_impure then
				error_listener.set_recovery_policy (recovery_policy)
			end
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

	use_tiny_tree_model (true_or_false: BOOLEAN) is
			-- Switch on/off use of tiny tree model for source XML.
		do
			is_tiny_tree_model := true_or_false
		ensure
			set: is_tiny_tree_model = true_or_false
		end

invariant

	entity_resolver_not_void: entity_resolver /= Void
	error_listener_not_void: error_listener /= Void
	error_reporter_not_void: error_reporter /= Void
	encoder_factory_not_void: 	encoder_factory /= Void
	recovery_policy: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover

end
