indexing

	description:

		"Eiffel dynamic type set builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET_BUILDER

feature -- Access

	current_dynamic_system: ET_DYNAMIC_SYSTEM
			-- Surrounding dynamic Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

	current_system: ET_SYSTEM is
			-- Surrounding Eiffel system
		do
			Result := current_dynamic_system.current_system
		ensure
			current_system_not_void: Result /= Void
		end

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
			-- Build dynamic type sets for `current_dynamic_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		deferred
		end

	mark_type_alive (a_type: ET_DYNAMIC_TYPE) is
			-- Mark `a_type' as alive.
			-- This means that instances of that type can be created in the system.
			-- In case of reference type, we have to make sure that its 'dispose'
			-- feature, if it exists, is compiled into the system.
		require
			a_type_not_void: a_type /= Void
		local
			l_dispose_procedure: ET_DYNAMIC_FEATURE
			l_dispose_seed: INTEGER
		do
			if not a_type.is_alive then
				a_type.set_alive
				if not a_type.is_expanded then
					l_dispose_seed := current_system.dispose_seed
					if l_dispose_seed > 0 then
						l_dispose_procedure := a_type.seeded_dynamic_procedure (l_dispose_seed, current_dynamic_system)
						if l_dispose_procedure /= Void then
							l_dispose_procedure.set_regular (True)
						end
					end
				end
			end
		ensure
			a_type_alive: a_type.is_alive
		end

	mark_string_type_alive (a_universe: ET_UNIVERSE) is
			-- Make sure that `string_type' and its dependent types
			-- are marked as alive when in the context of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_string_type: ET_DYNAMIC_TYPE
			l_string_universe: ET_UNIVERSE
			l_special_type: ET_DYNAMIC_TYPE
			l_special_universe: ET_UNIVERSE
		do
			l_string_type := current_dynamic_system.string_type (a_universe)
			mark_type_alive (l_string_type)
			l_string_universe := l_string_type.base_class.universe
			if l_string_universe /= Void then
					-- Make sure that type "SPECIAL [CHARACTER]" (used in
					-- feature 'area') is marked as alive.
				l_special_type := current_dynamic_system.special_character_type (l_string_universe)
				mark_type_alive (l_special_type)
					-- Make sure that type "INTEGER" (used in attribute 'count') is marked as alive.
				mark_type_alive (current_dynamic_system.integer_type (l_string_universe))
				l_special_universe := l_special_type.base_class.universe
				if l_special_universe /= Void then
						-- Make sure that type "CHARACTER" (used as actual generic type
						-- of "SPECIAL [CHARACTER]" in feature 'area') is marked as alive.
					mark_type_alive (current_dynamic_system.character_type (l_special_universe))
						-- Make sure that type "INTEGER" (used in attribute 'count') is marked as alive.
					mark_type_alive (current_dynamic_system.integer_type (l_special_universe))
				end
			end
		ensure
			string_type_alive: current_dynamic_system.string_type (a_universe).is_alive
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := current_dynamic_system.error_handler
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

feature {ET_DYNAMIC_SYSTEM} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internal in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
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

	current_dynamic_system_not_void: current_dynamic_system /= Void

end
