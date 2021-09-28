note

	description:

		"Eiffel dynamic type set builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET_BUILDER

feature -- Access

	current_dynamic_system: ET_DYNAMIC_SYSTEM
			-- Surrounding dynamic Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

	current_system: ET_SYSTEM
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

	set_fatal_error
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	set_catcall_error_mode (b: BOOLEAN)
			-- Set `catcall_error_mode' to `b'.
		do
			catcall_error_mode := b
		ensure
			catcall_error_mode_set: catcall_error_mode = b
		end

	set_catcall_warning_mode (b: BOOLEAN)
			-- Set `catcall_warning_mode' to `b'.
		do
			catcall_warning_mode := b
		ensure
			catcall_warning_mode_set: catcall_warning_mode = b
		end

	set_no_debug (b: BOOLEAN)
			-- Set `no_debug' to `b'.
		do
			no_debug := b
		ensure
			no_debug_set: no_debug = b
		end

	set_no_assertion (b: BOOLEAN)
			-- Set `no_assertion' to `b'.
		do
			no_assertion := b
		ensure
			no_assertion_set: no_assertion = b
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET
			-- New dynamic type set
		require
			a_type_not_void: a_type /= Void
		deferred
		ensure
			dynamic_type_set_not_void: Result /= Void
			static_type_set: Result.static_type = a_type
		end

feature -- Measurement

	dynamic_type_set_count: INTEGER
			-- Number of dynamic type sets created by `new_dynamic_type_set'

feature -- Generation

	build_dynamic_type_sets
			-- Build dynamic type sets for `current_dynamic_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		deferred
		end

	mark_type_alive (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Mark `a_type' as alive.
			-- This means that instances of that type can be created in the system.
			-- In case of reference type, we have to make sure that its 'dispose'
			-- feature, if it exists, is compiled into the system.
		require
			a_type_not_void: a_type /= Void
		local
			l_seed: INTEGER
		do
			if not a_type.is_alive then
				a_type.set_alive
				if a_type.is_expanded then
						-- Make sure that feature 'twin' is alive for expanded types.
						-- Note that this will make fetaure 'copy' alive as well
						-- because 'twin' calls 'copy' internally.
					l_seed := current_system.twin_seed
					if l_seed > 0 then
						if attached a_type.seeded_dynamic_query (l_seed, current_dynamic_system) as l_feature then
							l_feature.set_regular (True)
						end
					end
						-- Make sure that feature 'is_equal' is alive for expanded types.
					l_seed := current_system.is_equal_seed
					if l_seed > 0 then
						if attached a_type.seeded_dynamic_query (l_seed, current_dynamic_system) as l_feature then
							l_feature.set_regular (True)
						end
					end
				else
						-- Make sure that feature 'dispose' is alive for reference types.
					l_seed := current_system.dispose_seed
					if l_seed > 0 then
						if attached a_type.seeded_dynamic_procedure (l_seed, current_dynamic_system) as l_feature then
							l_feature.set_regular (True)
						end
					end
				end
				propagate_alive_conforming_descendants (a_type)
			end
		ensure
			a_type_alive: a_type.is_alive
		end

	mark_string_type_alive (a_string_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Make sure that `a_string_type' and the type of its 'area'
			-- are marked as alive.
		require
			a_string_type_not_void: a_string_type /= Void
		local
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
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
					mark_type_alive (l_dynamic_type_set.static_type.primary_type)
				end
			end
		ensure
			a_string_type_alive: a_string_type.is_alive
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := current_dynamic_system.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate `a_type' from target type set `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		deferred
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_tuple_label_expression_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL; a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Propagate dynamic types of the label in tuple `a_type' to
			-- the dynamic type set of the result type of `a_call'.
		require
			a_call_not_void: a_call /= Void
			tuple_label: a_call.is_tuple_label
			a_type_not_void: a_type /= Void
		deferred
		end

	propagate_tuple_label_setter_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL; a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Propagate dynamic types of the source of tuple label setter `a_call'
			-- to the dynamic type set of the corresponding tuple label in `a_type'.
		require
			a_call_not_void: a_call /= Void
			tuple_label: a_call.is_tuple_label
			a_type_not_void: a_type /= Void
		deferred
		end

feature {ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION, ET_DYNAMIC_EQUALITY_EXPRESSION} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internally in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_SYSTEM} -- Generation

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature `a_feature' corresponding to "INTERNAL.type_of_type".
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
		deferred
		end

	propagate_alive_conforming_descendants (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Propagage `a_type' to all `alive_conforming_descendants' to which it conforms.
		require
			a_type_not_void: a_type /= Void
			a_type_is_alive: a_type.is_alive
		do
			if attached alive_conforming_descendants_per_type as l_alive_conforming_descendants then
				from
					l_alive_conforming_descendants.start
				until
					l_alive_conforming_descendants.after
				loop
					l_alive_conforming_descendants.item_for_iteration.put_type_from_type_set (a_type, a_type, current_dynamic_system)
					l_alive_conforming_descendants.forth
				end
			end
		end

feature {ET_DYNAMIC_PRIMARY_TYPE, ET_DYNAMIC_SYSTEM} -- Generation

	propagate_reference_field_dynamic_types (a_attribute: ET_DYNAMIC_FEATURE)
			-- Propagate the dynamic types of the dynamic type set of
			-- `a_attribute' to the result type set of feature
			-- "ISE_RUNTIME.reference_field" (and similar features)
			-- if the static type of `a_attribute' is a reference type.
		require
			a_attribute_not_void: a_attribute /= Void
		deferred
		end

	propagate_set_reference_field_dynamic_types (a_attribute: ET_DYNAMIC_FEATURE)
			-- Propagate the dynamic types of the dynamic type set of
			-- the formal argument of feature "ISE_RUNTIME.set_reference_field"
			-- (and similar features) to the result type_set of `a_attribute'
			-- if the static type of `a_attribute' is a reference type.
		require
			a_attribute_not_void: a_attribute /= Void
		deferred
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_reference_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
			an_item_feature_not_void: an_item_feature /= Void
		deferred
		end

	build_tuple_put_reference (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
			a_put_feature_not_void: a_put_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		require
			an_agent_type_not_void: an_agent_type /= Void
			a_call_feature_not_void: a_call_feature /= Void
		deferred
		end

feature {ET_DYNAMIC_FEATURE} -- Generation

	object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of objects that have been registered through
			-- the object_id mechanism of class "IDENTIFIED" and related classes
		deferred
		ensure
			object_id_dynamic_type_set_not_void: Result /= Void
		end

	alive_conforming_descendants_per_type: detachable DS_HASH_TABLE [like new_dynamic_type_set, ET_DYNAMIC_TYPE]
			-- Dynamic type sets of all alive types which conform to a given type, indexed by this type.
			-- All the given types for which `alive_conforming_descendants' has been called are kept and
			-- updated in this table.

	alive_conforming_descendants (a_type: ET_DYNAMIC_TYPE): like new_dynamic_type_set
			-- Dynamic type set of all alive types which conform to `a_type'
		require
			a_type_not_void: a_type /= Void
		local
			l_alive_conforming_descendants_per_type: like alive_conforming_descendants_per_type
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE]
			l_primary_type: ET_DYNAMIC_PRIMARY_TYPE
			l_other_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
		do
			l_alive_conforming_descendants_per_type := alive_conforming_descendants_per_type
			if l_alive_conforming_descendants_per_type = Void then
				create l_alive_conforming_descendants_per_type.make_map_default
				alive_conforming_descendants_per_type := l_alive_conforming_descendants_per_type
			end
			l_alive_conforming_descendants_per_type.search (a_type)
			if l_alive_conforming_descendants_per_type.found then
				Result := l_alive_conforming_descendants_per_type.found_item
			else
				Result := new_dynamic_type_set (a_type)
				l_alive_conforming_descendants_per_type.force_last_new (Result, a_type)
				if Result /= a_type then
					l_primary_type := a_type.primary_type
					l_dynamic_types := current_dynamic_system.dynamic_types
					nb := l_dynamic_types.count
					from i := 1 until i > nb loop
						l_other_type := l_dynamic_types.item (i)
						if l_other_type.is_alive then
							Result.put_type_from_type_set (l_other_type, l_other_type, current_dynamic_system)
						end
						i := i + 1
					end
				end
			end
		ensure
			alive_conforming_descendants_not_void: Result /= Void
		end

invariant

	current_dynamic_system_not_void: current_dynamic_system /= Void

end
