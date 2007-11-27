indexing

	description:

		"Eiffel dynamic type set builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET_BUILDER

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when building
			-- dynamic type sets?

	catcall_error_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?

	catcall_warning_mode: BOOLEAN
			-- Are CAT-call errors considered just as warnings?

	no_debug: BOOLEAN
			-- Should debug instructions be ignored?

	no_assertion: BOOLEAN
			-- Should assertions be ignored?

feature -- Status setting

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	set_catcall_error_mode (b: BOOLEAN) is
			-- Set `catcall_error_mode' to `b'.
		do
			catcall_error_mode := b
		ensure
			catcall_error_mode_set: catcall_error_mode = b
		end

	set_catcall_warning_mode (b: BOOLEAN) is
			-- Set `catcall_warning_mode' to `b'.
		do
			catcall_warning_mode := b
		ensure
			catcall_warning_mode_set: catcall_warning_mode = b
		end

	set_no_debug (b: BOOLEAN) is
			-- Set `no_debug' to `b'.
		do
			no_debug := b
		ensure
			no_debug_set: no_debug = b
		end

	set_no_assertion (b: BOOLEAN) is
			-- Set `no_assertion' to `b'.
		do
			no_assertion := b
		ensure
			no_assertion_set: no_assertion = b
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		require
			a_type_not_void: a_type /= Void
		deferred
		ensure
			dynamic_type_set_not_void: Result /= Void
			static_type_set: Result.static_type = a_type
		end

feature -- Generation

	build_dynamic_type_sets is
			-- Build dynamic type sets for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		deferred
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := current_system.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		deferred
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
			an_item_feature_not_void: an_item_feature /= Void
		deferred
		end

	build_tuple_put (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
			a_put_feature_not_void: a_put_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		require
			an_agent_type_not_void: an_agent_type /= Void
			a_call_feature_not_void: a_call_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_FEATURE} -- Generation

	object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set of objects that have been registered through
			-- the object_id mechanism of class "IDENTIFIED" and related classes
		deferred
		ensure
			object_id_dynamic_type_set_not_void: Result /= Void
		end

invariant

	current_system_not_void: current_system /= Void

end
