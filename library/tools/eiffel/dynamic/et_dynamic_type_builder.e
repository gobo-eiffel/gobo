note

	description:

		"Eiffel dynamic type builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
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
		undefine
			current_system
		redefine
			has_fatal_error,
			check_external_function_validity,
			check_external_procedure_validity,
			check_check_instruction_validity,
			check_debug_instruction_validity,
			check_loop_invariant_validity,
			check_loop_variant_validity,
			report_across_cursor,
			report_across_cursor_declaration,
			report_across_expression,
			report_assignment,
			report_assignment_attempt,
			report_attribute_address,
			report_attribute_assignment_target,
			report_bit_constant,
			report_boolean_constant,
			report_character_8_constant,
			report_character_32_constant,
			report_builtin_conversion,
			report_creation_expression,
			report_creation_instruction,
			report_current,
			report_current_type_needed,
			report_equality_expression,
			report_formal_argument,
			report_formal_argument_declaration,
			report_function_address,
			report_inline_agent_formal_argument_declaration,
			report_inline_agent_local_variable_declaration,
			report_inline_agent_result_declaration,
			report_integer_8_constant,
			report_integer_16_constant,
			report_integer_32_constant,
			report_integer_64_constant,
			report_local_assignment_target,
			report_local_variable,
			report_local_variable_declaration,
			report_manifest_array,
			report_manifest_tuple,
			report_manifest_type,
			report_named_object_test,
			report_natural_8_constant,
			report_natural_16_constant,
			report_natural_32_constant,
			report_natural_64_constant,
			report_object_equality_expression,
			report_object_test,
			report_object_test_local,
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
			report_real_32_constant,
			report_real_64_constant,
			report_result,
			report_result_assignment_target,
			report_static_call_expression,
			report_static_call_instruction,
			report_string_8_constant,
			report_string_32_constant,
			report_strip_expression,
			report_tuple_label_call_agent,
			report_tuple_label_expression,
			report_tuple_label_setter,
			report_typed_pointer_expression,
			report_unqualified_call_expression,
			report_unqualified_call_instruction,
			report_unqualified_procedure_call_agent,
			report_unqualified_query_call_agent,
			report_void_constant,
			feature_checker
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

	make (a_system: like current_dynamic_system)
			-- Create a new dynamic type set builder.
		require
			a_system_not_void: a_system /= Void
		do
			current_dynamic_system := a_system
			make_feature_checker
			create feature_checker.make
			current_dynamic_type := dummy_dynamic_type
			current_dynamic_feature := dummy_dynamic_feature
			create dynamic_type_sets.make_with_capacity (1000)
			object_id_dynamic_type_set := dummy_dynamic_type
			create current_index.make (0)
			create result_index.make (0)
			create constant_indexes.make_map (16)
			create none_index.make (0)
			catcall_error_mode := True
		ensure
			current_dynamic_system_set: current_dynamic_system = a_system
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET
			-- New dynamic type set
		do
			Result := a_type.conforming_dynamic_types
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when building
			-- dynamic type sets?

feature -- Generation

	build_dynamic_type_sets
			-- Build dynamic type sets for `current_dynamic_system'.
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
			l_equality: ET_DYNAMIC_EQUALITY_EXPRESSION
			l_object_equality: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION
		do
			has_fatal_error := False
			old_object_id_dynamic_type_set := object_id_dynamic_type_set
			object_id_dynamic_type_set := new_dynamic_type_set (current_dynamic_system.any_type)
			l_dynamic_types := current_dynamic_system.dynamic_types
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
						-- Process dynamic equality expressions.
					from
						l_equality := l_type.equality_expressions
					until
						l_equality = Void
					loop
						l_count := l_equality.count
						l_equality.propagate_types (Current)
						if l_equality.count /= l_count then
							is_built := False
						end
						l_equality := l_equality.next
					end
						-- Process dynamic object-equality expressions.
					from
						l_object_equality := l_type.object_equality_expressions
					until
						l_object_equality = Void
					loop
						l_count := l_object_equality.count
						l_object_equality.propagate_types (Current)
						if l_object_equality.count /= l_count then
							is_built := False
						end
						l_object_equality := l_object_equality.next
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
						if l_type.conforms_to_type (l_other_type) then
							l_other_type.conforming_dynamic_types.put_type (l_type)
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

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate `a_type' from target type set `a_call'.
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if not a_call.is_tuple_label then
				l_dynamic_feature := a_call.seeded_dynamic_feature (a_type, current_dynamic_system)
				if l_dynamic_feature = Void then
					l_target_type_set := a_call.target_type_set
					if a_type.conforms_to_type (l_target_type_set.static_type) then
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
			else
				a_call.put_type_with_tuple_label (a_type, Current)
			end
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_tuple_label_expression_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL; a_type: ET_DYNAMIC_TYPE)
			-- Propagate dynamic types of the label in tuple `a_type' to
			-- the dynamic type set of the result type of `a_call'.
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_index: INTEGER
			l_label_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			old_feature: ET_DYNAMIC_FEATURE
			old_type: ET_DYNAMIC_TYPE
		do
			old_feature := current_dynamic_feature
			current_dynamic_feature := a_call.current_feature
			old_type := current_dynamic_type
			current_dynamic_type := a_call.current_type
			l_tuple_type ?= a_type
			if l_tuple_type = Void then
					-- Internal error: the target of a label expression
					-- should be a Tuple.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_result_type_set := a_call.result_type_set
				l_item_type_sets := l_tuple_type.item_type_sets
				l_index := a_call.static_call.name.seed
				if not l_item_type_sets.valid_index (l_index) then
						-- Internal error: invalid label index.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_label_type_set := l_item_type_sets.item (l_index)
					propagate_tuple_label_result_dynamic_types (l_label_type_set, l_result_type_set)
				end
			end
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
		end

	propagate_tuple_label_setter_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL; a_type: ET_DYNAMIC_TYPE)
			-- Propagate dynamic types of the source of tuple label setter `a_call'
			-- to the dynamic type set of the corresponding tuple label in `a_type'.
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_index: INTEGER
			l_label_type_set: ET_DYNAMIC_TYPE_SET
			l_assigner: ET_ASSIGNER_INSTRUCTION
			old_feature: ET_DYNAMIC_FEATURE
			old_type: ET_DYNAMIC_TYPE
		do
			old_feature := current_dynamic_feature
			current_dynamic_feature := a_call.current_feature
			old_type := current_dynamic_type
			current_dynamic_type := a_call.current_type
			l_tuple_type ?= a_type
			l_assigner ?= a_call.static_call
			if l_tuple_type = Void then
					-- Internal error: the target of a label expression
					-- should be a Tuple.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_assigner = Void then
					-- Internal error: the call should be a tuple label assigner.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_item_type_sets := l_tuple_type.item_type_sets
				l_index := a_call.static_call.name.seed
				if not l_item_type_sets.valid_index (l_index) then
						-- Internal error: invalid label index.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_label_type_set := l_item_type_sets.item (l_index)
					propagate_tuple_label_argument_dynamic_types (l_label_type_set, l_assigner)
				end
			end
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
		end

feature {ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION, ET_DYNAMIC_EQUALITY_EXPRESSION} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internally in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		local
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_formal_type_set := a_feature.argument_type_set (1)
			if l_formal_type_set /= Void and then a_type.conforms_to_type (l_formal_type_set.static_type) then
				propagate_builtin_actual_argument_dynamic_types (a_type, 1, a_feature)
			end
		end

feature {ET_DYNAMIC_SYSTEM} -- Generation

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature `a_feature' corresponding to "INTERNAL.type_of_type".
		do
			propagate_builtin_result_dynamic_types (a_type, a_feature)
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		do
			-- Do nothing.
		end

	build_tuple_put (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		do
			-- Do nothing.
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE)
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
			-- Have the dynamic type sets of `current_dynamic_system' all been built?

	build_feature_dynamic_type_sets (a_feature: ET_DYNAMIC_FEATURE; a_current_dynamic_type: ET_DYNAMIC_TYPE)
			-- Build dynamic type sets for `a_feature' in `a_current_dynamic_type'.
		require
			a_feature_not_void: a_feature /= Void
			a_current_dynamic_type_not_void: a_current_dynamic_type /= Void
		local
			old_feature: ET_DYNAMIC_FEATURE
			old_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type_set: ET_DYNAMIC_TYPE_SET
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
			if not a_feature.is_builtin then
					-- We consider that there is no guarantee that the 'Result' of
					-- a non-built-in feature can never be Void. To ensure that
					-- we would need to perform some code flow analysis.
				l_result_type_set := a_feature.result_type_set
				if l_result_type_set /= Void and then not l_result_type_set.is_expanded then
					l_result_type_set.propagate_can_be_void (current_dynamic_system.none_type)
				end
			end
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
			constant_indexes.wipe_out
			none_index.put (0)
			dynamic_type_sets.wipe_out
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
		end

feature {NONE} -- CAT-calls

	check_catcall_validity
			-- Check CAT-call validity.
		local
			i, nb: INTEGER
			l_call: ET_DYNAMIC_QUALIFIED_CALL
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
		do
			if catcall_error_mode or catcall_warning_mode then
				l_dynamic_types := current_dynamic_system.dynamic_types
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
		end

	check_catcall_call_validity (a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Check CAT-call validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			l_target_type_set := a_call.target_type_set
			nb := l_target_type_set.count
			from i := 1 until i > nb loop
				check_catcall_target_validity (l_target_type_set.dynamic_type (i), a_call)
				i := i + 1
			end
		end

	check_catcall_target_validity (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Check whether target type `a_type' introduces CAT-calls in `a_call'.
		require
			a_type_not_void: a_type /= Void
			a_call_not_void: a_call /= Void
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_actuals: ET_ARGUMENT_OPERANDS
			l_current_feature: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			j, nb2: INTEGER
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type: ET_DYNAMIC_TYPE
			l_tuple_dynamic_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_seed: INTEGER
		do
			if a_call.is_tuple_label then
					-- Check the case of Tuple label setter. For example:
					--   t1: TUPLE [l: ANY]
					--   t2: TUPLE [l: STRING]
					--   t1 := t2
					--   t1.l := 3
				l_actuals := a_call.static_call.arguments
				if l_actuals /= Void and then l_actuals.count = 1 then
					l_current_feature := a_call.current_feature
					l_tuple_dynamic_type ?= a_type
					if l_tuple_dynamic_type = Void then
							-- Internal error: the target of the call is a Tuple.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_item_type_sets := l_tuple_dynamic_type.item_type_sets
						l_seed := a_call.static_call.name.seed
						if not l_item_type_sets.valid_index (l_seed) then
								-- Internal error: invalid Tuple label.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_target_type_set := l_item_type_sets.item (l_seed)
							l_target_type := l_target_type_set.static_type
							l_current_feature := a_call.current_feature
							l_source_type_set := l_current_feature.dynamic_type_set (l_actuals.actual_argument (1))
							if l_source_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- argument should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								nb2 := l_source_type_set.count
								from j := 1 until j > nb2 loop
									l_source_type := l_source_type_set.dynamic_type (j)
									if not l_source_type.conforms_to_type (l_target_type) then
										report_catcall_error (a_type, Void, 1, l_target_type, l_target_type_set, l_source_type, l_source_type_set, a_call)
									end
									j := j + 1
								end
							end
						end
					end
				end
			else
				l_dynamic_feature := a_call.seeded_dynamic_feature (a_type, current_dynamic_system)
				if l_dynamic_feature = Void then
						-- Internal error: there should be a feature in all
						-- descendants of `a_call.target_type_set.static_type'.
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
											if not l_source_type.conforms_to_type (l_target_type) then
												report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_target_type_set, l_source_type, l_source_type_set, a_call)
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
		end

	report_catcall_error (a_target_type: ET_DYNAMIC_TYPE; a_dynamic_feature: ET_DYNAMIC_FEATURE;
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; a_formal_type_set: ET_DYNAMIC_TYPE_SET;
		an_actual_type: ET_DYNAMIC_TYPE; an_actual_type_set: ET_DYNAMIC_TYPE_SET; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Report a CAT-call error in `a_call'. When the target is of type `a_target_type', we
			-- try to pass to the corresponding feature `a_dynamic_feature' an actual argument of
			-- type `an_actual_type' (which is one of the types of `an_actual_type_set') which
			-- does not conform to the type of the `arg'-th corresponding formal argument
			-- `a_formal_type' (which is one of the types of `a_formal_type_set').
			-- When `a_dynamic_feature' is Void, then the call is assumed to be a Tuple label setter.
		require
			a_target_type_not_void: a_target_type /= Void
			a_call_not_void: a_call /= Void
			a_dynamic_feature_not_void_or_tuple_label_setter: a_call.is_tuple_label xor a_dynamic_feature /= Void
			a_formal_type_not_void: a_formal_type /= Void
			a_formal_type_set_not_void: a_formal_type_set /= Void
			an_actual_type_not_void: an_actual_type /= Void
			an_actual_type_set_not_void: an_actual_type_set /= Void
			valid_arg: a_call.static_call.arguments /= Void and then a_call.static_call.arguments.valid_index (arg)
		local
			l_message: STRING
		do
-- TODO: better error message reporting.
			l_message := shared_error_message
			STRING_.wipe_out (l_message)
			append_catcall_error_message (l_message, a_target_type, a_dynamic_feature, arg, a_formal_type, a_formal_type_set, an_actual_type, an_actual_type_set, a_call)
			if catcall_error_mode then
					-- CAT-calls are considered as fatal errors.
				set_fatal_error
			end
			error_handler.report_catcall_error (l_message)
			STRING_.wipe_out (l_message)
		end

	append_catcall_error_message (a_message: STRING; a_target_type: ET_DYNAMIC_TYPE; a_dynamic_feature: ET_DYNAMIC_FEATURE;
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; a_formal_type_set: ET_DYNAMIC_TYPE_SET;
		an_actual_type: ET_DYNAMIC_TYPE; an_actual_type_set: ET_DYNAMIC_TYPE_SET; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Append to `a_message' the error message of a CAT-call error in `a_call'.
			-- When the target is of type `a_target_type', we try to pass to the corresponding
			-- feature `a_dynamic_feature' an actual argument of type `an_actual_type' (which
			-- is one of the types of `an_actual_type_set') which does not conform to the type
			-- of the `arg'-th corresponding formal argument `a_formal_type' (which is one of
			-- the types of `a_formal_type_set').
			-- When `a_dynamic_feature' is Void, then the call is assumed to be a Tuple label setter.
		require
			a_message_not_void: a_message /= Void
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
			a_dynamic_feature_not_void_or_tuple_label_setter: a_call.is_tuple_label xor a_dynamic_feature /= Void
			a_formal_type_not_void: a_formal_type /= Void
			a_formal_type_set_not_void: a_formal_type_set /= Void
			an_actual_type_not_void: an_actual_type /= Void
			an_actual_type_set_not_void: an_actual_type_set /= Void
			valid_arg: a_call.static_call.arguments /= Void and then a_call.static_call.arguments.valid_index (arg)
		local
			l_class_impl: ET_CLASS
			l_position: ET_POSITION
		do
			a_message.append_string ("[CATCALL] class ")
			a_message.append_string (a_call.current_type.base_type.to_text)
			a_message.append_string (" (")
			l_class_impl := a_call.current_feature.static_feature.implementation_class
			if a_call.current_type.base_type.base_class /= l_class_impl then
				a_message.append_string (l_class_impl.upper_name)
				a_message.append_character (',')
			end
			l_position := a_call.position
			a_message.append_string (l_position.line.out)
			a_message.append_character (',')
			a_message.append_string (l_position.column.out)
			a_message.append_string ("): type '")
			a_message.append_string (an_actual_type.base_type.to_text)
			if a_dynamic_feature /= Void then
				a_message.append_string ("' of actual argument #")
				a_message.append_string (arg.out)
				a_message.append_string (" does not conform to type '")
				a_message.append_string (a_formal_type.base_type.to_text)
				a_message.append_string ("' of formal argument in feature `")
				a_message.append_string (a_dynamic_feature.static_feature.name.name)
				a_message.append_string ("' in class '")
			else
				a_message.append_string ("' of source of Tuple label assigner does not conform to type '")
				a_message.append_string (a_formal_type.base_type.to_text)
				a_message.append_string ("' of Tuple item #")
				a_message.append_string (a_call.static_call.name.seed.out)
				a_message.append_string (" in type '")
			end
			a_message.append_string (a_target_type.base_type.to_text)
			a_message.append_string ("%'")
		end

	shared_error_message: STRING
			-- Shared error message (used in `report_catcall_error')
		once
			create Result.make (200)
		ensure
			shared_error_message_not_void: Result /= Void
		end

feature {NONE} -- Feature validity

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			Precursor (a_feature)
			if not has_fatal_error then
				if a_feature.is_builtin and then not a_feature.is_builtin_unknown then
					check_external_builtin_function_validity (a_feature)
				elseif a_feature.type.same_base_type_with_type_marks (current_universe_impl.string_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_type) then
					if current_type = current_dynamic_type.base_type then
						l_dynamic_type := result_type_set.static_type
						mark_string_type_alive (l_dynamic_type)
						propagate_builtin_result_dynamic_types (l_dynamic_type, current_dynamic_feature)
					end
				elseif not a_feature.type.is_type_expanded (current_type) then
-- TODO: build full dynamic type sets, recursively.
					error_handler.report_warning_message ("Dynamic type set not built for external feature " + current_type.to_text + "." + a_feature.lower_name)
				end
			end
		end

	check_external_builtin_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in function.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			builtin_feature_known: not a_feature.is_builtin_unknown
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_any_twin then
					report_builtin_any_twin (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_function_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_function_item then
					report_builtin_function_item (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_identified_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_identified_eif_id_object then
					report_builtin_identified_eif_id_object (a_feature)
				when builtin_identified_eif_object_id then
					report_builtin_identified_eif_object_id (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_internal_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_internal_type_of_type then
					report_builtin_internal_type_of_type (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_special_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_special_item then
					report_builtin_special_item (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_tuple_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_tuple_reference_item then
					report_builtin_tuple_reference_item (a_feature)
				else
					report_builtin_function (a_feature)
				end
			when builtin_type_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_type_default then
					report_builtin_type_default (a_feature)
				when builtin_type_field then
					report_builtin_type_field (a_feature)
				when builtin_type_field_count then
					report_builtin_type_field_count (a_feature)
				when builtin_type_field_static_type then
					report_builtin_type_field_static_type (a_feature)
				when builtin_type_generic_parameter_type then
					report_builtin_type_generic_parameter_type (a_feature)
				when builtin_type_new_instance then
					report_builtin_type_new_instance (a_feature)
				when builtin_type_new_special_any_instance then
					report_builtin_type_new_special_any_instance (a_feature)
				else
					report_builtin_function (a_feature)
				end
			else
				report_builtin_function (a_feature)
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			Precursor (a_feature)
			if not has_fatal_error then
				if a_feature.is_builtin and then not a_feature.is_builtin_unknown then
					check_external_builtin_procedure_validity (a_feature)
				end
			end
		end

	check_external_builtin_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of `a_feature'.
			-- `a_feature' is a built-in procedure.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			builtin_feature_known: not a_feature.is_builtin_unknown
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_tuple_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_tuple_put_reference then
					report_builtin_tuple_put_reference (a_feature)
				else
					report_builtin_procedure (a_feature)
				end
			when builtin_type_class then
				inspect a_feature.builtin_code \\ builtin_capacity
				when builtin_type_set_reference_field then
					report_builtin_type_set_reference_field (a_feature)
				else
					report_builtin_procedure (a_feature)
				end
			else
				report_builtin_procedure (a_feature)
			end
		end

feature {NONE} -- Instruction validity

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_assertion or else an_instruction.then_compound /= Void then
				precursor (an_instruction)
			else
				has_fatal_error := False
			end
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_debug then
				precursor (an_instruction)
			else
				has_fatal_error := False
			end
		end

	check_loop_invariant_validity (an_invariant: ET_LOOP_INVARIANTS)
			-- Check validity of `an_invariant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			if not no_assertion then
				precursor (an_invariant)
			else
				has_fatal_error := False
			end
		end

	check_loop_variant_validity (a_variant: ET_VARIANT)
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

	report_across_cursor (a_name: ET_IDENTIFIER; a_across_component: ET_ACROSS_COMPONENT)
			-- Report that a call to across cursor `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_across_component.cursor_name.index)
			end
		end

	report_across_cursor_declaration (a_name: ET_IDENTIFIER; a_across_component: ET_ACROSS_COMPONENT)
			-- Report that the declaration of the across cursor `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
					-- Take care of the type of the across cursor.
				a_name.set_index (a_across_component.new_cursor_expression.index)
			end
		end

	report_across_expression (a_across_expression: ET_ACROSS_EXPRESSION)
			-- Report that the across expression `a_across_expression' has been processed.
		do
			report_constant_expression (a_across_expression, current_universe_impl.boolean_type)
		end

	report_assignment (an_instruction: ET_ASSIGNMENT)
			-- Report that an assignment instruction has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				propagate_assignment_dynamic_types (an_instruction)
			end
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Report that an assignment attempt instruction has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				propagate_assignment_attempt_dynamic_types (an_instruction)
			end
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY)
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_attribute: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_attribute := current_dynamic_type.dynamic_query (an_attribute, current_dynamic_system)
-- TODO: the dynamic type set of `l_dynamic_attribute' may be altered when
-- its address is passed to an external routine.
			end
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY)
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_type.dynamic_query (an_attribute, current_dynamic_system).result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of an attribute cannot be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					set_dynamic_type_set (l_dynamic_type_set, a_writable)
				end
			end
		end

	report_bit_constant (a_constant: ET_BIT_CONSTANT)
			-- Report that a bit constant has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
-- TODO: not supported.
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.none_type
				set_dynamic_type_set (l_type, a_constant)
			end
		end

	report_boolean_constant (a_constant: ET_BOOLEAN_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a boolean of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_character_8_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a character_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_character_32_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a character_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_builtin_conversion (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_target_type: ET_TYPE)
			-- Report that a built-in convert expression has been processed,
			-- where `a_target_type' in  the context of `current_type' is
			-- the type of the expression after the conversion occurred.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type: ET_DYNAMIC_TYPE
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
					if l_source_type.base_type.conforms_to_type (a_target_type, current_type, current_type) then
-- TODO: built-in feature with formal generic parameter? Should not be needed with ECMA Eiffel.
						set_dynamic_type_set (l_source_type_set, an_expression)
					else
-- TODO: built-in feature between basic types? Should not be needed with ECMA Eiffel.
						l_target_type := current_dynamic_system.dynamic_type (a_target_type, current_type)
						set_dynamic_type_set (l_target_type, an_expression)
					end
				end
			end
		end

	report_constant_expression (a_expression: ET_EXPRESSION; a_type: ET_CLASS_TYPE)
			-- Report that `a_expression', whose type is always `a_type'
			-- in the context of `current_type', has been processed.
		require
			no_error: not has_fatal_error
			a_expression_not_void: a_expression /= Void
			a_type_not_void: a_type /= Void
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_dynamic_system.dynamic_type (a_type, current_type)
				mark_type_alive (l_dynamic_type)
				constant_indexes.search (l_dynamic_type)
				if constant_indexes.found and a_expression.index = 0 then
					a_expression.set_index (constant_indexes.found_item)
				end
				set_dynamic_type_set (l_dynamic_type, a_expression)
				if not constant_indexes.found then
					constant_indexes.force_last (a_expression.index, l_dynamic_type)
				end
			end
		end

	report_creation_expression (an_expression: ET_CREATION_EXPRESSION; a_creation_type: ET_TYPE; a_procedure: ET_PROCEDURE)
			-- Report that a creation expression, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		local
			i, nb: INTEGER
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_dynamic_system.dynamic_type (a_creation_type, current_type)
				l_dynamic_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_dynamic_system)
				l_dynamic_procedure.set_creation (True)
				mark_type_alive (l_dynamic_creation_type)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						l_actual := l_actuals.actual_argument (i)
						propagate_argument_operand_dynamic_types (l_actual, i, l_dynamic_procedure)
						i := i + 1
					end
				end
				set_dynamic_type_set (l_dynamic_creation_type, an_expression)
			end
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE; a_procedure: ET_PROCEDURE)
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
				l_dynamic_creation_type := current_dynamic_system.dynamic_type (a_creation_type, current_type)
				l_dynamic_procedure := l_dynamic_creation_type.dynamic_procedure (a_procedure, current_dynamic_system)
				l_dynamic_procedure.set_creation (True)
				mark_type_alive (l_dynamic_creation_type)
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

	report_current (an_expression: ET_CURRENT)
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

	report_current_type_needed
			-- Report that the current type is needed to execute the feature being analyzed.
			-- This might be needed for optimization purposes.
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_current_type_needed (True)
			end
		end

	report_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Report that an equality expression has been processed.
		local
			l_equality: ET_DYNAMIC_EQUALITY_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				report_constant_expression (an_expression, current_universe_impl.boolean_type)
				l_target_type_set := dynamic_type_set (an_expression.left)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- left operand should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					create l_equality.make (an_expression, l_target_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_equality_expression (l_equality)
					propagate_equality_expression_target_dynamic_types (l_equality)
				end
			end
		end

	report_formal_argument (a_name: ET_IDENTIFIER; a_formal: ET_FORMAL_ARGUMENT)
			-- Report that a call to formal argument `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_formal.name.index)
			end
		end

	report_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT)
			-- Report that the declaration of the formal
			-- argument `a_formal' of a feature has been processed.
		do
			-- The dynamic type sets of formal arguments of features have
			-- already been set when creating the corresponding dynamic
			-- feature (see ET_DYNAMIC_FEATURE.make).
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY)
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_query: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_query := current_dynamic_type.dynamic_query (a_query, current_dynamic_system)
				l_dynamic_query.set_regular (True)
-- TODO: the dynamic type set of the formal arguments of `l_dynamic_query'
-- may be altered when its address is passed to an external routine.
			end
		end

	report_inline_agent (an_expression: ET_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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
			l_dynamic_type := current_dynamic_system.dynamic_type (a_type, a_context)
			mark_type_alive (l_dynamic_type)
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
				propagate_agent_closed_operands_dynamic_types (an_expression, l_agent_type)
			end
		end

	report_inline_agent_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT)
			-- Report that the declaration of the formal argument `a_formal'
			-- of an inline agent has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_dynamic_system.dynamic_type (a_formal.type, current_type)
				l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					-- Unless proven otherwise after possible attachments,
					-- a formal actual argument is assumed to be never Void.
				l_dynamic_type_set.set_never_void
				set_dynamic_type_set (l_dynamic_type_set, a_formal.name)
			end
		end

	report_inline_agent_local_variable_declaration (a_local: ET_LOCAL_VARIABLE)
			-- Report that the declaration of the local variable `a_local'
			-- of an inline agent has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_dynamic_system.dynamic_type (a_local.type, current_type)
				l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
				set_dynamic_type_set (l_dynamic_type_set, a_local.name)
			end
		end

	report_inline_agent_result_declaration (a_type: ET_TYPE)
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of an inline agent has been processed.
		local
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
					l_dynamic_type := current_dynamic_system.dynamic_type (a_type, current_type)
					l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					set_dynamic_type_set (l_dynamic_type_set, current_inline_agent.implicit_result)
				end
			end
		end

	report_integer_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that an integer_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_integer_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			--- Report that an integer_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_integer_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that an integer_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_integer_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that an integer_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_local_assignment_target (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE)
			-- Report that the local variable `a_name' has been
			-- processed as target of an assignment (attempt).
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_local.name.index)
			end
		end

	report_local_variable (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE)
			-- Report that a call to local variable `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_local.name.index)
			end
		end

	report_local_variable_declaration (a_local: ET_LOCAL_VARIABLE)
			-- Report that the declaration of the local variable `a_local'
			-- of a feature has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_dynamic_system.dynamic_type (a_local.type, current_type)
				l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
				set_dynamic_type_set (l_dynamic_type_set, a_local.name)
			end
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE)
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, current_type)
				mark_type_alive (l_type)
				set_dynamic_type_set (l_type, an_expression)
					-- Make sure that types "SPECIAL [XXX]" (used in feature 'area'), and
					-- "INTEGER" (used in feature 'lower' and 'upper') are marked as alive.
				l_queries := l_type.queries
				if l_queries.count < 3 then
						-- Error already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
-- TODO: internal error
				else
						-- Feature 'area' should be the first in the list of features.
					l_dynamic_type_set := l_queries.item (1).result_type_set
					if l_dynamic_type_set = Void then
							-- Error in feature 'area', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
-- TODO: internal error
					else
						mark_type_alive (l_dynamic_type_set.static_type)
					end
						-- Feature 'lower' should be the second in the list of features.
					l_dynamic_type_set := l_queries.item (2).result_type_set
					if l_dynamic_type_set = Void then
							-- Error in feature 'lower', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
-- TODO: internal error
					else
						mark_type_alive (l_dynamic_type_set.static_type)
					end
						-- Feature 'upper' should be the third in the list of features.
					l_dynamic_type_set := l_queries.item (3).result_type_set
					if l_dynamic_type_set = Void then
							-- Error in feature 'upper', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
-- TODO: internal error
					else
						mark_type_alive (l_dynamic_type_set.static_type)
					end
				end
			end
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE)
			-- Report that a manifest tuple of type `a_type' in context of
			-- `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, current_type)
				mark_type_alive (l_type)
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_manifest_type (an_expression: ET_MANIFEST_TYPE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a manifest type of type `a_type' in context of
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				mark_type_alive (l_type)
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_named_object_test (a_object_test: ET_NAMED_OBJECT_TEST; a_local_type: ET_TYPE_CONTEXT)
			-- Report that the object-test `a_object_test' with local
			-- of type `a_local_type' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
					-- Object-tests are of type "BOOLEAN".
				report_constant_expression (a_object_test, current_universe_impl.boolean_type)
					-- Take care of the type of the object-test local.
				l_dynamic_type := current_dynamic_system.dynamic_type (tokens.identity_type, a_local_type)
				l_dynamic_type_set := new_dynamic_type_set (l_dynamic_type)
					-- An object-test local is assumed to be never Void.
				l_dynamic_type_set.set_never_void
				set_dynamic_type_set (l_dynamic_type_set, a_object_test.name)
				propagate_named_object_test_dynamic_types (a_object_test)
			end
		end

	report_natural_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_natural_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_natural_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_natural_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_target_type: ET_TYPE_CONTEXT)
			-- Report that an object equality expression has been processed.
			-- `a_target_type' is the type of the target of the call to 'is_equal'
			-- internally invoked by the object equality expression.
		local
			l_object_equality: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				report_constant_expression (an_expression, current_universe_impl.boolean_type)
				l_target_type_set := dynamic_type_set (an_expression.left)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- left operand should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					create l_object_equality.make (an_expression, l_target_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_object_equality_expression (l_object_equality)
					propagate_object_equality_expression_target_dynamic_types (l_object_equality)
				end
			end
		end

	report_object_test (a_object_test: ET_OBJECT_TEST)
			-- Report that the object-test `a_object_test' has been processed.
		do
			report_constant_expression (a_object_test, current_universe_impl.boolean_type)
		end

	report_object_test_local (a_name: ET_IDENTIFIER; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report that a call to object-test local `a_name' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				a_name.set_index (a_object_test.name.index)
			end
		end

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_CLASS_TYPE)
			-- Report that a pointer expression of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (an_expression, a_type)
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY)
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
				l_parent_type := current_dynamic_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_query, l_parent_type, current_dynamic_system)
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

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE)
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
				l_parent_type := current_dynamic_system.dynamic_type (a_parent_type, current_type)
				l_precursor := current_dynamic_feature.dynamic_precursor (a_procedure, l_parent_type, current_dynamic_system)
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

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE)
			-- Report that function `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		local
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_procedure := current_dynamic_type.dynamic_procedure (a_procedure, current_dynamic_system)
				l_dynamic_procedure.set_regular (True)
-- TODO: the dynamic type set of the formal arguments of `l_dynamic_procedure'
-- may be altered when its address is passed to an external routine.
			end
		end

	report_procedure_inline_agent (an_expression: ET_PROCEDURE_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that procedure inline agent of type `a_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_inline_agent (an_expression, a_type, a_context)
			end
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY)
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
						l_dynamic_type := current_dynamic_system.dynamic_type (l_type, l_target_type_set.static_type.base_type)
					end
					l_result_type_set := new_dynamic_type_set (l_dynamic_type)
						-- Unless proven otherwise after possible attachments,
						-- the result is assumed to be never Void.
					l_result_type_set.set_never_void
					set_dynamic_type_set (l_result_type_set, an_expression)
					create l_dynamic_call.make (an_expression, l_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_query_call (l_dynamic_call)
					propagate_qualified_call_target_dynamic_types (l_dynamic_call)
				end
			end
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE)
			-- Report that a qualified call instruction has been processed.
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_target: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_target := an_instruction.target
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					create l_dynamic_call.make (an_instruction, l_target_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_procedure_call (l_dynamic_call)
					propagate_qualified_call_target_dynamic_types (l_dynamic_call)
				end
			end
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a qualified procedure call (to `a_procedure') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_qualified_call_agent (an_expression, a_procedure, an_agent_type, a_context)
			end
		end

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a qualified query call (to `a_query') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_qualified_call_agent (an_expression, a_query, an_agent_type, a_context)
			end
		end

	report_qualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a qualified  call (to `a_feature') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_agent_type: ET_DYNAMIC_ROUTINE_TYPE
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
			l_dynamic_procedure_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
		do
			l_dynamic_type := current_dynamic_system.dynamic_type (an_agent_type, a_context)
			mark_type_alive (l_dynamic_type)
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
					l_result_type_set := l_dynamic_agent_type.result_type_set
					if l_result_type_set /= Void then
						set_dynamic_type_set (l_result_type_set, an_expression.implicit_result)
						report_agent_qualified_query_call (an_expression, l_target_type_set, l_result_type_set)
					else
						create l_dynamic_procedure_call.make (an_expression, l_target_type_set, current_dynamic_feature, current_dynamic_type)
						l_target_type_set.static_type.put_procedure_call (l_dynamic_procedure_call)
						propagate_qualified_call_target_dynamic_types (l_dynamic_procedure_call)
					end
				end
				propagate_agent_closed_operands_dynamic_types (an_expression, l_dynamic_agent_type)
			end
		end

	report_agent_qualified_query_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET; a_result_type_set: ET_DYNAMIC_TYPE_SET)
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
			propagate_qualified_call_target_dynamic_types (l_dynamic_query_call)
		end

	report_query_inline_agent (an_expression: ET_QUERY_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a query inline agent of type `a_type' in `a_context' has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				report_inline_agent (an_expression, a_type, a_context)
			end
		end

	report_real_32_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a real_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_real_64_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a real_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_constant_expression (a_constant, a_type)
		end

	report_result (an_expression: ET_RESULT)
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

	report_result_assignment_target (a_result: ET_RESULT)
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

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY)
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
				l_dynamic_type := current_dynamic_system.dynamic_type (a_type, current_type)
				l_dynamic_query := l_dynamic_type.dynamic_query (a_query, current_dynamic_system)
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

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE)
			-- Report that a static call instruction has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_dynamic_system.dynamic_type (a_type, current_type)
				l_dynamic_procedure := l_dynamic_type.dynamic_procedure (a_procedure, current_dynamic_system)
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

	report_string_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that `a_string', whose type is always `a_type'
			-- in the context of `current_type', has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		local
			l_string_type: ET_DYNAMIC_TYPE
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_area_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_string_type := current_dynamic_system.dynamic_type (a_type, current_type)
				mark_type_alive (l_string_type)
				if l_string_type.attribute_count < 2 then
						-- Internal error: class "STRING" should have at least the
						-- features 'area' and 'count' as first features.
						-- Already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_giaaa_error
				else
						-- Attribute 'area'.
					l_area_type_set := l_string_type.queries.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_area_type := l_area_type_set.static_type
						mark_type_alive (l_area_type)
						propagate_manifest_string_area_dynamic_type (l_area_type, l_area_type_set, a_string)
					end
				end
				constant_indexes.search (l_string_type)
				if constant_indexes.found and a_string.index = 0 then
					a_string.set_index (constant_indexes.found_item)
				end
				set_dynamic_type_set (l_string_type, a_string)
				if not constant_indexes.found then
					constant_indexes.force_last (a_string.index, l_string_type)
				end
			end
		end

	report_string_8_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that a string_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_string_constant (a_string, a_type)
		end

	report_string_32_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that a string_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		do
			report_string_constant (a_string, a_type)
		end

	report_strip_expression (an_expression: ET_STRIP_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a strip expression of type `a_type'
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				mark_type_alive (l_type)
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_tuple_label_call_agent (an_expression: ET_CALL_AGENT; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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
				l_dynamic_type := current_dynamic_system.dynamic_type (an_agent_type, a_context)
				mark_type_alive (l_dynamic_type)
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
						report_agent_qualified_query_call (an_expression, l_target_type_set, l_result_type_set)
					end
				end
			end
		end

	report_tuple_label_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT)
			-- Report that a call to a tuple label has been processed.
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_index: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
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
							l_dynamic_type := l_item_type_sets.item (l_index).static_type
							l_result_type_set := new_dynamic_type_set (l_dynamic_type)
								-- Unless proven otherwise after possible attachments,
								-- the result is assumed to be never Void.
							l_result_type_set.set_never_void
							set_dynamic_type_set (l_result_type_set, an_expression)
							create l_dynamic_call.make (an_expression, l_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
							l_target_type_set.static_type.put_query_call (l_dynamic_call)
							propagate_qualified_call_target_dynamic_types (l_dynamic_call)
						end
					end
				end
			end
		end

	report_tuple_label_setter (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT)
			-- Report that a call to the setter of a tuple label has been processed.
		local
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_call: ET_FEATURE_CALL_EXPRESSION
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
					create l_dynamic_call.make (an_assigner, l_target_type_set, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.static_type.put_procedure_call (l_dynamic_call)
					propagate_qualified_call_target_dynamic_types (l_dynamic_call)
				end
			end
		end

	report_typed_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a typed pointer expression of type `a_type'
			-- in `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				mark_type_alive (l_type)
				set_dynamic_type_set (l_type, an_expression)
			end
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY)
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
				l_dynamic_query := current_dynamic_type.dynamic_query (a_query, current_dynamic_system)
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

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE)
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
				l_dynamic_procedure := current_dynamic_type.dynamic_procedure (a_procedure, current_dynamic_system)
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

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that an unqualified procedure call (to `a_procedure') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_procedure (a_procedure, current_dynamic_system)
				report_unqualified_call_agent (an_expression, l_dynamic_feature, a_type, a_context)
			end
		end

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that an unqualified query call (to `a_query') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_query (a_query, current_dynamic_system)
				set_dynamic_type_set (l_dynamic_feature.result_type_set, an_expression.implicit_result)
				report_unqualified_call_agent (an_expression, l_dynamic_feature, a_type, a_context)
			end
		end

	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_DYNAMIC_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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
			l_dynamic_type := current_dynamic_system.dynamic_type (a_type, a_context)
			mark_type_alive (l_dynamic_type)
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
				propagate_agent_closed_operands_dynamic_types (an_expression, l_agent_type)
			end
		end

	report_void_constant (an_expression: ET_VOID)
			-- Report that a Void has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.none_type
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

	report_builtin_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that a built-in function that returns an object of the same
			-- type as its declared type is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_base_type: ET_BASE_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := result_type_set.static_type
				l_base_type := l_result_type.base_type
				if current_universe_impl.string_8_type.same_named_type_with_type_marks (l_base_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_type) then
					mark_string_type_alive (l_result_type)
				elseif current_universe_impl.string_32_type.same_named_type_with_type_marks (l_base_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_type) then
					mark_string_type_alive (l_result_type)
				else
					mark_type_alive (l_result_type)
				end
				propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
			end
		end

	report_builtin_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Report that a built-in procedure is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_any_twin (a_feature: ET_EXTERNAL_FUNCTION)
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
				l_copy_feature := current_dynamic_type.seeded_dynamic_procedure (current_system.copy_seed, current_dynamic_system)
				if l_copy_feature = Void then
						-- Internal error: all classes should have a feature
						-- 'copy'. Otherwise we get an error when parsing
						-- class ANY if there is no such feature.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_copy_feature.set_regular (True)
					propagate_builtin_actual_argument_dynamic_types (current_dynamic_type, 1, l_copy_feature)
				end
			end
		end

	report_builtin_function_item (a_feature: ET_EXTERNAL_FUNCTION)
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
					mark_type_alive (l_result_type)
				end
			end
		end

	report_builtin_identified_eif_id_object (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'IDENTIFIED.eif_id_object' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_identified_eif_object_id (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'IDENTIFIED.eif_object_id' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_internal_type_of_type (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'INTERNAL.type_of_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	report_builtin_special_item (a_feature: ET_EXTERNAL_FUNCTION)
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
					mark_type_alive (l_result_type_set.static_type)
				end
			end
		end

	report_builtin_tuple_put_reference (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Report that built-in feature 'TUPLE.put_reference' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_tuple_type ?= current_dynamic_type
				if l_tuple_type = Void then
						-- Internal error: this was already reported during parsing.
						-- This built-in feature can only be in class TUPLE (and
						-- its descendants).
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_item_type_sets := l_tuple_type.item_type_sets
					nb := l_item_type_sets.count
					from i := 1 until i > nb loop
						l_item_type_set := l_item_type_sets.item (i)
						if not l_item_type_set.is_expanded or else not l_item_type_set.static_type.is_basic then
							propagate_builtin_formal_argument_dynamic_types (1, l_item_type_set)
						end
						i := i + 1
					end
				end
			end
		end

	report_builtin_tuple_reference_item (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TUPLE.reference_item' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_tuple_type ?= current_dynamic_type
				if l_tuple_type = Void then
						-- Internal error: this was already reported during parsing.
						-- This built-in feature can only be in class TUPLE (and
						-- its descendants).
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_item_type_sets := l_tuple_type.item_type_sets
					nb := l_item_type_sets.count
					from i := 1 until i > nb loop
						l_item_type_set := l_item_type_sets.item (i)
						if not l_item_type_set.is_expanded or else not l_item_type_set.static_type.is_basic then
							propagate_builtin_result_dynamic_types (l_item_type_set, current_dynamic_feature)
						end
						i := i + 1
					end
				end
			end
		end

	report_builtin_type_default (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.default' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := result_type_set.static_type
					-- The Result is either expanded or Void.
					-- Nothing to propagate when it is Void.
				if l_result_type.is_expanded then
					mark_type_alive (l_result_type)
					propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
				end
			end
		end

	report_builtin_type_field_count (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.field_count' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type := current_dynamic_system.dynamic_type (l_parameters.type (1), current_type)
					l_dynamic_type.use_all_attributes (current_dynamic_system)
					l_result_type := result_type_set.static_type
					mark_type_alive (l_result_type)
					propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
				end
			end
		end

	report_builtin_type_field (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.field' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type := current_dynamic_system.dynamic_type (l_parameters.type (1), current_type)
					l_dynamic_type.use_all_attributes (current_dynamic_system)
					l_queries := l_dynamic_type.queries
					nb := l_dynamic_type.attribute_count
					from i := 1 until i > nb loop
						l_result_type_set := l_queries.item (i).result_type_set
						if l_result_type_set = Void then
								-- Internal error: attributes have a result type.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							propagate_builtin_result_dynamic_types (l_result_type_set, current_dynamic_feature)
						end
						i := i + 1
					end
				end
			end
		end

	report_builtin_type_field_static_type (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.field_static_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_meta_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type := current_dynamic_system.dynamic_type (l_parameters.type (1), current_type)
					l_dynamic_type.use_all_attributes (current_dynamic_system)
					l_queries := l_dynamic_type.queries
					nb := l_dynamic_type.attribute_count
					from i := 1 until i > nb loop
						l_result_type_set := l_queries.item (i).result_type_set
						if l_result_type_set = Void then
								-- Internal error: attributes have a result type.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_result_type := l_result_type_set.static_type
							l_meta_type := current_dynamic_system.meta_type (l_result_type)
							mark_type_alive (l_meta_type)
							propagate_builtin_result_dynamic_types (l_meta_type, current_dynamic_feature)
						end
						i := i + 1
					end
				end
			end
		end

	report_builtin_type_generic_parameter_type (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.generic_parameter_type' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_base_type: ET_BASE_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_base_type := l_parameters.type (1).shallow_base_type (current_type)
					l_parameters := l_base_type.actual_parameters
					if l_parameters /= Void then
							-- We should have already checked by now that the result
							-- type of the built-in feature TYPE.generic_parameter
							-- is "TYPE [ANY]".
						nb := l_parameters.count
						from i := 1 until i > nb loop
							l_type := l_parameters.type (i)
							l_dynamic_type := current_dynamic_system.dynamic_type (l_type, current_type)
							l_result_type := current_dynamic_system.meta_type (l_dynamic_type)
							mark_type_alive (l_result_type)
							propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
							i := i + 1
						end
					end
				end
			end
		end

	report_builtin_type_new_instance (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.new_instance' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_result_type := result_type_set.static_type
				if not l_result_type.base_class.is_deferred and not l_result_type.base_class.is_none then
						-- Return Void when the base class is deferred,
						-- or when the result type is not alive (i.e. no object of that
						-- type has been otherwise created in the system).
					propagate_builtin_result_dynamic_types (l_result_type, current_dynamic_feature)
				end
			end
		end

	report_builtin_type_new_special_any_instance (a_feature: ET_EXTERNAL_FUNCTION)
			-- Report that built-in feature 'TYPE.new_special_any_instance' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_result_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_result_type := current_dynamic_system.dynamic_type (l_parameters.type (1), current_type)
					if attached {ET_DYNAMIC_SPECIAL_TYPE} l_result_type as l_special_type and then not l_special_type.item_type_set.static_type.is_expanded then
						-- Return Void when the result type is not alive (i.e. no object
						-- of that type has been otherwise created in the system).
						propagate_builtin_result_dynamic_types (l_special_type, current_dynamic_feature)
					end
				end
			end
		end

	report_builtin_type_set_reference_field (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Report that built-in feature 'TYPE.set_reference_field' is being analyzed.
		require
			no_error: not has_fatal_error
			a_feature_not_void: a_feature /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			i, nb: INTEGER
		do
			if current_type = current_dynamic_type.base_type then
				l_parameters := current_type.actual_parameters
				if l_parameters = Void or else l_parameters.count < 1 then
						-- Internal error: we should have already checked by now
						-- that class "TYPE" has a generic parameter.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type := current_dynamic_system.dynamic_type (l_parameters.type (1), current_type)
					l_dynamic_type.use_all_attributes (current_dynamic_system)
					l_queries := l_dynamic_type.queries
					nb := l_dynamic_type.attribute_count
					from i := 1 until i > nb loop
						l_result_type_set := l_queries.item (i).result_type_set
						if l_result_type_set = Void then
								-- Internal error: attributes have a result type.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif not l_result_type_set.is_expanded then
							propagate_builtin_formal_argument_dynamic_types (3, l_result_type_set)
						end
						i := i + 1
					end
				end
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

	constant_indexes: DS_HASH_TABLE [INTEGER, ET_DYNAMIC_TYPE]
			-- Indexes of dynamic type set of constant expressions in `dynamic_type_sets'

	none_index: DS_CELL [INTEGER]
			-- Index of dynamic type set of none expressions in `dynamic_type_sets'

feature {NONE} -- Feature checker

	feature_checker: ET_FEATURE_CHECKER
			-- Feature checker to be used when processing preconditions
			-- to get the attachment scope

feature {NONE} -- Implementation

	propagate_agent_closed_operands_dynamic_types (an_agent: ET_AGENT; an_agent_type: ET_DYNAMIC_ROUTINE_TYPE)
			-- Propagate dynamic types of closed operands of `an_agent' to the
			-- dynamic type set of the attribute 'closed_operands' of `an_agent_type'.
		require
			an_agent_not_void: an_agent /= Void
			an_agent_type_not_void: an_agent_type /= Void
		do
			-- Do nothing.
		end

	propagate_argument_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set `a_formal_type_set' of the
			-- corresponding formal argument.
		require
			an_actual_not_void: an_actual /= Void
			a_formal_type_set_not_void: a_formal_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_argument_operand_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set of the corresponding formal
			-- argument at index `a_formal' in `a_callee'.
		require
			an_actual_not_void: an_actual /= Void
			a_callee_not_void: a_callee /= Void
		do
			-- Do nothing.
		end

	propagate_assignment_dynamic_types (an_assignment: ET_ASSIGNMENT)
			-- Propagate dynamic types of the source of `an_assignment'
			-- to the dynamic type set of the target of `an_assignment'.
		require
			an_assignment_not_void: an_assignment /= Void
		do
			-- Do nothing.
		end

	propagate_assignment_attempt_dynamic_types (an_assignment_attempt: ET_ASSIGNMENT_ATTEMPT)
			-- Propagate dynamic types of the source of `an_assignment_attempt'
			-- to the dynamic type set of the target of `an_assignment_attempt'.
		require
			an_assignment_attempt_not_void: an_assignment_attempt /= Void
		do
			-- Do nothing.
		end

	propagate_builtin_actual_argument_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE)
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the formal argument at index `a_formal' in `a_callee' when involved
			-- in built-in feature `current_dynamic_feature'.
		require
			a_source_type_set_not_void: a_source_type_set /= Void
			a_callee_not_void: a_callee /= Void
		do
			-- Do nothing.
		end

	propagate_builtin_formal_argument_dynamic_types (a_formal: INTEGER; a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the dynamic type set of the formal argument
			-- at index `a_formal' in built-in feature `current_dynamic_feature'
			-- to `a_target_type_set'.
		require
			a_target_type_set_not_void: a_target_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_builtin_result_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_query: ET_DYNAMIC_FEATURE)
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the result of the built-in feature `a_query'.
		require
			a_source_type_set_not_void: a_source_type_set /= Void
			a_query_not_void: a_query /= Void
		do
			-- Do nothing.
		end

	propagate_call_agent_result_dynamic_types (an_agent: ET_CALL_AGENT; a_query: ET_DYNAMIC_FEATURE; a_result_type_set: ET_DYNAMIC_TYPE_SET)
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

	propagate_creation_dynamic_type (a_creation_type: ET_DYNAMIC_TYPE; a_creation: ET_CREATION_INSTRUCTION)
			-- Propagate the creation type `a_creation_type' of `a_creation'
			-- to the dynamic type set of the target of `a_creation'.
		require
			a_creation_type_not_void: a_creation_type /= Void
			a_creation_not_void: a_creation /= Void
		do
			-- Do nothing.
		end

	propagate_inline_agent_result_dynamic_types (an_agent: ET_INLINE_AGENT; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the result of the associated feature of `an_agent'
			-- to the dynamic type set `a_result_type_set' of the result of type of `an_agent'
			-- (probably a FUNCTION or a PREDICATE).
		require
			an_agent_not_void: an_agent /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			-- Do nothing.
		end

	propagate_like_argument_dynamic_types (a_call: ET_FEATURE_CALL_EXPRESSION; a_formal_type_set, an_actual_type_set: ET_DYNAMIC_TYPE_SET)
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

	propagate_manifest_string_area_dynamic_type (a_area_type: ET_DYNAMIC_TYPE; a_area_type_set: ET_DYNAMIC_TYPE_SET; a_string: ET_MANIFEST_STRING)
			-- Propagate the dynamic type of the 'area' of manifest string `a_string'
			-- to its dynamic type set `a_area_type_set'.
		require
			a_area_type_not_void: a_area_type /= Void
			a_area_type_set_not_void: a_area_type_set /= Void
			a_string_not_void: a_string /= Void
		do
			-- Do nothing.
		end

	propagate_named_object_test_dynamic_types (a_object_test: ET_NAMED_OBJECT_TEST)
			-- Propagate dynamic types of the expression of `a_object_test'
			-- to the dynamic type set of the local of `a_object_test'.
		require
			a_object_test_not_void: a_object_test /= Void
		do
			-- Do nothing.
		end

	propagate_qualified_call_target_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate the dynamic types of the target of `a_call' to the call itself.
		require
			a_call_not_void: a_call /= Void
		do
			-- Do nothing.
		end

	propagate_equality_expression_target_dynamic_types (a_equality: ET_DYNAMIC_EQUALITY_EXPRESSION)
			-- Propagate the dynamic types of the target of `a_equality' to the equality itself.
		require
			a_equality_not_void: a_equality /= Void
		do
			-- Do nothing.
		end

	propagate_object_equality_expression_target_dynamic_types (a_equality: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION)
			-- Propagate the dynamic types of the target of `a_equality' to the object-equality itself.
		require
			a_equality_not_void: a_equality /= Void
		do
			-- Do nothing.
		end

	propagate_tuple_label_argument_dynamic_types (a_label_type_set: ET_DYNAMIC_TYPE_SET; a_assigner: ET_ASSIGNER_INSTRUCTION)
			-- Propagate dynamic types of the source of tuple label setter `a_assigner'
			-- to the dynamic type set `a_label_type_set' of the corresponding tuple label.
		require
			a_label_type_set_not_void: a_label_type_set /= Void
			a_assigner_not_void: a_assigner /= Void
		do
			-- Do nothing.
		end

	propagate_tuple_label_result_dynamic_types (a_label_type_set, a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types `a_label_type_set' of a tuple label
			-- to the dynamic type set `a_result_type_set' of the result type
			-- of the associated qualified call.
		require
			a_label_type_set_not_void: a_label_type_set /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			-- Do nothing.
		end

	dynamic_type_set (an_operand: ET_OPERAND): ET_DYNAMIC_TYPE_SET
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

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set associated with result of feature being processed;
			-- Report a fatal error if not known
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_result_type_set := current_dynamic_feature.result_type_set
			if l_result_type_set /= Void then
				Result := l_result_type_set
			else
					-- Internal error: dynamic type set not known.
				set_fatal_error
				error_handler.report_giaaa_error
				Result := current_dynamic_system.unknown_type
			end
		ensure
			result_type_set_not_void: Result /= Void
		end

	set_dynamic_type_set (a_dynamic_type_set: ET_DYNAMIC_TYPE_SET; an_operand: ET_OPERAND)
			-- Set dynamic type set associated with `an_operand' to `a_dynamic_type_set'.
		require
			a_dynamic_type_set_not_void: a_dynamic_type_set /= Void
			an_operand_not_void: an_operand /= Void
		local
			i, nb: INTEGER
			l_unknown: ET_DYNAMIC_TYPE
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
					l_unknown := current_dynamic_system.unknown_type
					i := i - 1
					from until nb >= i loop
						dynamic_type_sets.force_last (l_unknown)
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

	dummy_dynamic_type: ET_DYNAMIC_TYPE
			-- Dummy dynamic type
		once
			create Result.make (current_type, current_class)
		ensure
			dummy_dynamic_type_not_void: Result /= Void
		end

	dummy_dynamic_feature: ET_DYNAMIC_FEATURE
			-- Dummy dynamic feature
		once
			create Result.make (dummy_feature, dummy_dynamic_type, current_dynamic_system)
		ensure
			dummy_dynamic_feature_not_void: Result /= Void
		end

invariant

	dynamic_type_sets_not_void: dynamic_type_sets /= Void
	current_dynamic_type_not_void: current_dynamic_type /= Void
	current_dynamic_feature_not_void: current_dynamic_feature /= Void
	current_index_not_void: current_index /= Void
	result_index_not_void: result_index /= Void
	constant_indexes_not_void: constant_indexes /= Void
	none_index_not_void: none_index /= Void

end
