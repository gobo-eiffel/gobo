indexing

	description:

		"Eiffel dynamic type set builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE_SET_BUILDER

inherit

	ET_FEATURE_CHECKER
		rename
			make as make_feature_checker
		export
			{ET_DYNAMIC_CALL, ET_DYNAMIC_TYPE} set_fatal_error
		redefine
			make_from_checker, set_state,
			check_check_instruction_validity,
			check_debug_instruction_validity,
			check_loop_invariant_validity,
			check_loop_variant_validity,
			report_agent_open_operand,
			report_assignment,
			report_assignment_attempt,
			report_attribute_assignment_target,
			report_bit_constant,
			report_boolean_constant,
			report_character_constant,
			report_convert_function,
			report_creation_expression,
			report_creation_instruction,
			report_current,
			report_double_constant,
			report_equality_expression,
			report_formal_argument,
			report_integer_constant,
			report_integer_8_constant,
			report_integer_16_constant,
			report_integer_64_constant,
			report_local_assignment_target,
			report_local_variable,
			report_local_variable_declaration,
			report_manifest_array,
			report_manifest_tuple,
			report_pointer_expression,
			report_precursor_expression,
			report_precursor_instruction,
			report_qualified_call_agent,
			report_qualified_call_expression,
			report_qualified_call_instruction,
			report_result,
			report_result_assignment_target,
			report_static_call_expression,
			report_static_call_instruction,
			report_string_constant,
			report_strip_expression,
			report_typed_pointer_expression,
			report_unqualified_call_agent,
			report_unqualified_call_expression,
			report_unqualified_call_instruction,
			report_void_constant
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

	make

creation {ET_FEATURE_CHECKER}

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
			create dynamic_type_sets.make (1000)
			create dynamic_calls.make (100000)
		ensure
			current_system_set: current_system = a_system
		end

	make_from_checker (a_builder: like Current) is
			-- Create a new dynamic type set builder from `a_builder'.
		do
			if same_type (a_builder) then
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

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	no_debug: BOOLEAN
			-- Should debug instructions be ignored?

	no_assertion: BOOLEAN
			-- Should assertions be ignored?

feature -- Status setting

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
		do
			Result := a_type
		ensure
			dynamic_type_set_not_void: Result /= Void
			static_type_set: Result.static_type = a_type
		end

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
			l_call: ET_DYNAMIC_CALL
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
						-- Process dynamic features.
					l_features := l_type.features
					if l_features /= Void then
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
					-- Process dynamic calls.
				nb := dynamic_calls.count
				from i := 1 until i > nb loop
					l_call := dynamic_calls.item (i)
					l_count := l_call.count
					propagate_call_types (l_call)
					if l_call.count /= l_count then
						is_built := False
					end
					i := i + 1
				end
			end
			check_catcall_validity
			dynamic_calls.wipe_out
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
			if a_feature.is_precursor then
				check_precursor_feature_validity (a_feature.static_feature, a_current_dynamic_type.base_type)
			else
				check_feature_validity (a_feature.static_feature, a_current_dynamic_type.base_type)
			end
			nb := dynamic_type_sets.count
			create l_dynamic_type_sets.make_with_capacity (nb)
			from i := 1 until i > nb loop
				l_dynamic_type_sets.put_last (dynamic_type_sets.item (i))
				i := i + 1
			end
			a_feature.set_dynamic_type_sets (l_dynamic_type_sets)
			a_feature.set_built (True)
			current_index := 0
			result_index := 0
			character_index := 0
			boolean_index := 0
			double_index := 0
			integer_index := 0
			integer_8_index := 0
			integer_16_index := 0
			integer_64_index := 0
			pointer_index := 0
			none_index := 0
			string_index := 0
			dynamic_type_sets.wipe_out
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
		end

	propagate_call_types (a_call: ET_DYNAMIC_CALL) is
			-- Propagate types from target type set in `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_count, old_count: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			l_target_type_set := a_call.target_type_set
			old_count := a_call.count
			l_count := l_target_type_set.count
			if l_count /= old_count then
				nb := l_count - old_count
				a_call.set_count (l_count)
				l_other_types := l_target_type_set.other_types
				if l_other_types /= Void then
					nb2 := l_other_types.count
					from j := nb2 until j < 1 loop
						propagate_call_type (l_other_types.item (j), a_call)
						i := i + 1
						if i < nb then
							j := j - 1
						else
								-- Jump out of the loop.
							j := 0
						end
					end
				end
				if i < nb then
					l_type := l_target_type_set.first_type
					if l_type /= Void then
						propagate_call_type (l_type, a_call)
					else
							-- Internal error: the type counts are corrupted.
						set_fatal_error
						error_handler.report_gibfm_error
					end
				end
			end
		end

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_FEATURE_CALL
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_target_type_set := a_call.target_type_set
			l_static_call := a_call.static_call
			l_seed := l_static_call.name.seed
			l_feature := a_type.base_class.seeded_feature (l_seed)
			if l_feature = Void then
				if a_type.conforms_to_type (l_target_type_set.static_type, current_system) then
						-- Internal error: there should be a feature with seed
						-- `l_seed' in all descendants of `l_target_type_set.static_type'.
					set_fatal_error
					error_handler.report_gibfl_error
				else
					-- The error has already been reported somewhere else.
				end
			else
				l_dynamic_feature := a_type.dynamic_feature (l_feature, current_system)
				l_dynamic_feature.set_regular (True)
			end
		end

feature {NONE} -- CAT-calls

	check_catcall_validity is
			-- Check CAT-call validity.
		local
			i, nb: INTEGER
			l_call: ET_DYNAMIC_CALL
		do
			nb := dynamic_calls.count
			from i := 1 until i > nb loop
				l_call := dynamic_calls.item (i)
				check_catcall_call_validity (l_call)
				i := i + 1
			end
		end

	check_catcall_call_validity (a_call: ET_DYNAMIC_CALL) is
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

	check_catcall_target_validity (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_CALL) is
			-- Check whether target type `a_type' introduces CAT-calls in `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		local
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_source_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_other_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type: ET_DYNAMIC_TYPE
		do
			l_seed := a_call.static_call.name.seed
			l_feature := a_type.base_class.seeded_feature (l_seed)
			if l_feature = Void then
					-- Internal error: there should be a feature with seed
					-- `l_seed' in all descendants of `target_type.static_type'.
				set_fatal_error
				error_handler.report_gibcc_error
			else
				l_dynamic_feature := a_type.dynamic_feature (l_feature, current_system)
				l_source_argument_type_sets := a_call.argument_type_sets
				nb := l_source_argument_type_sets.count
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
						from i := 1 until i > nb loop
							l_target_type_set := l_target_argument_type_sets.item (i)
							l_target_type := l_target_type_set.static_type
							l_source_type_set := l_source_argument_type_sets.item (i)
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
							i := i + 1
						end
					end
				end
			end
		end

	report_catcall_error (a_target_type: ET_DYNAMIC_TYPE; a_dynamic_feature: ET_DYNAMIC_FEATURE;
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; an_actual_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_CALL) is
			-- Report a CAT-call error in `a_call'. When the target is of type `a_target_type', we
			-- try to pass to the corresponding feature `a_dynamic_feature' an actual
			-- argument of type `an_actual_type' which does not conform to the type of
			-- the `arg'-th corresponding formal argument `a_formal_type'.
		require
			a_taarget_type_not_void: a_target_type /= Void
			a_dynamic_feature_not_void: a_dynamic_feature /= Void
			a_formal_type_not_void: a_formal_type /= Void
			an_actual_type_not_void: an_actual_type /= Void
			a_call_not_void: a_call /= Void
--		local
--			l_message: STRING
--			l_class_impl: ET_CLASS
		do
-- TODO: better error message reporting.
--			l_message := shared_error_message
--			STRING_.wipe_out (l_message)
--			l_message.append_string ("[CATCALL] class ")
--			l_message.append_string (a_call.current_type.base_type.to_text)
--			l_message.append_string (" (")
--			l_class_impl := a_call.current_feature.static_feature.implementation_class
--			if a_call.current_type.base_type.direct_base_class (universe) /= l_class_impl then
--				l_message.append_string (l_class_impl.name.name)
--				l_message.append_character (',')
--			end
--			l_message.append_string (a_call.position.line.out)
--			l_message.append_character (',')
--			l_message.append_string (a_call.position.column.out)
--			l_message.append_string ("): type '")
--			l_message.append_string (an_actual_type.base_type.to_text)
--			l_message.append_string ("' of actual argument #")
--			l_message.append_string (arg.out)
--			l_message.append_string (" does not conform to type '")
--			l_message.append_string (a_formal_type.base_type.to_text)
--			l_message.append_string ("' of formal argument in feature `")
--			l_message.append_string (a_dynamic_feature.static_feature.name.name)
--			l_message.append_string ("' in class '")
--			l_message.append_string (a_target_type.base_type.to_text)
--			l_message.append_string ("%'")
--			set_fatal_error
--			error_handler.report_error_message (l_message)
--			STRING_.wipe_out (l_message)
		end

	shared_error_message: STRING is
			-- Shared error message (used in `report_catcall_error')
		once
			Result := STRING_.make (200)
		ensure
			shared_error_message_not_void: Result /= Void
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

	report_agent_open_operand (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an agent open operand of type `a_type' 
			-- in `a_context' has been processed.
		local
--			l_type: ET_DYNAMIC_TYPE
		do
--			if current_type = current_dynamic_type.base_type then
--				l_type := current_system.dynamic_type (a_type, a_context)
--				dynamic_type_set_stack.force (l_type)
--			end
		end

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

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_FEATURE) is
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_type.dynamic_feature (an_attribute, current_system).result_type_set
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
				if a_constant.index = 0 and boolean_index /= 0 then
					a_constant.set_index (boolean_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if boolean_index = 0 then
					boolean_index := a_constant.index
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
				if a_constant.index = 0 and character_index /= 0 then
					a_constant.set_index (character_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if character_index = 0 then
					character_index := a_constant.index
				end
			end
		end

	report_convert_function (an_expression: ET_CONVERT_TO_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a convert function call expression has been processed.
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_CALL
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_target: ET_EXPRESSION
			l_type: ET_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_expression.expression
				l_dynamic_type_set := dynamic_type_set (l_target)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type set of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_gibdp_error
				else
					create l_dynamic_call.make (an_expression, l_dynamic_type_set, current_dynamic_feature, current_dynamic_type)
					dynamic_calls.force_last (l_dynamic_call)
					l_type := a_feature.type
					if l_type = Void then
							-- Internal error: the result type set of a query cannot be void.
						set_fatal_error
						error_handler.report_gibdr_error
					else
						l_dynamic_type := current_system.dynamic_type (l_type, l_dynamic_type_set.static_type.base_type)
						l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
						l_dynamic_call.set_result_type_set (l_dynamic_type_set)
						set_dynamic_type_set (l_dynamic_type_set, an_expression)
					end
				end
			end
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_NAMED_TYPE;
		a_procedure: ET_FEATURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression has been processed.
		local
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_feature (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				set_dynamic_type_set (l_dynamic_creation_type, an_expression)
			end
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_NAMED_TYPE; a_procedure: ET_FEATURE) is
			-- Report that a creation instruction has been processed.
		local
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_feature (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
			end
		end

	report_current (an_expression: ET_CURRENT) is
			-- Report that the current entity has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				if an_expression.index = 0 and current_index /= 0 then
					an_expression.set_index (current_index)
				end
				set_dynamic_type_set (current_dynamic_type, an_expression)
				if current_index = 0 then
					current_index := an_expression.index
				end
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
				if a_constant.index = 0 and double_index /= 0 then
					a_constant.set_index (double_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if double_index = 0 then
					double_index := a_constant.index
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
				if an_expression.index = 0 and boolean_index /= 0 then
					an_expression.set_index (boolean_index)
				end
				set_dynamic_type_set (l_type, an_expression)
				if boolean_index = 0 then
					boolean_index := an_expression.index
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
				if a_constant.index = 0 and integer_index /= 0 then
					a_constant.set_index (integer_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_index = 0 then
					integer_index := a_constant.index
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
				if a_constant.index = 0 and integer_8_index /= 0 then
					a_constant.set_index (integer_8_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_8_index = 0 then
					integer_8_index := a_constant.index
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
				if a_constant.index = 0 and integer_16_index /= 0 then
					a_constant.set_index (integer_16_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_16_index = 0 then
					integer_16_index := a_constant.index
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
				if a_constant.index = 0 and integer_64_index /= 0 then
					a_constant.set_index (integer_64_index)
				end
				set_dynamic_type_set (l_type, a_constant)
				if integer_64_index = 0 then
					integer_64_index := a_constant.index
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
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_generic_class_type: ET_GENERIC_CLASS_TYPE
			l_special_class: ET_CLASS
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, current_type)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
				l_actual_parameters := l_type.base_type.actual_parameters
				if l_actual_parameters = Void then
						-- Internal error: an array type should have one generic parameter.
					set_fatal_error
					error_handler.report_gibcm_error
				else
					l_special_class := universe.special_class
					create l_generic_class_type.make (Void, l_special_class.name, l_actual_parameters, l_special_class)
					l_special_type ?= current_system.dynamic_type (l_generic_class_type, current_type)
					if l_special_type = Void then
							-- Internal error: we just built a special type.
						set_fatal_error
						error_handler.report_gibcn_error
					else
						l_special_type.set_alive
					end
				end
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

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION) is
			-- Report that a pointer expression has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.pointer_type
				l_type.set_alive
				if an_expression.index = 0 and pointer_index /= 0 then
					an_expression.set_index (pointer_index)
				end
				set_dynamic_type_set (l_type, an_expression)
				if pointer_index = 0 then
					pointer_index := an_expression.index
				end
			end
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_feature' is the precursor feature.
		local
			l_parent_type: ET_DYNAMIC_TYPE
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_query := current_dynamic_feature.dynamic_precursor (a_feature, l_parent_type, current_system)
				l_dynamic_type_set := l_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibau_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR; a_parent_type: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_feature' is the precursor feature.
		local
			l_parent_type: ET_DYNAMIC_TYPE
			l_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_procedure := current_dynamic_feature.dynamic_precursor (a_feature, l_parent_type, current_system)
			end
		end

	report_qualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		local
--			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
--			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
--			l_call: ET_DYNAMIC_CALL
--			l_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST
--			l_attachment: ET_DYNAMIC_AGENT_ACTUAL_ARGUMENT
--			l_implicit: ET_DYNAMIC_AGENT_IMPLICIT_ACTUAL_ARGUMENT
--			l_source, l_next: ET_DYNAMIC_ATTACHMENT
		do
			if current_type = current_dynamic_type.base_type then
--				if dynamic_call_stack.is_empty then
--						-- Internal error: the stack of dynamic calls should 
--						-- at least contain the item for the current
--						-- qualified call.
--					set_fatal_error
--					error_handler.report_gibax_error
--				else
--					l_call := dynamic_call_stack.item
--					dynamic_call_stack.remove
--					if a_feature.arguments /= Void then
--						nb := a_feature.arguments.count
--					end
--					if dynamic_type_set_stack.count < nb + 1 then
--							-- Internal error: the stack of dynamic type sets should 
--							-- at least contain the items for the arguments of the
--							-- qualified call.
--						set_fatal_error
--						error_handler.report_gibay_error
--					else
--						l_dynamic_type_set := dynamic_type_set_stack.i_th (dynamic_type_set_stack.count - nb)
--						l_call.reset (an_expression.target, l_dynamic_type_set, an_expression.name, a_feature, current_feature, current_type, current_system)
--						if nb > 0 then
--							l_actuals := an_expression.arguments
--							if l_actuals = Void then
--									-- Agent's operands are store in the stack in reverse order.
--								from i := 1 until i > nb loop
--									l_dynamic_type_set := dynamic_type_set_stack.item
--									dynamic_type_set_stack.remove
--									create l_implicit.make (l_dynamic_type_set, an_expression.name, current_feature, current_type)
--									l_implicit.set_next_attachment (l_source)
--									l_source := l_implicit
--									i := i + 1
--								end
--								from until
--									l_source = Void
--								loop
--									l_next := l_source.next_attachment
--									l_source.set_next_attachment (Void)
--									l_call.put_argument_source (l_source)
--									l_source := l_next
--								end
--							elseif l_actuals.count /= nb then
--									-- Internal error: it has already been checked somewhere else
--									-- that there was the same number of actual and formal arguments.
--								set_fatal_error
--								error_handler.report_gibaz_error
--							else
--									-- Agent's operands are store in the stack in reverse order.
--								from i := 1 until i > nb loop
--									l_dynamic_type_set := dynamic_type_set_stack.item
--									dynamic_type_set_stack.remove
--									create l_attachment.make (l_dynamic_type_set, l_actuals.actual_argument (i), current_feature, current_type)
--									l_attachment.set_next_attachment (l_source)
--									l_source := l_attachment
--									i := i + 1
--								end
--								from until
--									l_source = Void
--								loop
--									l_next := l_source.next_attachment
--									l_source.set_next_attachment (Void)
--									l_call.put_argument_source (l_source)
--									l_source := l_next
--								end
--							end
--						end
--							-- Remove target type.
--						dynamic_type_set_stack.remove
						l_dynamic_type := current_system.dynamic_type (a_type, a_context)
--						dynamic_type_set_stack.force (l_dynamic_type)
						set_dynamic_type_set (l_dynamic_type, an_expression)
--					end
--				end
			end
		end

	report_qualified_call_expression (an_expression: ET_EXPRESSION; a_call: ET_FEATURE_CALL; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a qualified call expression has been processed.
		local
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_CALL
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target: ET_EXPRESSION
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_target := a_call.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_gibbb_error
				else
					create l_dynamic_call.make (a_call, l_target_type_set, current_dynamic_feature, current_dynamic_type)
					dynamic_calls.force_last (l_dynamic_call)
					l_actuals := a_call.arguments
					if l_actuals /= Void then
						nb := l_actuals.count
						if nb > 0 then
							create l_argument_type_sets.make_with_capacity (nb)
							l_dynamic_call.set_argument_type_sets (l_argument_type_sets)
							from i := 1 until i > nb loop
								l_actual := l_actuals.actual_argument (i)
								l_dynamic_type_set := dynamic_type_set (l_actual)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibba_error
								else
									l_argument_type_sets.put_last (l_dynamic_type_set)
								end
								i := i + 1
							end
						end
					end
					l_type := a_feature.type
					if l_type = Void then
							-- Internal error: the result type set of a query cannot be void.
						set_fatal_error
						error_handler.report_gibbc_error
					else
						l_dynamic_type := current_system.dynamic_type (l_type, l_target_type_set.static_type.base_type)
						l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
						l_dynamic_call.set_result_type_set (l_dynamic_type_set)
						set_dynamic_type_set (l_dynamic_type_set, an_expression)
					end
				end
			end
		end

	report_qualified_call_instruction (a_call: ET_FEATURE_CALL; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a qualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_CALL
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target: ET_EXPRESSION
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_target := a_call.target
				l_dynamic_type_set := dynamic_type_set (l_target)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_gibbe_error
				else
					create l_dynamic_call.make (a_call, l_dynamic_type_set, current_dynamic_feature, current_dynamic_type)
					dynamic_calls.force_last (l_dynamic_call)
					l_actuals := a_call.arguments
					if l_actuals /= Void then
						nb := l_actuals.count
						if nb > 0 then
							create l_argument_type_sets.make_with_capacity (nb)
							l_dynamic_call.set_argument_type_sets (l_argument_type_sets)
							from i := 1 until i > nb loop
								l_actual := l_actuals.actual_argument (i)
								l_dynamic_type_set := dynamic_type_set (l_actual)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibbd_error
								else
									l_argument_type_sets.put_last (l_dynamic_type_set)
								end
								i := i + 1
							end
						end
					end
				end
			end
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
					if an_expression.index = 0 and result_index /= 0 then
						an_expression.set_index (result_index)
					end
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
					if result_index = 0 then
						result_index := an_expression.index
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
					if a_result.index = 0 and result_index /= 0 then
						a_result.set_index (result_index)
					end
					set_dynamic_type_set (l_dynamic_type_set, a_result)
					if result_index = 0 then
						result_index := a_result.index
					end
				end
			end
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call expression has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_query := l_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_static (True)
				l_dynamic_type.set_static (True)
				l_dynamic_type_set := l_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibcl_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_static_call_instruction (an_instruction: ET_STATIC_FEATURE_CALL; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call instruction has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_procedure := l_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_static (True)
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
				l_type.set_alive
				if a_string.index = 0 and string_index /= 0 then
					a_string.set_index (string_index)
				end
				set_dynamic_type_set (l_type, a_string)
				if string_index = 0 then
					string_index := a_string.index
				end
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

	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		local
--			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
--			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_feature: ET_DYNAMIC_FEATURE
--			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
--			l_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST
--			l_attachment: ET_DYNAMIC_AGENT_ACTUAL_ARGUMENT
--			l_implicit: ET_DYNAMIC_AGENT_IMPLICIT_ACTUAL_ARGUMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_dynamic_feature.set_regular (True)
-- TODO
--				l_argument_types := l_dynamic_feature.argument_types
--				if l_argument_types /= Void then
--					l_actuals := an_expression.arguments
--					nb := l_argument_types.count
--					if dynamic_type_set_stack.count < nb then
--							-- Internal error: the stack of dynamic type sets should 
--							-- at least contain the items for the arguments of the
--							-- unqualified call.
--						set_fatal_error
--						error_handler.report_gibbm_error
--					elseif l_actuals = Void then
--							-- Agent's operands are store in the stack in reverse order.
--						from i := 1 until i > nb loop
--							l_dynamic_type_set := dynamic_type_set_stack.item
--							dynamic_type_set_stack.remove
--							create l_implicit.make (l_dynamic_type_set, an_expression.name, current_feature, current_type)
--							l_argument_types.item (i).put_source (l_implicit, current_system)
--							i := i + 1
--						end
--					elseif l_actuals.count /= nb then
--							-- Internal error: it has already been checked somewhere else
--							-- that there was the same number of actual and formal arguments.
--						set_fatal_error
--						error_handler.report_gibbn_error
--					else
--							-- Agent's operands are store in the stack in reverse order.
--						from i := 1 until i > nb loop
--							l_dynamic_type_set := dynamic_type_set_stack.item
--							dynamic_type_set_stack.remove
--							create l_attachment.make (l_dynamic_type_set, l_actuals.actual_argument (i), current_feature, current_type)
--							l_argument_types.item (i).put_source (l_attachment, current_system)
--							i := i + 1
--						end
--					end
--				end
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
			end
		end

	report_unqualified_call_expression (an_expression: ET_EXPRESSION; a_call: ET_FEATURE_CALL; a_feature: ET_FEATURE) is
			-- Report that an unqualified call expression has been processed.
		local
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_query := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_regular (True)
				l_dynamic_type_set := l_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibck_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_unqualified_call_instruction (a_call: ET_FEATURE_CALL; a_feature: ET_FEATURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			l_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_procedure := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_regular (True)
			end
		end

	report_void_constant (an_expression: ET_VOID) is
			-- Report that a Void has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.none_type
				if an_expression.index = 0 and none_index /= 0 then
					an_expression.set_index (none_index)
				end
				set_dynamic_type_set (l_type, an_expression)
				if none_index = 0 then
					none_index := an_expression.index
				end
			end
		end

feature {ET_FEATURE_CHECKER} -- Access

	current_dynamic_type: ET_DYNAMIC_TYPE
			-- Target type of `current_dynamic_feature'

	current_dynamic_feature: ET_DYNAMIC_FEATURE
			-- Feature whose dynamic type sets are being built

	current_index: INTEGER
			-- Index of dynamic type set of "Current" in `dynamic_type_sets'

	result_index: INTEGER
			-- Index of dynamic type set of "Result" in `dynamic_type_sets'

	character_index: INTEGER
			-- Index of dynamic type set of character expressions in `dynamic_type_sets'

	boolean_index: INTEGER
			-- Index of dynamic type set of boolean expressions in `dynamic_type_sets'

	double_index: INTEGER
			-- Index of dynamic type set of double expressions in `dynamic_type_sets'

	integer_index: INTEGER
			-- Index of dynamic type set of integer expressions in `dynamic_type_sets'

	integer_8_index: INTEGER
			-- Index of dynamic type set of integer_8 expressions in `dynamic_type_sets'

	integer_16_index: INTEGER
			-- Index of dynamic type set of integer_16 expressions in `dynamic_type_sets'

	integer_64_index: INTEGER
			-- Index of dynamic type set of integer_64 expressions in `dynamic_type_sets'

	pointer_index: INTEGER
			-- Index of dynamic type set of pointer expressions in `dynamic_type_sets'

	none_index: INTEGER
			-- Index of dynamic type set of none expressions in `dynamic_type_sets'

	string_index: INTEGER
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
			current_index := other.current_index
			result_index := other.result_index
			character_index := other.character_index
			boolean_index := other.boolean_index
			double_index := other.double_index
			integer_index := other.integer_index
			integer_8_index := other.integer_8_index
			integer_16_index := other.integer_16_index
			integer_64_index := other.integer_64_index
			pointer_index := other.pointer_index
			none_index := other.none_index
			string_index := other.string_index
		ensure then
			current_dynamic_type_set: current_dynamic_type = other.current_dynamic_type
			current_dynamic_feature_set: current_dynamic_feature = other.current_dynamic_feature
			current_index_set: current_index = other.current_index
			result_index_set: result_index = other.result_index
			character_index_set: character_index = other.character_index
			boolean_index_set: boolean_index = other.boolean_index
			double_index_set: double_index = other.double_index
			integer_index_set: integer_index = other.integer_index
			integer_8_index_set: integer_8_index = other.integer_8_index
			integer_16_index_set: integer_16_index = other.integer_16_index
			integer_64_index_set: integer_64_index = other.integer_64_index
			pointer_index_set: pointer_index = other.pointer_index
			none_index_set: none_index = other.none_index
			string_index_set: string_index = other.string_index
		end

feature {NONE} -- Implementation

	dynamic_type_set (an_expression: ET_EXPRESSION): ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set associated with `an_expression';
			-- Void if unknown yet
		require
			an_expression_not_void: an_expression /= Void
		local
			i: INTEGER
		do
			i := an_expression.index
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	set_dynamic_type_set (a_dynamic_type_set: ET_DYNAMIC_TYPE_SET; an_expression: ET_EXPRESSION) is
			-- Set dynamic type set associated with `an_expression' to `a_dynamic_type_set'.
		require
			a_dynamic_type_set_not_void: a_dynamic_type_set /= Void
			an_expression_not_void: an_expression /= Void
		local
			i, nb: INTEGER
			l_none: ET_DYNAMIC_TYPE
		do
			i := an_expression.index
			if i = 0 then
				dynamic_type_sets.force_last (a_dynamic_type_set)
				an_expression.set_index (dynamic_type_sets.count)
			else
				nb := dynamic_type_sets.count
				if i <= nb then
					dynamic_type_sets.replace (a_dynamic_type_set, i)
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
			dynamic_type_set_set: dynamic_type_set (an_expression) = a_dynamic_type_set
		end

	dynamic_type_sets: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE_SET]
			-- Dynamic type sets of expressions within current feature

	dynamic_calls: DS_ARRAYED_LIST [ET_DYNAMIC_CALL]
			-- Dynamic qualified calls within current feature

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
	no_void_dynamic_type_set: not dynamic_type_sets.has (Void)
	dynamic_calls_not_void: dynamic_calls /= Void
	no_void_dynamic_call: not dynamic_calls.has (Void)
	current_dynamic_type_not_void: current_dynamic_type /= Void
	current_dynamic_feature_not_void: current_dynamic_feature /= Void
	current_system_not_void: current_system /= Void

end
