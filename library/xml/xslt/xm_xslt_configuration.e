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

creation

	make, make_with_defaults

feature {NONE} -- Initialization

	make (an_entity_resolver: XM_URI_EXTERNAL_RESOLVER; an_error_listener: XM_XSLT_ERROR_LISTENER) is
			-- Establish invariant.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
			error_listener_not_void: an_error_listener /= Void
		do
			set_string_mode_mixed
			entity_resolver := an_entity_resolver
			name_pool := default_pool.default_pool
			recovery_policy := Recover_with_warnings
			error_listener := an_error_listener
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
			error_listener_set: error_listener = an_error_listener
		end

	make_with_defaults is
			-- Establish invariant using defaults.
		local
			an_error_listener: XM_XSLT_DEFAULT_ERROR_LISTENER
		do
			create an_error_listener.make
			make (new_file_resolver_current_directory, an_error_listener)
		end

feature -- Access

	are_external_functions_allowed: BOOLEAN
			-- Are extension functions allowed?

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	entity_resolver: XM_URI_EXTERNAL_RESOLVER
			-- Entity resolver

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

	is_strip_all_white_space: BOOLEAN
			-- Is all white space to be stripped from source documents?

	is_tiny_tree_model: BOOLEAN
			-- Should the tiny tree model be used for XML source?

	recovery_policy: INTEGER
			-- Recovery policy when warnings or errors are encountered

	element_validator (a_receiver: XM_XPATH_RECEIVER; a_name_code: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE;
							 a_validation_action: INTEGER; a_validation_context: ANY; a_name_pool: XM_XPATH_NAME_POOL): XM_XPATH_RECEIVER is
			-- A receiver that can be used to validate an element,
			--  and that passes the validated element on to a target receiver.
			-- If validation is not supported, the returned receiver
			--  will be the target receiver.
		require
			current_receiver_not_void: a_receiver /= Void
			name_pool_not_void: a_name_pool /= Void
			validation_action: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
			-- Not sure about the others - anyway, they are not used yet
		do

			-- Basix XSLT processor version

			Result := a_receiver
		ensure
			element_validator_not_void: Result /= Void
		end

feature -- Element change
	
	set_line_numbering (on_or_off: BOOLEAN) is
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
		end

	set_entity_resolver (an_entity_resolver: XM_URI_EXTERNAL_RESOLVER) is
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

end
