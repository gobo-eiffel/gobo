indexing

	description:

		"Eiffel dynamic type builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE_BUILDER

inherit

	ET_DYNAMIC_TYPE_SET_BUILDER
		undefine
			error_handler,
			set_fatal_error
		redefine
			has_fatal_error
		end

	ET_FEATURE_CHECKER
		rename
			make as make_feature_checker
		redefine
			has_fatal_error,
			check_external_function_validity,
			check_external_procedure_validity,
			check_check_instruction_validity,
			check_debug_instruction_validity,
			check_loop_invariant_validity,
			check_loop_variant_validity,
			report_assignment,
			report_assignment_attempt,
			report_attribute_address,
			report_attribute_assignment_target,
			report_bit_constant,
			report_boolean_constant,
			report_character_constant,
			report_builtin_conversion,
			report_creation_expression,
			report_creation_instruction,
			report_current,
			report_current_type_needed,
			report_double_constant,
			report_equality_expression,
			report_formal_argument,
			report_formal_argument_declaration,
			report_function_address,
			report_inline_agent_formal_argument_declaration,
			report_inline_agent_local_variable_declaration,
			report_inline_agent_result_declaration,
			report_integer_constant,
			report_integer_8_constant,
			report_integer_16_constant,
			report_integer_32_constant,
			report_integer_64_constant,
			report_natural_constant,
			report_natural_8_constant,
			report_natural_16_constant,
			report_natural_32_constant,
			report_natural_64_constant,
			report_local_assignment_target,
			report_local_variable,
			report_local_variable_declaration,
			report_manifest_array,
			report_manifest_tuple,
			report_manifest_type,
			report_pointer_expression,
			report_precursor_expression,
			report_precursor_instruction,
			report_procedure_address,
			report_procedure_inline_agent,
			report_qualified_call_expression,
			report_qualified_call_instruction,
			report_qualified_procedure_call_agent,
			report_qualified_query_call_agent,
			report_query_inline_agent,
			report_real_constant,
			report_result,
			report_result_assignment_target,
			report_static_call_expression,
			report_static_call_instruction,
			report_string_constant,
			report_strip_expression,
			report_tuple_label_call_agent,
			report_tuple_label_expression,
			report_tuple_label_setter,
			report_typed_pointer_expression,
			report_unqualified_call_expression,
			report_unqualified_call_instruction,
			report_unqualified_procedure_call_agent,
			report_unqualified_query_call_agent,
			report_void_constant
		end

	ET_TOKEN_CODES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system: like current_system) is
			-- Create a new dynamic type set builder.
		require
			a_system_not_void: a_system /= Void
		do
			current_system := a_system
			make_feature_checker (a_system.universe)
			current_dynamic_type := dummy_dynamic_type
			current_dynamic_feature := dummy_dynamic_feature
			create dynamic_type_sets.make_with_capacity (1000)
			object_id_dynamic_type_set := dummy_dynamic_type
			create current_index.make (0)
			create result_index.make (0)
			create character_index.make (0)
			create boolean_index.make (0)
			create double_index.make (0)
			create real_index.make (0)
			create integer_index.make (0)
			create integer_8_index.make (0)
			create integer_16_index.make (0)
			create integer_32_index.make (0)
			create integer_64_index.make (0)
			create natural_index.make (0)
			create natural_8_index.make (0)
			create natural_16_index.make (0)
			create natural_32_index.make (0)
			create natural_64_index.make (0)
			create pointer_index.make (0)
			create none_index.make (0)
			create string_index.make (0)
		ensure
			current_system_set: current_system = a_system
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		do
			Result := a_type
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when building
			-- dynamic type sets?

feature -- Generation

	build_dynamic_type_sets is
			-- Build dynamic type sets for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_other_type: ET_DYNAMIC_TYPE
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			k, nb3: INTEGER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_call: ET_DYNAMIC_QUALIFIED_CALL
			l_count: INTEGER
			old_nb: INTEGER
			old_object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			has_fatal_error := False
			old_object_id_dynamic_type_set := object_id_dynamic_type_set
			object_id_dynamic_type_set := new_dynamic_type_set (current_system.any_type)
			l_dynamic_types := current_system.dynamic_types
			is_built := False
			from until is_built loop
				is_built := True
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
						-- Process dynamic queries.
					l_features := l_type.queries
					nb2 := l_features.count
					from j := 1 until j > nb2 loop
						l_feature := l_features.item (j)
						if not l_feature.is_built then
							is_built := False
							build_feature_dynamic_type_sets (l_feature, l_type)
								-- `build_feature_dynamic_type_sets' may have
								-- added other features to the list.
							nb2 := l_features.count
								-- `build_feature_dynamic_type_sets' may have
								-- added other types to the list.
							nb := l_dynamic_types.count
							l_precursor := l_feature.first_precursor
							if l_precursor /= Void then
								if not l_precursor.is_built then
									is_built := False
									build_feature_dynamic_type_sets (l_precursor, l_type)
										-- `build_feature_dynamic_type_sets' may have
										-- added other features to the list.
									nb2 := l_features.count
										-- `build_feature_dynamic_type_sets' may have
										-- added other types to the list.
									nb := l_dynamic_types.count
								end
								l_other_precursors := l_feature.other_precursors
								if l_other_precursors /= Void then
									nb3 := l_other_precursors.count
									from k := 1 until k > nb3 loop
										l_precursor := l_other_precursors.item (k)
										if not l_precursor.is_built then
											is_built := False
											build_feature_dynamic_type_sets (l_precursor, l_type)
												-- `build_feature_dynamic_type_sets' may have
												-- added other precursors to the list.
											nb3 := l_other_precursors.count
												-- `build_feature_dynamic_type_sets' may have
												-- added other features to the list.
											nb2 := l_features.count
												-- `build_feature_dynamic_type_sets' may have
												-- added other types to the list.
											nb := l_dynamic_types.count
										end
										k := k + 1
									end
								end
							end
						end
						j := j + 1
					end
						-- Process dynamic procedures.
					l_features := l_type.procedures
					nb2 := l_features.count
					from j := 1 until j > nb2 loop
						l_feature := l_features.item (j)
						if not l_feature.is_built then
							is_built := False
							build_feature_dynamic_type_sets (l_feature, l_type)
								-- `build_feature_dynamic_type_sets' may have
								-- added other features to the list.
							nb2 := l_features.count
								-- `build_feature_dynamic_type_sets' may have
								-- added other types to the list.
							nb := l_dynamic_types.count
							l_precursor := l_feature.first_precursor
							if l_precursor /= Void then
								if not l_precursor.is_built then
									is_built := False
									build_feature_dynamic_type_sets (l_precursor, l_type)
										-- `build_feature_dynamic_type_sets' may have
										-- added other features to the list.
									nb2 := l_features.count
										-- `build_feature_dynamic_type_sets' may have
										-- added other types to the list.
									nb := l_dynamic_types.count
								end
								l_other_precursors := l_feature.other_precursors
								if l_other_precursors /= Void then
									nb3 := l_other_precursors.count
									from k := 1 until k > nb3 loop
										l_precursor := l_other_precursors.item (k)
										if not l_precursor.is_built then
											is_built := False
											build_feature_dynamic_type_sets (l_precursor, l_type)
												-- `build_feature_dynamic_type_sets' may have
												-- added other precursors to the list.
											nb3 := l_other_precursors.count
												-- `build_feature_dynamic_type_sets' may have
												-- added other features to the list.
											nb2 := l_features.count
												-- `build_feature_dynamic_type_sets' may have
												-- added other types to the list.
											nb := l_dynamic_types.count
										end
										k := k + 1
									end
								end
							end
						end
						j := j + 1
					end
						-- Process dynamic qualified query calls.
					from
						l_call := l_type.query_calls
					until
						l_call = Void
					loop
						l_count := l_call.count
						l_call.propagate_types (Current)
						if l_call.count /= l_count then
							is_built := False
						end
						l_call := l_call.next
					end
						-- Process dynamic qualified procedure calls.
					from
						l_call := l_type.procedure_calls
					until
						l_call = Void
					loop
						l_count := l_call.count
						l_call.propagate_types (Current)
						if l_call.count /= l_count then
							is_built := False
						end
						l_call := l_call.next
					end
					i := i + 1
				end
					-- Process dynamic types.
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					from
						if l_type.was_alive then
							j := old_nb + 1
						elseif l_type.is_alive then
							j := 1
							l_type.set_was_alive
						else
							j := nb + 1
						end
					until
						j > nb
					loop
						l_other_type := l_dynamic_types.item (j)
						if l_type.conforms_to_type (l_other_type, current_system) then
							l_other_type.put_type (l_type)
						end
						j := j + 1
					end
					i := i + 1
				end
				old_nb := nb
			end
			check_catcall_validity
			object_id_dynamic_type_set := old_object_id_dynamic_type_set
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_CALL_COMPONENT
			l_seed: INTEGER
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_target_type_set := a_call.target_type_set
			l_static_call := a_call.static_call
			l_seed := l_static_call.name.seed
			l_dynamic_feature := a_call.seeded_dynamic_feature (l_seed, a_type, current_system)
			if l_dynamic_feature = Void then
				if a_type.conforms_to_type (l_target_type_set.static_type, current_system) then
						-- Internal error: there should be a feature with seed
						-- `l_seed' in all descendants of `l_target_type_set.static_type'.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					-- The error has already been reported somewhere else.
				end
			else
				l_dynamic_feature.set_regular (True)
			end
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		do
			-- Do nothing.
		end

	build_tuple_put (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		do
			-- Do nothing.
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		do
			-- Do nothing
		end

feature {ET_DYNAMIC_FEATURE} -- Generation

	object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of objects that have been registered through
			-- the object_id mechanism of class "IDENTIFIED" and related classes

feature {NONE} -- Generation

	is_built: BOOLEAN
			-- Have the dynamic type sets of `current_system' all been built?

	build_feature_dynamic_type_sets (a_feature: ET_DYNAMIC_FEATURE; a_current_dynamic_type: ET_DYNAMIC_TYPE) is
			-- Build dynamic type sets for `a_feature' in `a_current_dynamic_type'.
		require
			a_feature_not_void: a_feature /= Void
			a_current_dynamic_type_not_void: a_current_dynamic_type /= Void
		local
			old_feature: ET_DYNAMIC_FEATURE
			old_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			old_feature := current_dynamic_feature
			current_dynamic_feature := a_feature
			old_type := current_dynamic_type
			current_dynamic_type := a_current_dynamic_type
				-- Dynamic type sets for arguments are stored first
				-- in `dynamic_type_sets'.
			l_argument_type_sets := a_feature.dynamic_type_sets
			nb := l_argument_type_sets.count
			from i := 1 until i > nb loop
				dynamic_type_sets.force_last (l_argument_type_sets.item (i))
				i := i + 1
			end
			a_feature.set_dynamic_type_sets (dynamic_type_sets)
			had_error := has_fatal_error
			a_feature.set_current_type_needed (False)
			if a_feature.is_precursor then
				check_precursor_feature_validity (a_feature.static_feature, a_current_dynamic_type.base_type)
			else
				check_feature_validity (a_feature.static_feature, a_current_dynamic_type.base_type)
			end
			if had_error then
				set_fatal_error
			end
			nb := dynamic_type_sets.count
			create l_dynamic_type_sets.make_with_capacity (nb)
			from i := 1 until i > nb loop
				l_dynamic_type_sets.put_last (dynamic_type_sets.item (i))
				i := i + 1
			end
			a_feature.set_dynamic_type_sets (l_dynamic_type_sets)
			a_feature.set_built (True)
			current_index.put (0)
			result_index.put (0)
			character_index.put (0)
			boolean_index.put (0)
			double_index.put (0)
			real_index.put (0)
			integer_index.put (0)
			integer_8_index.put (0)
			integer_16_index.put (0)
			integer_32_index.put (0)
			integer_64_index.put (0)
			natural_index.put (0)
			natural_8_index.put (0)
			natural_16_index.put (0)
			natural_32_index.put (0)
			natural_64_index.put (0)
			pointer_index.put (0)
			none_index.put (0)
			string_index.put (0)
			dynamic_type_sets.wipe_out
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
		end

feature {NONE} -- CAT-calls

	check_catcall_validity is
			-- Check CAT-call validity.
		local
			i, nb: INTEGER
			l_call: ET_DYNAMIC_QUALIFIED_CALL
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				from
					l_call := l_type.query_calls
				until
					l_call = Void
				loop
					check_catcall_call_validity (l_call)
					l_call := l_call.next
				end
				from
					l_call := l_type.procedure_calls
				until
					l_call = Void
				loop
					check_catcall_call_validity (l_call)
					l_call := l_call.next
				end
				i := i + 1
			end
		end

	check_catcall_call_validity (a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Check CAT-call validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_feature: ET_FEATURE
			i, nb: INTEGER
		do
			l_feature := a_call.current_feature.static_feature.implementation_feature
			if
				l_feature.implementation_class.name.same_class_name (tilde_class_name) and then
				l_feature.name.same_feature_name (tilde_feature_name)
			then
				-- This feature is supposed to simulate the forthcoming
				-- '~' operator introduced in ECMA Eiffel 367.
			else
				l_target_type_set := a_call.target_type_set
				nb := l_target_type_set.count
				from i := 1 until i > nb loop
					check_catcall_target_validity (l_target_type_set.dynamic_type (i), a_call)
					i := i + 1
				end
			end
		end

	check_catcall_target_validity (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Check whether target type `a_type' introduces CAT-calls in `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		local
			l_seed: INTEGER
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_actuals: ET_ARGUMENT_OPERANDS
			l_current_feature: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			j, nb2: INTEGER
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type: ET_DYNAMIC_TYPE
		do
			l_seed := a_call.static_call.name.seed
			l_dynamic_feature := a_call.seeded_dynamic_feature (l_seed, a_type, current_system)
			if l_dynamic_feature = Void then
					-- Internal error: there should be a feature with seed
					-- `l_seed' in all descendants of `a_call.target_type_set.static_type'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_actuals := a_call.static_call.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb > 0 then
						l_current_feature := a_call.current_feature
						from i := 1 until i > nb loop
							l_target_type_set := l_dynamic_feature.argument_type_set (i)
							if l_target_type_set = Void then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of formal arguments in
									-- feature redeclaration.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_target_type := l_target_type_set.static_type
								l_source_type_set := l_current_feature.dynamic_type_set (l_actuals.actual_argument (i))
								if l_source_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									nb2 := l_source_type_set.count
									from j := 1 until j > nb2 loop
										l_source_type := l_source_type_set.dynamic_type (j)
										if not l_source_type.conforms_to_type (l_target_type, current_system) then
											report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_source_type, a_call)
										end
										j := j + 1
									end
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	report_catcall_error (a_target_type: ET_DYNAMIC_TYPE; a_dynamic_feature: ET_DYNAMIC_FEATURE;
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; an_actual_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Report a CAT-call error in `a_call'. When the target is of type `a_target_type', we
			-- try to pass to the corresponding feature `a_dynamic_feature' an actual
			-- argument of type `an_actual_type' which does not conform to the type of
			-- the `arg'-th corresponding formal argument `a_formal_type'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_dynamic_feature_not_void: a_dynamic_feature /= Void
			a_formal_type_not_void: a_formal_type /= Void
			an_actual_type_not_void: an_actual_type /= Void
			a_call_not_void: a_call /= Void
		local
			l_message: STRING
			l_class_impl: ET_CLASS
			l_position: ET_POSITION
		do
			if False then
-- TODO: better error message reporting.
			l_message := shared_error_message
			STRING_.wipe_out (l_message)
			l_message.append_string ("[CATCALL] class ")
			l_message.append_string (a_call.current_type.base_type.to_text)
			l_message.append_string (" (")
			l_class_impl := a_call.current_feature.static_feature.implementation_class
			if a_call.current_type.base_type.direct_base_class (universe) /= l_class_impl then
				l_message.append_string (l_class_impl.upper_name)
				l_message.append_character (',')
			end
			l_position := a_call.position
			l_message.append_string (l_position.line.out)
			l_message.append_character (',')
			l_message.append_string (l_position.column.out)
			l_message.append_string ("): type '")
			l_message.append_string (an_actual_type.base_type.to_text)
			l_message.append_string ("' of actual argument #")
			l_message.append_string (arg.out)
			l_message.append_string (" does not conform to type '")
			l_message.append_string (a_formal_type.base_type.to_text)
			l_message.append_string ("' of formal argument in feature `")
			l_message.append_string (a_dynamic_feature.static_feature.name.name)
			l_message.append_string ("' in class '")
			l_message.append_string (a_target_type.base_type.to_text)
			l_message.append_string ("%'")
			if catcall_mode then
					-- CAT-calls are considered as fatal errors.
				set_fatal_error
			end
			error_handler.report_catcall_error (l_message)
			STRING_.wipe_out (l_message)
			end
		end

	shared_error_message: STRING is
			-- Shared error message (used in `report_catcall_error')
		once
			create Result.make (200)
		ensure
			shared_error_message_not_void: Result /= Void
		end

feature {NONE} -- Feature validity

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			Precursor (a_feature)
			if not has_fatal_error then
				if a_feature.is_builtin then
					check_external_builtin_function_validity (a_feature)
				elseif a_feature.type.same_base_type (universe.string_class, current_type, current_type, universe) then
					if current_type = current_dynamic_type.base_type then
						current_system.set_string_type_alive
						propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
					end
				elseif not a_feature.type.is_type_expanded (current_type, universe) then
-- TODO: build full dynamic type sets, recursively.
print ("Dynamic type set not built for external feature " + current_type.to_text + "." + a_feature.lower_name + "%N")
				end
			end
		end

	check_external_builtin_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				check_external_builtin_any_function_validity (a_feature)
			when builtin_arguments_class then
				check_external_builtin_arguments_function_validity (a_feature)
			when builtin_boolean_class then
				check_external_builtin_boolean_function_validity (a_feature)
			when builtin_character_8_class then
				check_external_builtin_sized_character_function_validity (a_feature, current_system.character_8_type)
			when builtin_character_32_class then
				check_external_builtin_sized_character_function_validity (a_feature, current_system.character_32_type)
			when builtin_function_class then
				check_external_builtin_function_function_validity (a_feature)
			when builtin_identified_class then
				check_external_builtin_identified_function_validity (a_feature)
			when builtin_integer_8_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.integer_8_type)
			when builtin_integer_16_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.integer_16_type)
			when builtin_integer_32_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.integer_32_type)
			when builtin_integer_64_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.integer_64_type)
			when builtin_natural_8_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.natural_8_type)
			when builtin_natural_16_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.natural_16_type)
			when builtin_natural_32_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.natural_32_type)
			when builtin_natural_64_class then
				check_external_builtin_sized_integer_function_validity (a_feature, current_system.natural_64_type)
			when builtin_platform_class then
				check_external_builtin_platform_function_validity (a_feature)
			when builtin_pointer_class then
				check_external_builtin_pointer_function_validity (a_feature)
			when builtin_real_32_class then
				check_external_builtin_sized_real_function_validity (a_feature, current_system.real_32_type)
			when builtin_real_64_class then
				check_external_builtin_sized_real_function_validity (a_feature, current_system.real_64_type)
			when builtin_special_class then
				check_external_builtin_special_function_validity (a_feature)
			when builtin_type_class then
				check_external_builtin_type_function_validity (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_any_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "ANY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_conforms_to then
				report_builtin_any_conforms_to (a_feature)
			when builtin_any_deep_twin then
				report_builtin_any_deep_twin (a_feature)
			when builtin_any_generating_type then
				report_builtin_any_generating_type (a_feature)
			when builtin_any_tagged_out then
				report_builtin_any_tagged_out (a_feature)
			when builtin_any_generating_type2 then
				report_builtin_any_generating_type2 (a_feature)
			when builtin_any_generator then
				report_builtin_any_generator (a_feature)
			when builtin_any_is_deep_equal then
				report_builtin_any_is_deep_equal (a_feature)
			when builtin_any_same_type then
				report_builtin_any_same_type (a_feature)
			when builtin_any_standard_is_equal then
				report_builtin_any_standard_is_equal (a_feature)
			when builtin_any_standard_twin then
				report_builtin_any_standard_twin (a_feature)
			when builtin_any_twin then
				report_builtin_any_twin (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_arguments_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "ARGUMENTS".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_arguments: (a_feature.builtin_code // builtin_capacity) = builtin_arguments_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_arguments_argument then
				report_builtin_arguments_argument (a_feature)
			when builtin_arguments_argument_count then
				report_builtin_arguments_argument_count (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_boolean_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "BOOLEAN" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_and then
				report_builtin_boolean_and (a_feature)
			when builtin_boolean_and_then then
				report_builtin_boolean_and_then (a_feature)
			when builtin_boolean_implies then
				report_builtin_boolean_implies (a_feature)
			when builtin_boolean_item then
				report_builtin_boolean_item (a_feature)
			when builtin_boolean_not then
				report_builtin_boolean_not (a_feature)
			when builtin_boolean_or then
				report_builtin_boolean_or (a_feature)
			when builtin_boolean_or_else then
				report_builtin_boolean_or_else (a_feature)
			when builtin_boolean_xor then
				report_builtin_boolean_xor (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_function_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "FUNCTION".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_function: (a_feature.builtin_code // builtin_capacity) = builtin_function_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_function_item then
				report_builtin_function_item (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_identified_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "IDENTIFIED" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_id_object then
				report_builtin_identified_eif_id_object (a_feature)
			when builtin_identified_eif_object_id then
				report_builtin_identified_eif_object_id (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_platform_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "PLATFORM".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_platform: (a_feature.builtin_code // builtin_capacity) = builtin_platform_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_platform_boolean_bytes then
				report_builtin_platform_boolean_bytes (a_feature)
			when builtin_platform_character_bytes then
				report_builtin_platform_character_bytes (a_feature)
			when builtin_platform_integer_bytes then
				report_builtin_platform_integer_bytes (a_feature)
			when builtin_platform_is_dotnet then
				report_builtin_platform_is_dotnet (a_feature)
			when builtin_platform_is_thread_capable then
				report_builtin_platform_is_thread_capable (a_feature)
			when builtin_platform_is_unix then
				report_builtin_platform_is_unix (a_feature)
			when builtin_platform_is_vms then
				report_builtin_platform_is_vms (a_feature)
			when builtin_platform_is_windows then
				report_builtin_platform_is_windows (a_feature)
			when builtin_platform_pointer_bytes then
				report_builtin_platform_pointer_bytes (a_feature)
			when builtin_platform_real_bytes then
				report_builtin_platform_real_bytes (a_feature)
			when builtin_platform_wide_character_bytes then
				report_builtin_platform_wide_character_bytes (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_pointer_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "POINTER" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_hash_code then
				report_builtin_pointer_hash_code (a_feature)
			when builtin_pointer_item then
				report_builtin_pointer_item (a_feature)
			when builtin_pointer_out then
				report_builtin_pointer_out (a_feature)
			when builtin_pointer_plus then
				report_builtin_pointer_plus (a_feature)
			when builtin_pointer_to_integer_32 then
				report_builtin_pointer_to_integer_32 (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_character_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in sized character type `a_character_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_character_type_not_void: a_character_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_code then
				report_builtin_sized_character_code (a_feature, a_character_type)
			when builtin_character_item then
				report_builtin_sized_character_item (a_feature, a_character_type)
			when builtin_character_natural_32_code then
				report_builtin_sized_character_natural_32_code (a_feature, a_character_type)
			when builtin_character_to_character_8 then
				report_builtin_sized_character_to_character_8 (a_feature, a_character_type)
			when builtin_character_to_character_32 then
				report_builtin_sized_character_to_character_32 (a_feature, a_character_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_integer_function_validity (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in sized integer type `an_integer_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			an_integer_type_not_void: an_integer_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_as_integer_8 then
				report_builtin_sized_integer_as_integer_8 (a_feature, an_integer_type)
			when builtin_integer_as_integer_16 then
				report_builtin_sized_integer_as_integer_16 (a_feature, an_integer_type)
			when builtin_integer_as_integer_32 then
				report_builtin_sized_integer_as_integer_32 (a_feature, an_integer_type)
			when builtin_integer_as_integer_64 then
				report_builtin_sized_integer_as_integer_64 (a_feature, an_integer_type)
			when builtin_integer_as_natural_8 then
				report_builtin_sized_integer_as_natural_8 (a_feature, an_integer_type)
			when builtin_integer_as_natural_16 then
				report_builtin_sized_integer_as_natural_16 (a_feature, an_integer_type)
			when builtin_integer_as_natural_32 then
				report_builtin_sized_integer_as_natural_32 (a_feature, an_integer_type)
			when builtin_integer_as_natural_64 then
				report_builtin_sized_integer_as_natural_64 (a_feature, an_integer_type)
			when builtin_integer_bit_and then
				report_builtin_sized_integer_bit_and (a_feature, an_integer_type)
			when builtin_integer_bit_not then
				report_builtin_sized_integer_bit_not (a_feature, an_integer_type)
			when builtin_integer_bit_or then
				report_builtin_sized_integer_bit_or (a_feature, an_integer_type)
			when builtin_integer_bit_shift_left then
				report_builtin_sized_integer_bit_shift_left (a_feature, an_integer_type)
			when builtin_integer_bit_shift_right then
				report_builtin_sized_integer_bit_shift_right (a_feature, an_integer_type)
			when builtin_integer_bit_xor then
				report_builtin_sized_integer_bit_xor (a_feature, an_integer_type)
			when builtin_integer_div then
				report_builtin_sized_integer_div (a_feature, an_integer_type)
			when builtin_integer_divide then
				report_builtin_sized_integer_divide (a_feature, an_integer_type)
			when builtin_integer_identity then
				report_builtin_sized_integer_identity (a_feature, an_integer_type)
			when builtin_integer_item then
				report_builtin_sized_integer_item (a_feature, an_integer_type)
			when builtin_integer_lt then
				report_builtin_sized_integer_lt (a_feature, an_integer_type)
			when builtin_integer_minus then
				report_builtin_sized_integer_minus (a_feature, an_integer_type)
			when builtin_integer_mod then
				report_builtin_sized_integer_mod (a_feature, an_integer_type)
			when builtin_integer_opposite then
				report_builtin_sized_integer_opposite (a_feature, an_integer_type)
			when builtin_integer_plus then
				report_builtin_sized_integer_plus (a_feature, an_integer_type)
			when builtin_integer_power then
				report_builtin_sized_integer_power (a_feature, an_integer_type)
			when builtin_integer_times then
				report_builtin_sized_integer_times (a_feature, an_integer_type)
			when builtin_integer_to_character_8 then
				report_builtin_sized_integer_to_character_8 (a_feature, an_integer_type)
			when builtin_integer_to_character_32 then
				report_builtin_sized_integer_to_character_32 (a_feature, an_integer_type)
			when builtin_integer_to_double then
				report_builtin_sized_integer_to_double (a_feature, an_integer_type)
			when builtin_integer_to_real then
				report_builtin_sized_integer_to_real (a_feature, an_integer_type)
			when builtin_integer_to_real_32 then
				report_builtin_sized_integer_to_real_32 (a_feature, an_integer_type)
			when builtin_integer_to_real_64 then
				report_builtin_sized_integer_to_real_64 (a_feature, an_integer_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_real_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in sized real type `a_real_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_real_type_not_void: a_real_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_ceiling_real_32 then
				report_builtin_sized_real_ceiling_real_32 (a_feature, a_real_type)
			when builtin_real_ceiling_real_64 then
				report_builtin_sized_real_ceiling_real_64 (a_feature, a_real_type)
			when builtin_real_divide then
				report_builtin_sized_real_divide (a_feature, a_real_type)
			when builtin_real_floor_real_32 then
				report_builtin_sized_real_floor_real_32 (a_feature, a_real_type)
			when builtin_real_floor_real_64 then
				report_builtin_sized_real_floor_real_64 (a_feature, a_real_type)
			when builtin_real_identity then
				report_builtin_sized_real_identity (a_feature, a_real_type)
			when builtin_real_item then
				report_builtin_sized_real_item (a_feature, a_real_type)
			when builtin_real_lt then
				report_builtin_sized_real_lt (a_feature, a_real_type)
			when builtin_real_minus then
				report_builtin_sized_real_minus (a_feature, a_real_type)
			when builtin_real_opposite then
				report_builtin_sized_real_opposite (a_feature, a_real_type)
			when builtin_real_out then
				report_builtin_sized_real_out (a_feature, a_real_type)
			when builtin_real_plus then
				report_builtin_sized_real_plus (a_feature, a_real_type)
			when builtin_real_power then
				report_builtin_sized_real_power (a_feature, a_real_type)
			when builtin_real_times then
				report_builtin_sized_real_times (a_feature, a_real_type)
			when builtin_real_to_double then
				report_builtin_sized_real_to_double (a_feature, a_real_type)
			when builtin_real_truncated_to_integer then
				report_builtin_sized_real_truncated_to_integer (a_feature, a_real_type)
			when builtin_real_truncated_to_integer_64 then
				report_builtin_sized_real_truncated_to_integer_64 (a_feature, a_real_type)
			when builtin_real_truncated_to_real then
				report_builtin_sized_real_truncated_to_real (a_feature, a_real_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_special_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "SPECIAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_aliased_resized_area then
				report_builtin_special_aliased_resized_area (a_feature)
			when builtin_special_count then
				report_builtin_special_count (a_feature)
			when builtin_special_element_size then
				report_builtin_special_element_size (a_feature)
			when builtin_special_item then
				report_builtin_special_item (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_type_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function introduced in class "TYPE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_type: (a_feature.builtin_code // builtin_capacity) = builtin_type_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_type_generating_type then
				report_builtin_type_generating_type (a_feature)
			when builtin_type_name then
				report_builtin_type_name (a_feature)
			when builtin_type_type_id then
				report_builtin_type_type_id (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			Precursor (a_feature)
			if not has_fatal_error then
				if a_feature.is_builtin then
					check_external_builtin_procedure_validity (a_feature)
				end
			end
		end

	check_external_builtin_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				check_external_builtin_any_procedure_validity (a_feature)
			when builtin_boolean_class then
				check_external_builtin_boolean_procedure_validity (a_feature)
			when builtin_character_8_class then
				check_external_builtin_sized_character_procedure_validity (a_feature, current_system.character_8_type)
			when builtin_character_32_class then
				check_external_builtin_sized_character_procedure_validity (a_feature, current_system.character_32_type)
			when builtin_identified_class then
				check_external_builtin_identified_procedure_validity (a_feature)
			when builtin_integer_8_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.integer_8_type)
			when builtin_integer_16_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.integer_16_type)
			when builtin_integer_32_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.integer_32_type)
			when builtin_integer_64_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.integer_64_type)
			when builtin_natural_8_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.natural_8_type)
			when builtin_natural_16_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.natural_16_type)
			when builtin_natural_32_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.natural_32_type)
			when builtin_natural_64_class then
				check_external_builtin_sized_integer_procedure_validity (a_feature, current_system.natural_64_type)
			when builtin_pointer_class then
				check_external_builtin_pointer_procedure_validity (a_feature)
			when builtin_procedure_class then
				check_external_builtin_procedure_procedure_validity (a_feature)
			when builtin_real_32_class then
				check_external_builtin_sized_real_procedure_validity (a_feature, current_system.real_32_type)
			when builtin_real_64_class then
				check_external_builtin_sized_real_procedure_validity (a_feature, current_system.real_64_type)
			when builtin_special_class then
				check_external_builtin_special_procedure_validity (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_any_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "ANY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_copy then
				report_builtin_any_copy (a_feature)
			when builtin_any_standard_copy then
				report_builtin_any_standard_copy (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_boolean_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "BOOLEAN" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_set_item then
				report_builtin_boolean_set_item (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_identified_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "IDENTIFIED" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_object_id_free then
				report_builtin_identified_eif_object_id_free (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_pointer_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "POINTER" and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_set_item then
				report_builtin_pointer_set_item (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_procedure_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "PROCEDURE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_procedure: (a_feature.builtin_code // builtin_capacity) = builtin_procedure_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_procedure_call then
				report_builtin_procedure_call (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_character_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_character_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized character type `a_character_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_character_type_not_void: a_character_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_set_item then
				report_builtin_sized_character_set_item (a_feature, a_character_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_integer_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized integer type `an_integer_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			an_integer_type_not_void: an_integer_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_set_item then
				report_builtin_sized_integer_set_item (a_feature, an_integer_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_sized_real_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_real_type: ET_DYNAMIC_TYPE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized real type `a_real_type' and related classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_real_type_not_void: a_real_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_set_item then
				report_builtin_sized_real_set_item (a_feature, a_real_type)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_external_builtin_special_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "SPECIAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_make then
				report_builtin_special_make (a_feature)
			when builtin_special_put then
				report_builtin_special_put (a_feature)
			else
					-- Internal error: invalid built-in feature.
					-- Error already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

feature {NONE} -- Instruction validity

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_debug then
				precursor (an_instruction)
			else
				has_fatal_error := False
			end
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_debug then
				precursor (an_instruction)
			else
				has_fatal_error := False
			end
		end

	check_loop_invariant_validity (an_invariant: ET_LOOP_INVARIANTS) is
			-- Check validity of `an_invariant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_assertion then
				precursor (an_invariant)
			else
				has_fatal_error := False
			end
		end

	check_loop_variant_validity (a_variant: ET_VARIANT) is
			-- Check validity of `a_variant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_assertion then
				precursor (a_variant)
			else
				has_fatal_error := False
			end
		end

feature {NONE} -- Event handling

	report_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Report that an assignment instruction has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				propagate_assignment_dynamic_types (an_instruction)
			end
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Report that an assignment attempt instruction has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				propagate_assignment_attempt_dynamic_types (an_instruction)
			end
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY) is
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_attribute: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_attribute := current_dynamic_type.dynamic_query (an_attribute, current_system)
-- TODO: the dynamic type set of `l_dynamic_attribute' may be altered when
-- its address is passed to an external routine.
			end
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY) is
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_type.dynamic_query (an_attribute, current_system).result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of an attribute cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					set_dynamic_type_set (l_dynamic_type_set, a_writable)
				end
			end
		end

	report_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Report that a bit constant has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
-- TODO: not supported.
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.none_type
				set_dynamic_type_set (l_type, a_constant)
			end
		end

	report_boolean_constant (a_constant: ET_BOOLEAN_CONSTANT) is
			-- Report that a boolean has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.boolean_type
				l_type.set_alive
				if a_constant.index = 0 and boolean_index.item /= 0 then
					a_constant.set_index (boolean_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if boolean_index.item = 0 then
					boolean_index.put (a_constant.index)
				end
			end
		end

	report_character_constant (a_constant: ET_CHARACTER_CONSTANT) is
			-- Report that a character has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.character_type
				l_type.set_alive
				if a_constant.index = 0 and character_index.item /= 0 then
					a_constant.set_index (character_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if character_index.item = 0 then
					character_index.put (a_constant.index)
				end
			end
		end

	report_builtin_conversion (an_expression: ET_CONVERT_EXPRESSION; a_target_type: ET_TYPE_CONTEXT) is
			-- Report that a built-in convert expression has been processed.
		local
			l_procedure: ET_PROCEDURE
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_convert_feature: ET_CONVERT_FEATURE
			l_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			l_query: ET_QUERY
			l_seed: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_source_type_set := dynamic_type_set (an_expression.expression)
				if l_source_type_set = Void then
						-- Internal error: the dynamic type set of the source
						-- should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_source_type := l_source_type_set.static_type
					if l_source_type.base_type.conforms_to_context (a_target_type, universe) then
-- TODO: built-in feature with formal generic parameter? Should not be needed with ECMA Eiffel.
						set_dynamic_type_set (l_source_type_set, an_expression)
					else
						l_convert_feature := type_checker.convert_feature (l_source_type.base_type, a_target_type)
						if l_convert_feature = Void then
								-- Internal error: no convert feature found.
-- TODO: built-in feature with formal generic parameter? Should not be needed with ECMA Eiffel.
							set_dynamic_type_set (l_source_type_set, an_expression)
						elseif l_convert_feature.is_convert_to then
							l_seed := l_convert_feature.name.seed
							l_query := l_source_type.base_class.seeded_query (l_seed)
							if l_query /= Void then
-- TODO: can we avoid creating this intermediary 'convert_to_expression'?
								create l_convert_to_expression.make (an_expression.expression, l_convert_feature)
								report_qualified_call_expression (l_convert_to_expression, l_source_type.base_type, l_query)
								an_expression.set_index (l_convert_to_expression.index)
							else
									-- Internal error: there should be a query with `l_seed'.
									-- It has been computed in ET_FEATURE_FLATTENER or else an
									-- error should have already been reported.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						elseif l_convert_feature.is_convert_from then
							l_seed := l_convert_feature.name.seed
							l_procedure := a_target_type.base_class (universe).seeded_procedure (l_seed)
							if l_procedure = Void then
									-- Internal error: there should be a procedure with `l_seed'.
									-- It has been computed in ET_FEATURE_FLATTENER or else an
									-- error should have already been reported.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								report_creation_expression (an_expression, a_target_type.named_type (universe), l_procedure, an_expression.expression)
							end
						else
-- TODO: built-in feature between basic types? Should not be needed with ECMA Eiffel.
							set_dynamic_type_set (l_source_type_set, an_expression)
						end
					end
				end
			end
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_TYPE;
		a_procedure: ET_PROCEDURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		local
			i, nb: INTEGER
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_dynamic_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				if an_actuals /= Void then
					nb := an_actuals.count
					from i := 1 until i > nb loop
						l_actual := an_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_procedure)
						i := i + 1
					end
				end
				set_dynamic_type_set (l_dynamic_creation_type, an_expression)
			end
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a creation instruction, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		local
			i, nb: INTEGER
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_dynamic_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_procedure)
						i := i + 1
					end
				end
				propagate_creation_dynamic_type (l_dynamic_creation_type, an_instruction)
			end
		end

	report_current (an_expression: ET_CURRENT) is
			-- Report that the current entity has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				if an_expression.index = 0 and current_index.item /= 0 then
					an_expression.set_index (current_index.item)
				end
				set_dynamic_type_set (current_dynamic_type, an_expression)
				if current_index.item = 0 then
					current_index.put (an_expression.index)
				end
			end
		end

	report_current_type_needed is
			-- Report that the current type is needed to execute the feature being analyzed.
			-- This might be needed for optimization purposes.
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_current_type_needed (True)
			end
		end

	report_double_constant (a_constant: ET_REAL_CONSTANT) is
			-- Report that a double has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.double_type
				l_type.set_alive
				if a_constant.index = 0 and double_index.item /= 0 then
					a_constant.set_index (double_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if double_index.item = 0 then
					double_index.put (a_constant.index)
				end
			end
		end

	report_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Report that an equality expression has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.boolean_type
				l_type.set_alive
				if an_expression.index = 0 and boolean_index.item /= 0 then
					an_expression.set_index (boolean_index.item)
				end
				set_dynamic_type_set (l_type, an_expression)
				if boolean_index.item = 0 then
					boolean_index.put (an_expression.index)
				end
			end
		end

	report_formal_argument (a_name: ET_IDENTIFIER; a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that a call to formal argument `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_formal.name.index)
			end
		end

	report_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that the declaration of the formal
			-- argument `a_formal' of a feature has been processed.
		do
			-- The dynamic type sets of formal arguments of features have
			-- already been set when creating the corresponding dynamic
			-- feature (see ET_DYNAMIC_FEATURE.make).
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY) is
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_query: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_query := current_dynamic_type.dynamic_query (a_query, current_system)
				l_dynamic_query.set_regular (True)
-- TODO: the dynamic type set of the formal arguments of `l_dynamic_query'
-- may be altered when its address is passed to an external routine.
			end
		end

	report_inline_agent (an_expression: ET_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an inline agent of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			i, nb: INTEGER
			j, nb2: INTEGER
			l_target: ET_AGENT_TARGET
		do
			l_dynamic_type := current_system.dynamic_type (a_type, a_context)
			l_dynamic_type.set_alive
			set_dynamic_type_set (l_dynamic_type, an_expression)
			l_agent_type ?= l_dynamic_type
			if l_agent_type = Void then
					-- Internal error: the dynamic type of an agent should be an agent type.
				set_fatal_error
				error_handler.report_giaaa_error
			else
					-- Set dynamic type set of implicit 'Current' target.
				l_target := an_expression.target
				if l_target.index = 0 and current_index.item /= 0 then
					l_target.set_index (current_index.item)
				end
				set_dynamic_type_set (current_dynamic_type, l_target)
				if current_index.item = 0 then
					current_index.put (l_target.index)
				end
					-- Dynamic type set of 'Result'.
				l_result_type_set := l_agent_type.result_type_set
				if l_result_type_set /= Void then
					propagate_inline_agent_result_dynamic_types (an_expression, l_result_type_set)
				end
					-- Set dynamic type sets of open operands.
				l_actuals := an_expression.actual_arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb > 0 then
						l_formals := an_expression.formal_arguments
						if l_formals = Void or else l_formals.count /= nb then
								-- Internal error: it has already been checked somewhere else
								-- that there was the same number of actual and formal arguments.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_open_operand_type_sets := l_agent_type.open_operand_type_sets
							nb2 := l_open_operand_type_sets.count
							from i := 1 until i > nb loop
								l_formal_type_set := dynamic_type_set (l_formals.formal_argument (i).name)
								if l_formal_type_set = Void then
										-- Internal error: the dynamic type sets of the formal
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_actual := l_actuals.actual_argument (i)
									l_actual_expression ?= l_actual
									if l_actual_expression /= Void then
										propagate_argument_dynamic_types (l_actual_expression, l_formal_type_set)
									else
											-- Open operand.
										j := j + 1
										if j > nb2 then
												-- Internal error: missing open operands.
											set_fatal_error
											error_handler.report_giaaa_error
										else
											l_open_operand_type_set := l_open_operand_type_sets.item (j)
											set_dynamic_type_set (l_open_operand_type_set, l_actual)
											propagate_argument_dynamic_types (l_actual, l_formal_type_set)
										end
									end
								end
								i := i + 1
							end
							if j < nb2 then
									-- Internal error: too many open operands.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
			end
		end

	report_inline_agent_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that the declaration of the formal argument `a_formal'
			-- of an inline agent has been processed.
			-- Note: The type of the formal argument is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		local
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_resolved_type := resolved_formal_parameters (a_formal.type, current_class_impl, current_type)
				if not has_fatal_error then
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type)
					l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_dynamic_type_set, a_formal.name)
				end
			end
		end

	report_inline_agent_local_variable_declaration (a_local: ET_LOCAL_VARIABLE) is
			-- Report that the declaration of the local variable `a_local'
			-- of an inline agent has been processed.
			-- Note: The type of the local variable is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		local
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_resolved_type := resolved_formal_parameters (a_local.type, current_class_impl, current_type)
				if not has_fatal_error then
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type)
					l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_dynamic_type_set, a_local.name)
				end
			end
		end

	report_inline_agent_result_declaration (a_type: ET_TYPE) is
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of an inline agent has been processed.
			-- Note: The type of the "Result" entity is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		local
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				if current_inline_agent = Void then
						-- Internal error: the declaration of the "Result" entity
						-- of an inline agent should occur in an inline agent.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_resolved_type := resolved_formal_parameters (a_type, current_class_impl, current_type)
					if not has_fatal_error then
						l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type)
						l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
						set_dynamic_type_set (l_dynamic_type_set, current_inline_agent.implicit_result)
					end
				end
			end
		end

	report_integer_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.integer_type
				l_type.set_alive
				if a_constant.index = 0 and integer_index.item /= 0 then
					a_constant.set_index (integer_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_index.item = 0 then
					integer_index.put (a_constant.index)
				end
			end
		end

	report_integer_8_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_8 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.integer_8_type
				l_type.set_alive
				if a_constant.index = 0 and integer_8_index.item /= 0 then
					a_constant.set_index (integer_8_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_8_index.item = 0 then
					integer_8_index.put (a_constant.index)
				end
			end
		end

	report_integer_16_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_16 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.integer_16_type
				l_type.set_alive
				if a_constant.index = 0 and integer_16_index.item /= 0 then
					a_constant.set_index (integer_16_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_16_index.item = 0 then
					integer_16_index.put (a_constant.index)
				end
			end
		end

	report_integer_32_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_32 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.integer_32_type
				l_type.set_alive
				if a_constant.index = 0 and integer_32_index.item /= 0 then
					a_constant.set_index (integer_32_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_32_index.item = 0 then
					integer_32_index.put (a_constant.index)
				end
			end
		end

	report_integer_64_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_64 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.integer_64_type
				l_type.set_alive
				if a_constant.index = 0 and integer_64_index.item /= 0 then
					a_constant.set_index (integer_64_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_64_index.item = 0 then
					integer_64_index.put (a_constant.index)
				end
			end
		end

	report_local_assignment_target (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that the local variable `a_name' has been
			-- processed as target of an assignment (attempt).
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_local.name.index)
			end
		end

	report_local_variable (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that a call to local variable `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_local.name.index)
			end
		end

	report_local_variable_declaration (a_local: ET_LOCAL_VARIABLE) is
			-- Report that the declaration of the local variable `a_local'
			-- of a feature has been processed.
			-- Note: The type of the local variable is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		local
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_resolved_type := resolved_formal_parameters (a_local.type, current_class_impl, current_type)
				if not has_fatal_error then
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type)
					l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_dynamic_type_set, a_local.name)
				end
			end
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE) is
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, current_type)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
					-- Make sure that type SPECIAL[XXX] (used in feature 'area') is marked as alive.
					-- Feature 'area' should be the first in the list of features.
				l_queries := l_type.queries
				if l_queries.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
-- TODO: internal error
				else
					l_area_type_set := l_queries.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
						set_fatal_error
-- TODO: internal error
					else
						l_area_type_set.static_type.set_alive
					end
				end
					-- Make sure that type INTEGER (used in attributess 'lower' and 'upper') is marked as alive.
				current_system.integer_type.set_alive
			end
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE) is
			-- Report that a manifest tuple of type `a_type' in context of
			-- `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, current_type)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_manifest_type (an_expression: ET_MANIFEST_TYPE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a manifest type of type `a_type' in context of
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, a_context)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_natural_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.natural_type
				l_type.set_alive
				if a_constant.index = 0 and natural_index.item /= 0 then
					a_constant.set_index (natural_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if natural_index.item = 0 then
					natural_index.put (a_constant.index)
				end
			end
		end

	report_natural_8_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_8 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.natural_8_type
				l_type.set_alive
				if a_constant.index = 0 and natural_8_index.item /= 0 then
					a_constant.set_index (natural_8_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if natural_8_index.item = 0 then
					natural_8_index.put (a_constant.index)
				end
			end
		end

	report_natural_16_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_16 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.natural_16_type
				l_type.set_alive
				if a_constant.index = 0 and natural_16_index.item /= 0 then
					a_constant.set_index (natural_16_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if natural_16_index.item = 0 then
					natural_16_index.put (a_constant.index)
				end
			end
		end

	report_natural_32_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_32 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.natural_32_type
				l_type.set_alive
				if a_constant.index = 0 and natural_32_index.item /= 0 then
					a_constant.set_index (natural_32_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if natural_32_index.item = 0 then
					natural_32_index.put (a_constant.index)
				end
			end
		end

	report_natural_64_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_64 has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.natural_64_type
				l_type.set_alive
				if a_constant.index = 0 and natural_64_index.item /= 0 then
					a_constant.set_index (natural_64_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if natural_64_index.item = 0 then
					natural_64_index.put (a_constant.index)
				end
			end
		end

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION) is
			-- Report that a pointer expression has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.pointer_type
				l_type.set_alive
				if an_expression.index = 0 and pointer_index.item /= 0 then
					an_expression.set_index (pointer_index.item)
				end
				set_dynamic_type_set (l_type, an_expression)
				if pointer_index.item = 0 then
					pointer_index.put (an_expression.index)
				end
			end
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_query' is the precursor feature.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_parent_type: ET_DYNAMIC_TYPE
			l_precursor: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_query, l_parent_type, current_system)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_precursor)
						i := i + 1
					end
				end
				l_dynamic_type_set := l_precursor.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_procedure' is the precursor feature.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_parent_type: ET_DYNAMIC_TYPE
			l_precursor: ET_DYNAMIC_FEATURE
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_procedure, l_parent_type, current_system)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_precursor)
						i := i + 1
					end
				end
			end
		end

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE) is
			-- Report that function `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_procedure := current_dynamic_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_regular (True)
-- TODO: the dynamic type set of the formal arguments of `l_dynamic_procedure'
-- may be altered when its address is passed to an external routine.
			end
		end

	report_procedure_inline_agent (an_expression: ET_PROCEDURE_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that procedure inline agent of type `a_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_inline_agent (an_expression, a_type, a_context)
			end
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY) is
			-- Report that a qualified call expression has been processed.
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_target: ET_EXPRESSION
			l_type: ET_TYPE
			l_like: ET_LIKE_FEATURE
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_expression.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_type := a_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
					l_like ?= l_type
					if l_like /= Void and then l_like.is_like_argument then
						l_actuals := an_expression.arguments
						if l_actuals /= Void and then l_actuals.count = 1 then
							l_actual_type_set := dynamic_type_set (l_actuals.actual_argument (1))
							if l_actual_type_set = Void then
									-- Internal error: the dynamic type sets of the
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_dynamic_type := l_actual_type_set.static_type
							end
						end
					end
					if l_dynamic_type = Void then
						l_dynamic_type := current_system.dynamic_type (l_type, l_target_type_set.static_type.base_type)
					end
					l_result_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_result_type_set, an_expression)
					create l_dynamic_call.make (an_expression, l_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_query_call (l_dynamic_call)
				end
			end
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE) is
			-- Report that a qualified call instruction has been processed.
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_target: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_instruction.target
				l_dynamic_type_set := dynamic_type_set (l_target)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					create l_dynamic_call.make (an_instruction, l_dynamic_type_set, current_dynamic_feature, current_dynamic_type)
					l_dynamic_type_set.static_type.put_procedure_call (l_dynamic_call)
				end
			end
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified procedure call (to `a_procedure') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target: ET_AGENT_TARGET
			l_target_expression: ET_EXPRESSION
			i, nb: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (an_agent_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_dynamic_agent_type ?= l_dynamic_type
				if l_dynamic_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_open_operand_type_sets := l_dynamic_agent_type.open_operand_type_sets
					nb2 := l_open_operand_type_sets.count
					l_target := an_expression.target
					l_target_expression ?= l_target
					if l_target_expression /= Void then
						l_target_type_set := dynamic_type_set (l_target_expression)
					else
							-- The agent is of the form:   agent {TYPE}.f
							-- The dynamic type set of the target is the first of open operand dynamic type sets.
						j := 1
						if not l_open_operand_type_sets.is_empty then
							l_target_type_set := l_open_operand_type_sets.item (1)
							set_dynamic_type_set (l_target_type_set, l_target)
						end
					end
					if l_target_type_set = Void then
							-- Internal error: the dynamic type sets of the
							-- target should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_dynamic_feature := l_target_type_set.static_type.dynamic_procedure (a_procedure, current_system)
						l_dynamic_feature.set_regular (True)
							-- Set dynamic type sets of open operands.
						l_actuals := an_expression.arguments
						if l_actuals /= Void then
							nb := l_actuals.count
							if nb = 0 then
								-- Do nothing.
							else
								from i := 1 until i > nb loop
									l_actual := l_actuals.actual_argument (i)
									l_actual_expression ?= l_actual
									if l_actual_expression /= Void then
										-- Do nothing.
									else
											-- Open operand.
										j := j + 1
										if j > nb2 then
												-- Internal error: missing open operands.
											set_fatal_error
											error_handler.report_giaaa_error
										else
											l_dynamic_type_set := l_open_operand_type_sets.item (j)
											set_dynamic_type_set (l_dynamic_type_set, l_actual)
										end
									end
									i := i + 1
								end
								if j < nb2 then
										-- Internal error: too many open operands.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							end
						end
						report_agent_qualified_procedure_call (an_expression, l_target_type_set)
					end
				end
			end
		end

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified query call (to `a_query') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target: ET_AGENT_TARGET
			l_target_expression: ET_EXPRESSION
			i, nb: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (an_agent_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_dynamic_agent_type ?= l_dynamic_type
				if l_dynamic_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_open_operand_type_sets := l_dynamic_agent_type.open_operand_type_sets
					nb2 := l_open_operand_type_sets.count
					l_target := an_expression.target
					l_target_expression ?= l_target
					if l_target_expression /= Void then
						l_target_type_set := dynamic_type_set (l_target_expression)
					else
							-- The agent is of the form:   agent {TYPE}.f
							-- The dynamic type set of the target is the first of open operand dynamic type sets.
						j := 1
						if not l_open_operand_type_sets.is_empty then
							l_target_type_set := l_open_operand_type_sets.item (1)
							set_dynamic_type_set (l_target_type_set, l_target)
						end
					end
					l_result_type_set := l_dynamic_agent_type.result_type_set
					if l_target_type_set = Void then
							-- Internal error: the dynamic type sets of the
							-- target should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set = Void then
							-- Internal error: if the corresponding feature is a query
							-- then the result type set should not be Void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_dynamic_feature := l_target_type_set.static_type.dynamic_query (a_query, current_system)
						l_dynamic_feature.set_regular (True)
							-- Set dynamic type sets of open operands.
						l_actuals := an_expression.arguments
						if l_actuals /= Void then
							nb := l_actuals.count
							if nb = 0 then
								-- Do nothing.
							else
								from i := 1 until i > nb loop
									l_actual := l_actuals.actual_argument (i)
									l_actual_expression ?= l_actual
									if l_actual_expression /= Void then
										-- Do nothing.
									else
											-- Open operand.
										j := j + 1
										if j > nb2 then
												-- Internal error: missing open operands.
											set_fatal_error
											error_handler.report_giaaa_error
										else
											l_dynamic_type_set := l_open_operand_type_sets.item (j)
											set_dynamic_type_set (l_dynamic_type_set, l_actual)
										end
									end
									i := i + 1
								end
								if j < nb2 then
										-- Internal error: too many open operands.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							end
						end
						set_dynamic_type_set (l_result_type_set, an_expression.implicit_result)
						report_agent_qualified_query_call (an_expression, l_target_type_set, l_result_type_set)
					end
				end
			end
		end

	report_agent_qualified_procedure_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Report the agent `an_expression' makes a qualified procedure call
			-- on `a_target_type_set'.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			a_target_type_set_not_void: a_target_type_set /= Void
		local
			l_dynamic_procedure_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
		do
			create l_dynamic_procedure_call.make (an_expression, a_target_type_set, current_dynamic_feature, current_dynamic_type)
			a_target_type_set.static_type.put_procedure_call (l_dynamic_procedure_call)
		end

	report_agent_qualified_query_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Report the agent `an_expression' makes a qualified query call
			-- on `a_target_type_set' and returns `a_result_type_set'.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			a_target_type_set_not_void: a_target_type_set /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		local
			l_dynamic_query_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
		do
			create l_dynamic_query_call.make (an_expression, a_target_type_set, a_result_type_set, current_dynamic_feature, current_dynamic_type)
			a_target_type_set.static_type.put_query_call (l_dynamic_query_call)
		end

	report_query_inline_agent (an_expression: ET_QUERY_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a query inline agent of type `a_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_inline_agent (an_expression, a_type, a_context)
			end
		end

	report_real_constant (a_constant: ET_REAL_CONSTANT) is
			-- Report that a real has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.real_type
				l_type.set_alive
				if a_constant.index = 0 and real_index.item /= 0 then
					a_constant.set_index (real_index.item)
				end
				set_dynamic_type_set (l_type, a_constant)
				if real_index.item = 0 then
					real_index.put (a_constant.index)
				end
			end
		end

	report_result (an_expression: ET_RESULT) is
			-- Report that the result entity has been processed.
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_implicit_result: ET_RESULT
		do
			if current_type = current_dynamic_type.base_type then
				if current_inline_agent /= Void then
					l_implicit_result := current_inline_agent.implicit_result
					if l_implicit_result /= Void then
						l_dynamic_type_set := dynamic_type_set (l_implicit_result)
					end
				else
					l_dynamic_type_set := current_dynamic_feature.result_type_set
				end
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a function cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if an_expression.index = 0 then
						if current_inline_agent /= Void then
							an_expression.set_index (l_implicit_result.index)
						else
							an_expression.set_index (result_index.item)
						end
					end
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
					if current_inline_agent = Void then
						if result_index.item = 0 then
							result_index.put (an_expression.index)
						end
					end
				end
			end
		end

	report_result_assignment_target (a_result: ET_RESULT) is
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_implicit_result: ET_RESULT
		do
			if current_type = current_dynamic_type.base_type then
				if current_inline_agent /= Void then
					l_implicit_result := current_inline_agent.implicit_result
					if l_implicit_result /= Void then
						l_dynamic_type_set := dynamic_type_set (l_implicit_result)
					end
				else
					l_dynamic_type_set := current_dynamic_feature.result_type_set
				end
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a function cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if a_result.index = 0 then
						if current_inline_agent /= Void then
							a_result.set_index (l_implicit_result.index)
						else
							a_result.set_index (result_index.item)
						end
					end
					set_dynamic_type_set (l_dynamic_type_set, a_result)
					if current_inline_agent = Void then
						if result_index.item = 0 then
							result_index.put (a_result.index)
						end
					end
				end
			end
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY) is
			-- Report that a static call expression has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_dynamic_query := l_dynamic_type.dynamic_query (a_query, current_system)
				l_dynamic_query.set_static (True)
				l_dynamic_type.set_static (True)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_query)
						i := i + 1
					end
				end
				l_dynamic_type_set := l_dynamic_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a static call instruction has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_dynamic_procedure := l_dynamic_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_static (True)
				l_dynamic_type.set_static (True)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_procedure)
						i := i + 1
					end
				end
			end
		end

	report_string_constant (a_string: ET_MANIFEST_STRING) is
			-- Report that a string has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.string_type
				if a_string.index = 0 and string_index.item /= 0 then
					a_string.set_index (string_index.item)
				end
				l_type.set_alive
				set_dynamic_type_set (l_type, a_string)
				if string_index.item = 0 then
					string_index.put (a_string.index)
				end
					-- Make sure that type SPECIAL[CHARACTER] (used in
					-- feature 'area') is marked as alive.
				current_system.special_character_type.set_alive
					-- Make sure that type CHARACTER (used as actual generic type
					-- of 'SPECIAL[CHARACTER]' in feature 'area') is marked as alive.
				current_system.character_type.set_alive
					-- Make sure that type INTEGER (used in attribute 'count') is marked as alive.
				current_system.integer_type.set_alive
			end
		end

	report_strip_expression (an_expression: ET_STRIP_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a strip expression of type `a_type'
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, a_context)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_tuple_label_call_agent (an_expression: ET_CALL_AGENT; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a tuple label call agent of type `an_agent_type'
			-- in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target: ET_AGENT_TARGET
			l_target_expression: ET_EXPRESSION
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (an_agent_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_dynamic_agent_type ?= l_dynamic_type
				if l_dynamic_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_open_operand_type_sets := l_dynamic_agent_type.open_operand_type_sets
					l_target := an_expression.target
					l_target_expression ?= l_target
					if l_target_expression /= Void then
						l_target_type_set := dynamic_type_set (l_target_expression)
					else
							-- The agent is of the form:   agent {TYPE}.f
							-- The dynamic type set of the target is the first of open operand dynamic type sets.
						if not l_open_operand_type_sets.is_empty then
							l_target_type_set := l_open_operand_type_sets.item (1)
							set_dynamic_type_set (l_target_type_set, l_target)
						end
					end
					l_result_type_set := l_dynamic_agent_type.result_type_set
					if l_target_type_set = Void then
							-- Internal error: the dynamic type sets of the
							-- target should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set = Void then
							-- Internal error: if the corresponding feature is a query
							-- then the result type set should not be Void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						set_dynamic_type_set (l_result_type_set, an_expression.implicit_result)
					end
				end
			end
		end

	report_tuple_label_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT) is
			-- Report that a call to a tuple label has been processed.
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_index: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_expression.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_type ?= l_target_type_set.static_type
					if l_tuple_type = Void then
							-- Internal error: the target of a label expression
							-- should be a Tuple.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_item_type_sets := l_tuple_type.item_type_sets
						l_index := an_expression.name.seed
						if not l_item_type_sets.valid_index (l_index) then
								-- Internal error: invalid label index.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type_set := l_item_type_sets.item (l_index)
							set_dynamic_type_set (l_dynamic_type_set, an_expression)
						end
					end
				end
			end
		end

	report_tuple_label_setter (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT) is
			-- Report that a call to the setter of a tuple label has been processed.
		local
			l_call: ET_FEATURE_CALL_EXPRESSION
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_index: INTEGER
			l_label_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_call := an_assigner.call
				l_target := l_call.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_type ?= l_target_type_set.static_type
					if l_tuple_type = Void then
							-- Internal error: the target of a label expression
							-- should be a Tuple.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_item_type_sets := l_tuple_type.item_type_sets
						l_index := l_call.name.seed
						if not l_item_type_sets.valid_index (l_index) then
								-- Internal error: invalid label index.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_label_type_set := l_item_type_sets.item (l_index)
							set_dynamic_type_set (l_label_type_set, l_call)
							propagate_tuple_label_setter_dynamic_types (an_assigner, l_label_type_set)
						end
					end
				end
			end
		end

	report_typed_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a typed pointer expression of type `a_type'
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, a_context)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY) is
			-- Report that an unqualified call expression has been processed.
		local
			i, nb: INTEGER
			l_dynamic_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_set: ET_DYNAMIC_TYPE_SET
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_like: ET_LIKE_FEATURE
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_query := current_dynamic_type.dynamic_query (a_query, current_system)
				l_dynamic_query.set_regular (True)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb = 1 then
						l_actual := l_actuals.actual_argument (1)
						if l_dynamic_query.is_builtin_function_item and then current_dynamic_type.is_agent_type then
								-- This is something of the form:  'item ([...])'
								-- Try to get the open operand type sets directly from the
								-- argument if it is a manifest tuple.
							l_agent_type ?= current_dynamic_type
							if l_agent_type = Void then
									-- Internal error: it has to be an agent type.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_manifest_tuple ?= l_actual
								if l_manifest_tuple /= Void then
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- Internal error: the actual argument conforms to the
											-- formal argument of 'item', so there cannot be less
											-- items in the tuple.
										set_fatal_error
										error_handler.report_giaaa_error
									else
										from i := 1 until i > nb loop
											l_actual := l_manifest_tuple.expression (i)
											l_open_operand_type_set := l_open_operand_type_sets.item (i)
											propagate_argument_dynamic_types (l_actual, l_open_operand_type_set)
											i := i + 1
										end
									end
								else
									propagate_argument_operand_dynamic_types (l_actual, 1, l_dynamic_query)
								end
							end
						else
							propagate_argument_operand_dynamic_types (l_actual, 1, l_dynamic_query)
						end
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_query)
							i := i + 1
						end
					end
				end
				l_result_type_set := l_dynamic_query.result_type_set
				l_dynamic_type_set := l_result_type_set
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
				l_like ?= a_query.type
				if l_like /= Void and then l_like.is_like_argument then
					if l_actuals /= Void and then l_actuals.count = 1 then
						l_actual_type_set := dynamic_type_set (l_actuals.actual_argument (1))
						if l_actual_type_set = Void then
								-- Internal error: the dynamic type sets of the
								-- arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type_set := new_dynamic_type_set (l_actual_type_set.static_type)
							if l_result_type_set /= Void then
								propagate_like_argument_dynamic_types (an_expression, l_result_type_set, l_dynamic_type_set)
							end
						end
					end
				end
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_set: ET_DYNAMIC_TYPE_SET
			l_manifest_tuple: ET_MANIFEST_TUPLE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_procedure := current_dynamic_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_regular (True)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb = 1 then
						l_actual := l_actuals.actual_argument (1)
						if l_dynamic_procedure.is_builtin_routine_call and then current_dynamic_type.is_agent_type then
								-- This is something of the form:  'call ([...])'
								-- Try to get the open operand type sets directly from the
								-- argument if it is a manifest tuple.
							l_agent_type ?= current_dynamic_type
							if l_agent_type = Void then
									-- Internal error: it has to be an agent type.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_manifest_tuple ?= l_actual
								if l_manifest_tuple /= Void then
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- Internal error: the actual argument conforms to the
											-- formal argument of 'call', so there cannot be less
											-- items in the tuple.
										set_fatal_error
										error_handler.report_giaaa_error
									else
										from i := 1 until i > nb loop
											l_actual := l_manifest_tuple.expression (i)
											l_open_operand_type_set := l_open_operand_type_sets.item (i)
											propagate_argument_dynamic_types (l_actual, l_open_operand_type_set)
											i := i + 1
										end
									end
								else
									propagate_argument_operand_dynamic_types (l_actual, 1, l_dynamic_procedure)
								end
							end
						else
							propagate_argument_operand_dynamic_types (l_actual, 1, l_dynamic_procedure)
						end
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_procedure)
							i := i + 1
						end
					end
				end
			end
		end

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified procedure call (to `a_procedure') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_procedure (a_procedure, current_system)
				report_unqualified_call_agent (an_expression, l_dynamic_feature, a_type, a_context)
			end
		end

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified query call (to `a_query') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_query (a_query, current_system)
				set_dynamic_type_set (l_dynamic_feature.result_type_set, an_expression.implicit_result)
				report_unqualified_call_agent (an_expression, l_dynamic_feature, a_type, a_context)
			end
		end

	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_DYNAMIC_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_open_operand_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			i, nb: INTEGER
			j, nb2: INTEGER
			l_routine_type: ET_DYNAMIC_ROUTINE_TYPE
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_not_done: BOOLEAN
			l_target: ET_AGENT_TARGET
		do
			a_feature.set_regular (True)
			l_dynamic_type := current_system.dynamic_type (a_type, a_context)
			l_dynamic_type.set_alive
			set_dynamic_type_set (l_dynamic_type, an_expression)
			l_agent_type ?= l_dynamic_type
			if l_agent_type = Void then
					-- Internal error: the dynamic type of an agent should be an agent type.
				set_fatal_error
				error_handler.report_giaaa_error
			else
					-- Set dynamic type set of implicit 'Current' target.
				l_target := an_expression.target
				if l_target.index = 0 and current_index.item /= 0 then
					l_target.set_index (current_index.item)
				end
				set_dynamic_type_set (current_dynamic_type, l_target)
				if current_index.item = 0 then
					current_index.put (l_target.index)
				end
					-- Dynamic type set of 'Result'.
				l_result_type_set := l_agent_type.result_type_set
				if l_result_type_set /= Void then
					propagate_call_agent_result_dynamic_types (an_expression, a_feature, l_result_type_set)
				end
					-- Set dynamic type sets of open operands.
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb = 1 and then (a_feature.is_builtin_routine_call or a_feature.is_builtin_function_item) and then current_dynamic_type.is_agent_type then
							-- This is something of the form:  'agent call ([...])' or 'agent item ([...])'
							-- Try to get the open operand type sets directly from the
							-- argument if it is a manifest tuple.
						l_routine_type ?= current_dynamic_type
						if l_routine_type = Void then
								-- Internal error: it has to be an agent type.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_actual := l_actuals.actual_argument (1)
							l_manifest_tuple ?= l_actual
							if l_manifest_tuple /= Void then
								l_open_operand_type_sets := l_routine_type.open_operand_type_sets
								nb := l_open_operand_type_sets.count
								if l_manifest_tuple.count < nb then
										-- Internal error: the actual argument conforms to the
										-- formal argument of 'call' or 'item', so there cannot
										-- be less items in the tuple.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									from i := 1 until i > nb loop
										l_actual_expression := l_manifest_tuple.expression (i)
										l_open_operand_type_set := l_open_operand_type_sets.item (i)
										propagate_argument_dynamic_types (l_actual_expression, l_open_operand_type_set)
										i := i + 1
									end
								end
							else
								l_not_done := True
							end
						end
					else
						l_not_done := True
					end
					if l_not_done then
						l_open_operand_type_sets := l_agent_type.open_operand_type_sets
						nb2 := l_open_operand_type_sets.count
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_actual_expression ?= l_actual
							if l_actual_expression /= Void then
								propagate_argument_operand_dynamic_types (l_actual_expression, i, a_feature)
							else
									-- Open operand.
								j := j + 1
								if j > nb2 then
										-- Internal error: missing open operands.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_open_operand_type_set := l_open_operand_type_sets.item (j)
									set_dynamic_type_set (l_open_operand_type_set, l_actual)
									propagate_argument_operand_dynamic_types (l_actual, i, a_feature)
								end
							end
							i := i + 1
						end
						if j < nb2 then
								-- Internal error: too many open operands.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
			end
		end

	report_void_constant (an_expression: ET_VOID) is
			-- Report that a Void has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.none_type
				if an_expression.index = 0 and none_index.item /= 0 then
					an_expression.set_index (none_index.item)
				end
				set_dynamic_type_set (l_type, an_expression)
				if none_index.item = 0 then
					none_index.put (an_expression.index)
				end
			end
		end

feature {NONE} -- Built-in features

	report_builtin_any_conforms_to (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.conforms_to' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_any_copy (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'ANY.copy' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_any_deep_twin (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.deep_twin' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_any_generating_type (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.generating_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_any_generating_type2 (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.generating_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'type: TYPE [like Current]'.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_result_type := l_result_type_set.static_type
					l_result_type.set_alive
					propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
				end
			end
		end

	report_builtin_any_generator (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.generator' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_any_is_deep_equal (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.is_deep_equal' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_any_same_type (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.same_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_any_standard_copy (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'ANY.standard_copy' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_any_standard_is_equal (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.standard_is_equal' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_any_standard_twin (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.standard_twin' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_any_tagged_out (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.tagged_out' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_any_twin (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.twin' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_copy_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
					-- Feature `copy' is called internally.
				l_copy_feature := current_dynamic_type.seeded_dynamic_procedure (universe.copy_seed, current_system)
				if l_copy_feature = Void then
						-- Internal error: all classes should have a feature
						-- 'copy'. Otherwise we get an error when parsing
						-- class ANY if there is no such feature.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_copy_feature.set_regular (True)
					propagate_builtin_argument_dynamic_types (current_dynamic_type, 1, l_copy_feature)
				end
			end
		end

	report_builtin_arguments_argument (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ARGUMENTS.argument' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_arguments_argument_count (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ARGUMENTS.argument_count' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_and (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "and"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_and_then (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "and then"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_implies (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "implies"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_item (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN_REF.item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_not (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.prefix "not"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_or (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "or"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_or_else (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "or else"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_boolean_set_item (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'BOOLEAN_REF.set_item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_boolean_xor (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "xor"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_function_item (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'FUNCTION.item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'item (i: OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_result_type_set.is_expanded then
					l_result_type := l_result_type_set.static_type
					l_result_type.set_alive
				end
			end
		end

	report_builtin_identified_eif_id_object (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'IDENTIFIED.eif_id_object' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_identified_eif_object_id (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'IDENTIFIED.eif_object_id' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_identified_eif_object_id_free (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'IDENTIFIED.eif_object_id_free' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_platform_boolean_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.boolean_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_character_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.character_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_integer_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.integer_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_is_dotnet (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.is_dotnet' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_is_thread_capable (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.is_thread_capable' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_is_unix (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.is_unix' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_is_vms (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.is_vms' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_is_windows (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.is_windows' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_pointer_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.pointer_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_real_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.real_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_platform_wide_character_bytes (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'PLATFORM.wide_character_bytes' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_pointer_hash_code (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'POINTER.hash_code' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_pointer_item (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'POINTER_REF.item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.pointer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_pointer_out (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'POINTER.out' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_pointer_plus (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'POINTER.infix "+"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.pointer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_pointer_set_item (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'POINTER_REF.set_item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_pointer_to_integer_32 (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'POINTER.to_integer_32' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_procedure_call (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'PROCEDURE.call' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_sized_character_code (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'code' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_character_item (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'item' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := a_character_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_character_natural_32_code (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'natural_32_code' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.natural_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_character_set_item (a_feature: ET_EXTERNAL_PROCEDURE; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'set_item' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		do
			-- Do nothing.
		end

	report_builtin_sized_character_to_character_8 (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_character_8' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.character_8_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_character_to_character_32 (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_character_32' from sized character type `a_character_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.character_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_integer_8 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_integer_8' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_8_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_integer_16 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_integer_16' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_16_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_integer_32 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_integer_32' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_integer_64 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_integer_64' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_64_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_natural_8 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_natural_8' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.natural_8_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_natural_16 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_natural_16' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.natural_16_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_natural_32 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_natural_32' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.natural_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_as_natural_64 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'as_natural_64' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.natural_64_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_and (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_and' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_not (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_not' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_or (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_or' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_shift_left (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_shift_left' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_shift_right (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_shift_right' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_bit_xor (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'bit_xor' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_div (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "//"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_divide (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "/"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_identity (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'prefix "+"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_item (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'item' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := an_integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_lt (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "<"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_minus (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "-"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_mod (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "\\"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_opposite (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'prefix "-"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_plus (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "+"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_power (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "^"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_set_item (a_feature: ET_EXTERNAL_PROCEDURE; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'set_item' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			-- Do nothing.
		end

	report_builtin_sized_integer_times (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "*"' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_character_8 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_character_8' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.character_8_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_character_32 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_character_32' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.character_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_double (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_double' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_real (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_real' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_real_32 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_real_32' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_integer_to_real_64 (a_feature: ET_EXTERNAL_FUNCTION; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_real_64' from sized integer type `an_integer_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_ceiling_real_32 (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'ceiling_real_32' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_ceiling_real_64 (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'ceiling_real_64' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_64_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_divide (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "/"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_floor_real_32 (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'floor_real_32' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_floor_real_64 (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'floor_real_64' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_64_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_identity (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'prefix "+"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_item (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'item' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := a_real_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_lt (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "<"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.boolean_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_minus (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "-"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_opposite (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'prefix "-"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_out (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'out' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_plus (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "+"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_power (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "^"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_set_item (a_feature: ET_EXTERNAL_PROCEDURE; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'set_item' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			-- Do nothing.
		end

	report_builtin_sized_real_times (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'infix "*"' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_to_double (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'to_double' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.double_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_truncated_to_integer (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'truncated_to_integer' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_truncated_to_integer_64 (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'truncated_to_integer_64' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_64_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_sized_real_truncated_to_real (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_DYNAMIC_TYPE) is
			-- Report that built-in feature 'truncated_to_real' from sized real type `a_real_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.real_32_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_special_aliased_resized_area (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'SPECIAL.aliased_resized_area' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				propagate_builtin_result_dynamic_types (current_dynamic_type, current_dynamic_feature)
			end
		end

	report_builtin_special_count (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'SPECIAL.count' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_special_element_size (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'SPECIAL.element_size' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_special_item (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'SPECIAL.item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'item (i: INTEGER): G'.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_result_type_set.is_expanded then
					l_result_type_set.static_type.set_alive
				end
			end
		end

	report_builtin_special_make (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'SPECIAL.make' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_special_put (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'SPECIAL.put' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_type_generating_type (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'TYPE.generating_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'type: TYPE [TYPE [ANY]]'.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_result_type := l_result_type_set.static_type
					l_result_type.set_alive
					propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
				end
			end
		end

	report_builtin_type_name (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'TYPE.name' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_system.set_string_type_alive
				propagate_builtin_result_dynamic_types (current_system.string_type, current_dynamic_feature)
			end
		end

	report_builtin_type_type_id (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'TYPE.type_id' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := current_system.integer_type
				l_result_type.set_alive
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

feature {ET_FEATURE_CHECKER} -- Access

	current_dynamic_type: ET_DYNAMIC_TYPE
			-- Target type of `current_dynamic_feature'

	current_dynamic_feature: ET_DYNAMIC_FEATURE
			-- Feature whose dynamic type sets are being built

	current_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of "Current" in `dynamic_type_sets'

	result_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of "Result" in `dynamic_type_sets'

	character_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of character expressions in `dynamic_type_sets'

	boolean_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of boolean expressions in `dynamic_type_sets'

	double_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of double expressions in `dynamic_type_sets'

	real_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of real expressions in `dynamic_type_sets'

	integer_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of integer expressions in `dynamic_type_sets'

	integer_8_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of integer_8 expressions in `dynamic_type_sets'

	integer_16_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of integer_16 expressions in `dynamic_type_sets'

	integer_32_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of integer_32 expressions in `dynamic_type_sets'

	integer_64_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of integer_64 expressions in `dynamic_type_sets'

	natural_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of natural expressions in `dynamic_type_sets'

	natural_8_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of natural_8 expressions in `dynamic_type_sets'

	natural_16_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of natural_16 expressions in `dynamic_type_sets'

	natural_32_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of natural_32 expressions in `dynamic_type_sets'

	natural_64_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of natural_64 expressions in `dynamic_type_sets'

	pointer_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of pointer expressions in `dynamic_type_sets'

	none_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of none expressions in `dynamic_type_sets'

	string_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of string expressions in `dynamic_type_sets'

feature {NONE} -- Implementation

	propagate_argument_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set `a_formal_type_set' of the
			-- corresponding formal argument.
		require
			an_actual_not_void: an_actual /= Void
			a_formal_type_set_not_void: a_formal_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_argument_operand_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set of the corresponding formal
			-- argument at index `a_formal' in `a_callee'.
		require
			an_actual_not_void: an_actual /= Void
			a_callee_not_void: a_callee /= Void
		do
			-- Do nothing.
		end

	propagate_assignment_dynamic_types (an_assignment: ET_ASSIGNMENT) is
			-- Propagate dynamic types of the source of `an_assignment'
			-- to the dynamic type set of the target of `an_assignment'.
		require
			an_assignment_not_void: an_assignment /= Void
		do
			-- Do nothing.
		end

	propagate_assignment_attempt_dynamic_types (an_assignment_attempt: ET_ASSIGNMENT_ATTEMPT) is
			-- Propagate dynamic types of the source of `an_assignment_attempt'
			-- to the dynamic type set of the target of `an_assignment_attempt'.
		require
			an_assignment_attempt_not_void: an_assignment_attempt /= Void
		do
			-- Do nothing.
		end

	propagate_builtin_argument_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the formal argument at index `a_formal' in `a_callee' when involved
			-- in built-in feature `current_dynamic_feature'.
		require
			a_source_type_set_not_void: a_source_type_set /= Void
			a_callee_not_void: a_callee /= Void
		do
			-- Do nothing.
		end

	propagate_builtin_result_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_query: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the result of the built-in feature `a_query'.
		require
			a_source_type_set_not_void: a_source_type_set /= Void
			a_query_not_void: a_query /= Void
		do
			-- Do nothing.
		end

	propagate_call_agent_result_dynamic_types (an_agent: ET_CALL_AGENT; a_query: ET_DYNAMIC_FEATURE; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the result of `a_query' to the dynamic type set
			-- `a_result_type_set' of the result of type of `an_agent' (probably a FUNCTION
			-- or a PREDICATE).
		require
			an_agent_not_void: an_agent /= Void
			a_query_not_void: a_query /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_creation_dynamic_type (a_creation_type: ET_DYNAMIC_TYPE; a_creation: ET_CREATION_INSTRUCTION) is
			-- Propagate the creation type `a_creation_type' of `a_creation'
			-- to the dynamic type set of the target of `a_creation'.
		require
			a_creation_type_not_void: a_creation_type /= Void
			a_creation_not_void: a_creation /= Void
		do
			-- Do nothing.
		end

	propagate_inline_agent_result_dynamic_types (an_agent: ET_INLINE_AGENT; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the result of the associated feature of `an_agent'
			-- to the dynamic type set `a_result_type_set' of the result of type of `an_agent'
			-- (probably a FUNCTION or a PREDICATE).
		require
			an_agent_not_void: an_agent /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_like_argument_dynamic_types (a_call: ET_FEATURE_CALL_EXPRESSION; a_formal_type_set, an_actual_type_set: ET_DYNAMIC_TYPE_SET) is
			-- When `a_call' is a call to a query whose type is of the form "like argument",
			-- propagate dynamic types `a_formal_type_set' of the result of that query
			-- to the dynamic type set `an_actual_type_set' of the call.
			-- `a_formal_type_set' has a static type which corresponds to the formal type of the argument.
			-- `an_actual_type_set' has a static type which corresponds to the actual type of the argument.
		require
			a_call_not_void: a_call /= Void
			a_formal_type_set_not_void: a_formal_type_set /= Void
			an_actual_type_set_not_void: an_actual_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_tuple_label_setter_dynamic_types (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the source of `an_assigner' to the dynamic
			-- type set `a_target_type_set' of the corresponding tuple label.
		require
			an_assigner_not_void: an_assigner /= Void
			tuple_label: an_assigner.call.name.is_tuple_label
			a_target_type_set_not_void: a_target_type_set /= Void
		do
			-- Do nothing.
		end

	dynamic_type_set (an_operand: ET_OPERAND): ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set associated with `an_operand';
			-- Void if unknown yet
		require
			an_operand_not_void: an_operand /= Void
		local
			i: INTEGER
		do
			i := an_operand.index
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	set_dynamic_type_set (a_dynamic_type_set: ET_DYNAMIC_TYPE_SET; an_operand: ET_OPERAND) is
			-- Set dynamic type set associated with `an_operand' to `a_dynamic_type_set'.
		require
			a_dynamic_type_set_not_void: a_dynamic_type_set /= Void
			an_operand_not_void: an_operand /= Void
		local
			i, nb: INTEGER
			l_none: ET_DYNAMIC_TYPE
		do
			i := an_operand.index
			if i = 0 then
				dynamic_type_sets.force_last (a_dynamic_type_set)
				an_operand.set_index (dynamic_type_sets.count)
			else
				nb := dynamic_type_sets.count
				if i <= nb then
					dynamic_type_sets.put (a_dynamic_type_set, i)
				else
					l_none := current_system.none_type
					i := i - 1
					from until nb >= i loop
						dynamic_type_sets.force_last (l_none)
						nb := nb + 1
					end
					dynamic_type_sets.force_last (a_dynamic_type_set)
				end
			end
		ensure
			dynamic_type_set_set: dynamic_type_set (an_operand) = a_dynamic_type_set
		end

	dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets of expressions within current feature

	dummy_dynamic_type: ET_DYNAMIC_TYPE is
			-- Dummy_dynamic type
		once
			create Result.make (current_type, current_class)
		ensure
			dummy_dynamic_type_not_void: Result /= Void
		end

	dummy_dynamic_feature: ET_DYNAMIC_FEATURE is
			-- Dummy dynamic feature
		once
			create Result.make (dummy_feature, dummy_dynamic_type, current_system)
		ensure
			dummy_dynamic_feature_not_void: Result /= Void
		end

feature {NONE} -- Constants

	tilde_class_name: ET_IDENTIFIER is
			-- Name of class containing `tilde_feature_name'
		once
			create Result.make ("KL_ANY_ROUTINES")
		ensure
			tilde_class_name_not_void: Result /= Void
		end

	tilde_feature_name: ET_IDENTIFIER is
			-- Name of  feature supposed to simulate the forthcoming
			-- '~' operator introduced in ECMA Eiffel 367
		once
			create Result.make ("equal_objects")
		ensure
			tilde_feature_name_not_void: Result /= Void
		end

invariant

	dynamic_type_sets_not_void: dynamic_type_sets /= Void
	current_dynamic_type_not_void: current_dynamic_type /= Void
	current_dynamic_feature_not_void: current_dynamic_feature /= Void
	current_index_not_void: current_index /= Void
	result_index_not_void: result_index /= Void
	character_index_not_void: character_index /= Void
	boolean_index_not_void: boolean_index /= Void
	double_index_not_void: double_index /= Void
	real_index_not_void: real_index /= Void
	integer_index_not_void: integer_index /= Void
	integer_8_index_not_void: integer_8_index /= Void
	integer_16_index_not_void: integer_16_index /= Void
	integer_32_index_not_void: integer_32_index /= Void
	integer_64_index_not_void: integer_64_index /= Void
	natural_index_not_void: natural_index /= Void
	natural_8_index_not_void: natural_8_index /= Void
	natural_16_index_not_void: natural_16_index /= Void
	natural_32_index_not_void: natural_32_index /= Void
	natural_64_index_not_void: natural_64_index /= Void
	pointer_index_not_void: pointer_index /= Void
	none_index_not_void: none_index /= Void
	string_index_not_void: string_index /= Void

end
