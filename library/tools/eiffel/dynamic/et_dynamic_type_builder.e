indexing

	description:

		"Eiffel dynamic type builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			make_from_checker, set_state,
			check_external_function_validity,
			check_external_procedure_validity,
			check_check_instruction_validity,
			check_debug_instruction_validity,
			check_loop_invariant_validity,
			check_loop_variant_validity,
			report_assignment,
			report_assignment_attempt,
			report_attribute_assignment_target,
			report_bit_constant,
			report_boolean_constant,
			report_character_constant,
			report_creation_expression,
			report_creation_instruction,
			report_current,
			report_current_type_needed,
			report_double_constant,
			report_equality_expression,
			report_formal_argument,
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
			report_qualified_call_expression,
			report_qualified_call_instruction,
			report_qualified_procedure_call_agent,
			report_qualified_query_call_agent,
			report_result,
			report_result_assignment_target,
			report_static_call_expression,
			report_static_call_instruction,
			report_string_constant,
			report_strip_expression,
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

create {ET_FEATURE_CHECKER}

	make_from_checker

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
			create dynamic_qualified_query_calls.make (100000)
			create dynamic_qualified_procedure_calls.make (100000)
			create current_index.make (0)
			create result_index.make (0)
			create character_index.make (0)
			create boolean_index.make (0)
			create double_index.make (0)
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

	make_from_checker (a_builder: like Current) is
			-- Create a new dynamic type set builder from `a_builder'.
		do
			if ANY_.same_types (a_builder, Current) then
				standard_copy (a_builder)
				current_class := universe.unknown_class
				current_type := current_class
				current_feature := dummy_feature
				feature_impl := dummy_feature
				create actual_context.make_with_capacity (current_type, 10)
				create formal_context.make_with_capacity (current_type, 10)
				create instruction_context.make_with_capacity (current_type, 10)
				create expression_context.make_with_capacity (current_type, 10)
				create assertion_context.make_with_capacity (current_type, 10)
				current_target_type := universe.any_class
				current_context := actual_context
			else
				make (a_builder.current_system)
			end
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
		do
			has_fatal_error := False
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
					i := i + 1
				end
					-- Process dynamic types.
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.was_alive then
						from j := old_nb + 1 until j > nb loop
							l_other_type := l_dynamic_types.item (j)
							if not l_type.is_expanded or else l_other_type.is_expanded then
								l_other_type.put_type (l_type, current_system)
							end
							j := j + 1
						end
					elseif l_type.is_alive then
						from j := 1 until j > nb loop
							l_other_type := l_dynamic_types.item (j)
							if not l_type.is_expanded or else l_other_type.is_expanded then
								l_other_type.put_type (l_type, current_system)
							end
							j := j + 1
						end
						l_type.set_was_alive
					end
					i := i + 1
				end
				old_nb := nb
					-- Process dynamic qualified query calls.
				nb := dynamic_qualified_query_calls.count
				from i := 1 until i > nb loop
					l_call := dynamic_qualified_query_calls.item (i)
					l_count := l_call.count
					l_call.propagate_types (Current)
					if l_call.count /= l_count then
						is_built := False
					end
					i := i + 1
				end
					-- Process dynamic qualified procedure calls.
				nb := dynamic_qualified_procedure_calls.count
				from i := 1 until i > nb loop
					l_call := dynamic_qualified_procedure_calls.item (i)
					l_count := l_call.count
					l_call.propagate_types (Current)
					if l_call.count /= l_count then
						is_built := False
					end
					i := i + 1
				end
			end
			check_catcall_validity
			dynamic_qualified_query_calls.wipe_out
			dynamic_qualified_procedure_calls.wipe_out
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
					error_handler.report_gibfl_error
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
			l_dynamic_type_sets := a_feature.dynamic_type_sets
			nb := l_dynamic_type_sets.count
			from i := 1 until i > nb loop
				dynamic_type_sets.force_last (l_dynamic_type_sets.item (i))
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
		do
			nb := dynamic_qualified_query_calls.count
			from i := 1 until i > nb loop
				l_call := dynamic_qualified_query_calls.item (i)
				check_catcall_call_validity (l_call)
				i := i + 1
			end
			nb := dynamic_qualified_procedure_calls.count
			from i := 1 until i > nb loop
				l_call := dynamic_qualified_procedure_calls.item (i)
				check_catcall_call_validity (l_call)
				i := i + 1
			end
		end

	check_catcall_call_validity (a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Check CAT-call validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
		do
			l_type := a_call.target_type_set.first_type
			if l_type /= Void then
				check_catcall_target_validity (l_type, a_call)
				l_other_types := a_call.target_type_set.other_types
				if l_other_types /= Void then
					nb := l_other_types.count
					from i := 1 until i > nb loop
						check_catcall_target_validity (l_other_types.item (i), a_call)
						i := i + 1
					end
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
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ARGUMENT_OPERANDS
			l_current_feature: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_other_types: ET_DYNAMIC_TYPE_LIST
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
				error_handler.report_gibcc_error
			else
				l_actuals := a_call.static_call.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb > 0 then
							-- Dynamic type sets for arguments are stored first
							-- in `dynamic_type_sets'.
						l_target_argument_type_sets := l_dynamic_feature.dynamic_type_sets
						if l_target_argument_type_sets.count < nb then
								-- Internal error: it has already been checked somewhere else
								-- that there was the same number of formal arguments in
								-- feature redeclaration.
							set_fatal_error
							error_handler.report_gibee_error
						else
							l_current_feature := a_call.current_feature
							from i := 1 until i > nb loop
								l_target_type_set := l_target_argument_type_sets.item (i)
								l_target_type := l_target_type_set.static_type
								l_source_type_set := l_current_feature.dynamic_type_set (l_actuals.actual_argument (i))
								if l_source_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibba_error
								else
									l_source_type := l_source_type_set.first_type
									if l_source_type /= Void then
										if not l_source_type.conforms_to_type (l_target_type, current_system) then
											report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_source_type, a_call)
										end
										l_other_types := l_source_type_set.other_types
										if l_other_types /= Void then
											nb2 := l_other_types.count
											from j := 1 until j > nb2 loop
												l_source_type := l_other_types.item (j)
												if not l_source_type.conforms_to_type (l_target_type, current_system) then
													report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_source_type, a_call)
												end
												j := j + 1
											end
										end
									end
								end
								i := i + 1
							end
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
				l_message.append_string (l_class_impl.name.name)
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
			set_fatal_error
			error_handler.report_error_message (l_message)
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
					inspect a_feature.builtin_code
					when builtin_any_twin then
						report_builtin_any_twin (a_feature)
					when builtin_any_same_type then
						report_builtin_any_same_type (a_feature)
					when builtin_any_standard_is_equal then
						report_builtin_any_standard_is_equal (a_feature)
					when builtin_special_item then
						report_builtin_special_item (a_feature)
					when builtin_special_count then
						report_builtin_special_count (a_feature)
					when builtin_character_code then
						report_builtin_character_code (a_feature)
					when builtin_character_lt then
						report_builtin_character_lt (a_feature)
					when builtin_character_gt then
						report_builtin_character_gt (a_feature)
					when builtin_character_le then
						report_builtin_character_le (a_feature)
					when builtin_character_ge then
						report_builtin_character_ge (a_feature)
					when builtin_integer_plus then
						report_builtin_integer_plus (a_feature)
					when builtin_integer_minus then
						report_builtin_integer_minus (a_feature)
					when builtin_integer_times then
						report_builtin_integer_times (a_feature)
					when builtin_integer_divide then
						report_builtin_integer_divide (a_feature)
					when builtin_integer_div then
						report_builtin_integer_div (a_feature)
					when builtin_integer_mod then
						report_builtin_integer_mod (a_feature)
					when builtin_integer_opposite then
						report_builtin_integer_opposite (a_feature)
					when builtin_integer_lt then
						report_builtin_integer_lt (a_feature)
					when builtin_integer_gt then
						report_builtin_integer_gt (a_feature)
					when builtin_integer_le then
						report_builtin_integer_le (a_feature)
					when builtin_integer_ge then
						report_builtin_integer_ge (a_feature)
					when builtin_integer_to_character then
						report_builtin_integer_to_character (a_feature)
					when builtin_integer_bit_or then
						report_builtin_integer_bit_or (a_feature)
					when builtin_integer_bit_shift_left then
						report_builtin_integer_bit_shift_left (a_feature)
					when builtin_boolean_and then
						report_builtin_boolean_and (a_feature)
					when builtin_boolean_and_then then
						report_builtin_boolean_and_then (a_feature)
					when builtin_boolean_or then
						report_builtin_boolean_or (a_feature)
					when builtin_boolean_or_else then
						report_builtin_boolean_or_else (a_feature)
					when builtin_boolean_not then
						report_builtin_boolean_not (a_feature)
					when builtin_boolean_implies then
						report_builtin_boolean_implies (a_feature)
					when builtin_boolean_xor then
						report_builtin_boolean_xor (a_feature)
					else
							-- Internal error: invalid built-in feature.
							-- Error already reported during parsing.
						set_fatal_error
						error_handler.report_gibii_error
					end
				end
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			Precursor (a_feature)
			if not has_fatal_error then
				if a_feature.is_builtin then
					inspect a_feature.builtin_code
					when builtin_any_standard_copy then
						report_builtin_any_standard_copy (a_feature)
					when builtin_special_make then
						report_builtin_special_make (a_feature)
					when builtin_special_put then
						report_builtin_special_put (a_feature)
					else
							-- Internal error: invalid built-in feature.
							-- Error already reported during parsing.
						set_fatal_error
						error_handler.report_gibij_error
					end
				end
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
			-- Do nothing.
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Report that an assignment attempt instruction has been processed.
		do
			-- Do nothing.
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
					error_handler.report_gibac_error
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

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_NAMED_TYPE;
		a_procedure: ET_PROCEDURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression has been processed.
		local
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				set_dynamic_type_set (l_dynamic_creation_type, an_expression)
			end
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_NAMED_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a creation instruction has been processed.
		local
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
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
				a_name.set_index (a_name.seed)
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
			-- has been processed.
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
				l_resolved_type := resolved_formal_parameters (a_local.type, feature_impl, current_type)
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
			l_parent_type: ET_DYNAMIC_TYPE
			l_precursor: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_query, l_parent_type, current_system)
				l_dynamic_type_set := l_precursor.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibau_error
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
			l_parent_type: ET_DYNAMIC_TYPE
			l_precursor: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_procedure, l_parent_type, current_system)
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
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_expression.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_gibbb_error
				else
					l_type := a_query.type
					l_dynamic_type := current_system.dynamic_type (l_type, l_target_type_set.static_type.base_type)
					l_result_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_result_type_set, an_expression)
					create l_dynamic_call.make (an_expression, l_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
					dynamic_qualified_query_calls.force_last (l_dynamic_call)
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
					error_handler.report_gibbe_error
				else
					create l_dynamic_call.make (an_instruction, l_dynamic_type_set, current_dynamic_feature, current_dynamic_type)
					dynamic_qualified_procedure_calls.force_last (l_dynamic_call)
				end
			end
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified procedure call (to `a_procedure') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
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
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_agent_type ?= l_dynamic_type
				if l_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_gibax_error
				else
					l_open_operand_type_sets := l_agent_type.open_operand_type_sets
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
						error_handler.report_gibaz_error
					else
						l_dynamic_feature := l_target_type_set.static_type.dynamic_procedure (a_procedure, current_system)
						report_agent_qualified_procedure_call (an_expression, l_target_type_set)
						l_dynamic_feature.set_regular (True)
							-- Set dynamic type sets of open operands.
							-- Dynamic type sets for arguments are stored first in `dynamic_type_sets'.
						l_argument_type_sets := l_dynamic_feature.dynamic_type_sets
						l_actuals := an_expression.arguments
						if l_actuals /= Void then
							nb := l_actuals.count
							if nb = 0 then
								-- Do nothing.
							elseif l_argument_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_gibfo_error
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
											error_handler.report_gibhl_error
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
									error_handler.report_gibhm_error
								end
							end
						end
					end
				end
			end
		end
		
	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified query call (to `a_query') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
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
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_agent_type ?= l_dynamic_type
				if l_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_gibjq_error
				else
					l_open_operand_type_sets := l_agent_type.open_operand_type_sets
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
					l_result_type_set := l_agent_type.result_type_set
					if l_target_type_set = Void then
							-- Internal error: the dynamic type sets of the
							-- target should be known at this stage.
						set_fatal_error
						error_handler.report_gibjr_error
					elseif l_result_type_set = Void then
							-- Internal error: if the corresponding feature is a query
							-- then the result type set should not be Void.
						set_fatal_error
						error_handler.report_giaaz_error
					else
						l_dynamic_feature := l_target_type_set.static_type.dynamic_query (a_query, current_system)
						report_agent_qualified_query_call (an_expression, l_target_type_set, l_result_type_set)
						l_dynamic_feature.set_regular (True)
							-- Set dynamic type sets of open operands.
							-- Dynamic type sets for arguments are stored first in `dynamic_type_sets'.
						l_argument_type_sets := l_dynamic_feature.dynamic_type_sets
						l_actuals := an_expression.arguments
						if l_actuals /= Void then
							nb := l_actuals.count
							if nb = 0 then
								-- Do nothing.
							elseif l_argument_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_gibjs_error
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
											error_handler.report_gibjt_error
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
									error_handler.report_gibju_error
								end
							end
						end
					end
				end
			end
		end

	report_agent_qualified_procedure_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Report the agent `an_expression' makes a qualified procedure call
			-- on `a_target_type_set'.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.target /= Void
			a_target_type_set_not_void: a_target_type_set /= Void
		local
			l_dynamic_procedure_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
		do
			create l_dynamic_procedure_call.make (an_expression, a_target_type_set, current_dynamic_feature, current_dynamic_type)
			dynamic_qualified_procedure_calls.force_last (l_dynamic_procedure_call)
		end

	report_agent_qualified_query_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Report the agent `an_expression' makes a qualified query call
			-- on `a_target_type_set' and returns `a_result_type_set'.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.target /= Void
			a_target_type_set_not_void: a_target_type_set /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		local
			l_dynamic_query_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
		do
			create l_dynamic_query_call.make (an_expression, a_target_type_set, a_result_type_set, current_dynamic_feature, current_dynamic_type)
			dynamic_qualified_query_calls.force_last (l_dynamic_query_call)
		end

	report_result (an_expression: ET_RESULT) is
			-- Report that the result entity has been processed.
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_feature.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a function cannot be void.
					set_fatal_error
					error_handler.report_gibbf_error
				else
					if an_expression.index = 0 and result_index.item /= 0 then
						an_expression.set_index (result_index.item)
					end
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
					if result_index.item = 0 then
						result_index.put (an_expression.index)
					end
				end
			end
		end

	report_result_assignment_target (a_result: ET_RESULT) is
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_feature.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a function cannot be void.
					set_fatal_error
					error_handler.report_gibbg_error
				else
					if a_result.index = 0 and result_index.item /= 0 then
						a_result.set_index (result_index.item)
					end
					set_dynamic_type_set (l_dynamic_type_set, a_result)
					if result_index.item = 0 then
						result_index.put (a_result.index)
					end
				end
			end
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY) is
			-- Report that a static call expression has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_dynamic_query := l_dynamic_type.dynamic_query (a_query, current_system)
				l_dynamic_query.set_static (True)
				l_dynamic_type.set_static (True)
				l_dynamic_type_set := l_dynamic_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibcl_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a static call instruction has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_dynamic_procedure := l_dynamic_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_static (True)
				l_dynamic_type.set_static (True)
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
			l_dynamic_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_query := current_dynamic_type.dynamic_query (a_query, current_system)
				l_dynamic_query.set_regular (True)
				l_dynamic_type_set := l_dynamic_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibck_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_procedure := current_dynamic_type.dynamic_procedure (a_procedure, current_system)
				l_dynamic_procedure.set_regular (True)
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
				report_unqualified_call_agent (an_expression, l_dynamic_feature, a_type, a_context)
			end
		end
	
	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_DYNAMIC_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: an_expression.target = Void
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			i, nb: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
		do
			a_feature.set_regular (True)
			l_dynamic_type := current_system.dynamic_type (a_type, a_context)
			l_dynamic_type.set_alive
			set_dynamic_type_set (l_dynamic_type, an_expression)
			l_agent_type ?= l_dynamic_type
			if l_agent_type = Void then
					-- Internal error: the dynamic type of an agent should be an agent type.
				set_fatal_error
				error_handler.report_gibeh_error
			else
					-- Set dynamic type sets of open operands.
				l_open_operand_type_sets := l_agent_type.open_operand_type_sets
				nb2 := l_open_operand_type_sets.count
					-- Dynamic type sets for arguments are stored first in `dynamic_type_sets'.
				l_argument_type_sets := a_feature.dynamic_type_sets
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibei_error
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
									error_handler.report_gibdp_error
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
							error_handler.report_gibdr_error
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

	report_builtin_any_twin (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.twin' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_copy_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_any_twin)
					-- Feature `copy' is called internally.
				l_copy_feature := current_dynamic_type.seeded_dynamic_procedure (universe.copy_seed, current_system)
				if l_copy_feature = Void then
						-- Internal error: all classes should have a feature
						-- 'copy'. Otherwise we get an error when parsing
						-- class ANY if there is no such feature.
					set_fatal_error
					error_handler.report_gibia_error
				else
					l_copy_feature.set_regular (True)
				end
			end
		end

	report_builtin_any_same_type (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.same_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_any_same_type)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_any_standard_is_equal (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'ANY.standard_is_equal' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_any_standard_is_equal)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_any_standard_copy (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'ANY.standard_copy' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_any_standard_copy)
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
				current_dynamic_feature.set_builtin_code (builtin_special_item)
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'item (i: INTEGER): G'.
					set_fatal_error
					error_handler.report_gibik_error
				elseif l_result_type_set.is_expanded then
					l_result_type_set.static_type.set_alive
				end
			end
		end

	report_builtin_special_count (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'SPECIAL.count' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_special_count)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_special_make (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'SPECIAL.make' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_special_make)
			end
		end

	report_builtin_special_put (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Report that built-in feature 'SPECIAL.put' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_special_put)
			end
		end

	report_builtin_character_code (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'CHARACTER.code' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_character_code)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_character_lt (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'CHARACTER.infix "<"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_character_lt)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_character_gt (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'CHARACTER.infix ">"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_character_gt)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_character_le (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'CHARACTER.infix "<="' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_character_le)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_character_ge (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'CHARACTER.infix ">="' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_character_ge)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_integer_plus (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "+"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_plus)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_minus (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "-"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_minus)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_times (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "*"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_times)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_divide (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "/"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_divide)
				current_system.double_type.set_alive
			end
		end

	report_builtin_integer_div (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "//"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_div)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_mod (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "\\"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_mod)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_opposite (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.prefix "-"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_opposite)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_lt (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "<"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_lt)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_integer_gt (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix ">"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_gt)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_integer_le (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix "<="' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_le)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_integer_ge (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.infix ">="' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_ge)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_integer_to_character (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.to_character' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_to_character)
				current_system.character_type.set_alive
			end
		end

	report_builtin_integer_bit_or (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.bit_or' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_bit_or)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_integer_bit_shift_left (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'INTEGER.bit_shift_left' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_integer_bit_shift_left)
				current_system.integer_type.set_alive
			end
		end

	report_builtin_boolean_and (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "and"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_and)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_and_then (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "and then"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_and_then)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_or (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "or"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_or)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_or_else (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "or else"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_or_else)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_implies (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "implies"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_implies)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_not (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.prefix "not"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_not)
				current_system.boolean_type.set_alive
			end
		end

	report_builtin_boolean_xor (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature 'BOOLEAN.infix "xor"' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_boolean_xor)
				current_system.boolean_type.set_alive
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

feature {ET_FEATURE_CHECKER} -- Status report

	set_state (other: like Current) is
			-- Set current state with state of `other'.
		do
			precursor (other)
			current_dynamic_type := other.current_dynamic_type
			current_dynamic_feature := other.current_dynamic_feature
			no_debug := other.no_debug
			no_assertion := other.no_assertion
		ensure then
			current_dynamic_type_set: current_dynamic_type = other.current_dynamic_type
			current_dynamic_feature_set: current_dynamic_feature = other.current_dynamic_feature
		end

feature {NONE} -- Implementation

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

	dynamic_qualified_query_calls: DS_ARRAYED_LIST [ET_DYNAMIC_QUALIFIED_QUERY_CALL]
			-- Dynamic qualified query calls within current feature

	dynamic_qualified_procedure_calls: DS_ARRAYED_LIST [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL]
			-- Dynamic qualified procedure calls within current feature

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

invariant

	dynamic_type_sets_not_void: dynamic_type_sets /= Void
	dynamic_qualified_query_calls_not_void: dynamic_qualified_query_calls /= Void
	no_void_dynamic_query_call: not dynamic_qualified_query_calls.has (Void)
	dynamic_qualified_procedure_calls_not_void: dynamic_qualified_procedure_calls /= Void
	no_void_dynamic_procedure_call: not dynamic_qualified_procedure_calls.has (Void)
	current_dynamic_type_not_void: current_dynamic_type /= Void
	current_dynamic_feature_not_void: current_dynamic_feature /= Void
	current_index_not_void: current_index /= Void
	result_index_not_void: result_index /= Void
	character_index_not_void: character_index /= Void
	boolean_index_not_void: boolean_index /= Void
	double_index_not_void: double_index /= Void
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
