indexing

	description:

		"Eiffel dynamic type set builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2009, Eric Bezault and others"
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
			l_feature: ET_DYNAMIC_FEATURE
			l_seed: INTEGER
		do
			if not a_type.is_alive then
				a_type.set_alive
					-- Make sure that feature 'dispose' is alive for reference types.
				if not a_type.is_expanded then
					l_seed := current_system.dispose_seed
					if l_seed > 0 then
						l_feature := a_type.seeded_dynamic_procedure (l_seed, current_dynamic_system)
						if l_feature /= Void then
							l_feature.set_regular (True)
						end
					end
				end
			end
		ensure
			a_type_alive: a_type.is_alive
		end

	mark_string_type_alive (a_string_type: ET_DYNAMIC_TYPE) is
			-- Make sure that `a_string_type' and the type of its 'area'
			-- are marked as alive.
		require
			a_string_type_not_void: a_string_type /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			mark_type_alive (a_string_type)
			if a_string_type.attribute_count < 2 then
					-- Internal error: class "STRING" should have at least the
					-- features 'area' and 'count' as first features.
					-- Already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
				set_fatal_error
				error_handler.report_giaaa_error
			else
					-- Attribute 'area'.
				l_dynamic_type_set := a_string_type.queries.item (1).result_type_set
				if l_dynamic_type_set = Void then
						-- Error in feature 'area', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					mark_type_alive (l_dynamic_type_set.static_type)
				end
			end
		ensure
			a_string_type_alive: a_string_type.is_alive
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

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_tuple_label_expression_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL; a_type: ET_DYNAMIC_TYPE) is
			-- Propagate dynamic types of the label in tuple `a_type' to
			-- the dynamic type set of the result type of `a_call'.
		require
			a_call_not_void: a_call /= Void
			tuple_label: a_call.is_tuple_label
			a_type_not_void: a_type /= Void
		deferred
		end

	propagate_tuple_label_setter_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL; a_type: ET_DYNAMIC_TYPE) is
			-- Propagate dynamic types of the source of tuple label setter `a_call'
			-- to the dynamic type set of the corresponding tuple label in `a_type'.
		require
			a_call_not_void: a_call /= Void
			tuple_label: a_call.is_tuple_label
			a_type_not_void: a_type /= Void
		deferred
		end

feature {ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION, ET_DYNAMIC_EQUALITY_EXPRESSION} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internally in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_SYSTEM} -- Generation

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature `a_feature' corresponding to "INTERNAL.type_of_type".
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
