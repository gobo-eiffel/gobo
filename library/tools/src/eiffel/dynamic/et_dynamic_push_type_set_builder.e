note

	description:

		"Eiffel dynamic type set builders where types are pushed to supersets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PUSH_TYPE_SET_BUILDER

inherit

	ET_DYNAMIC_TYPE_BUILDER
		redefine
			new_dynamic_type_set,
			build_dynamic_type_sets,
			build_tuple_reference_item,
			build_tuple_put_reference,
			build_agent_call,
			report_manifest_array,
			report_manifest_tuple,
			propagate_agent_closed_operands_dynamic_types,
			propagate_argument_dynamic_types,
			propagate_argument_operand_dynamic_types,
			propagate_assignment_dynamic_types,
			propagate_assignment_attempt_dynamic_types,
			propagate_builtin_dynamic_types,
			propagate_call_agent_result_dynamic_types,
			propagate_cap_dynamic_types,
			propagate_creation_dynamic_type,
			propagate_extended_attribute_result_dynamic_types,
			propagate_if_expression_dynamic_types,
			propagate_inline_agent_result_dynamic_types,
			propagate_inspect_expression_dynamic_types,
			propagate_like_argument_dynamic_types,
			propagate_manifest_string_area_dynamic_type,
			propagate_named_object_test_dynamic_types,
			propagate_tuple_label_result_dynamic_types,
			propagate_tuple_label_argument_dynamic_types,
			propagate_qualified_call_target_dynamic_types,
			propagate_equality_expression_target_dynamic_types,
			propagate_object_equality_expression_target_dynamic_types
		end

create

	make

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET
			-- New dynamic type set
		do
			if a_type.is_expanded then
					-- Note that for expanded types, there is no type other
					-- than itself that conforms to it.
				Result := a_type
			else
				create {ET_DYNAMIC_PUSH_TYPE_SET} Result.make (a_type)
				dynamic_type_set_count := dynamic_type_set_count + 1
			end
		end

feature -- Generation

	build_dynamic_type_sets
			-- Build dynamic type sets for `current_dynamic_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_precursor: detachable ET_DYNAMIC_PRECURSOR
			l_other_precursors: detachable ET_DYNAMIC_PRECURSOR_LIST
			k, nb3: INTEGER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE]
			old_object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
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
							l_precursor := l_feature.first_precursor
							if l_precursor /= Void then
								if not l_precursor.is_built then
									is_built := False
									build_feature_dynamic_type_sets (l_precursor, l_type)
										-- `build_feature_dynamic_type_sets' may have
										-- added other features to the list.
									nb2 := l_features.count
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
							l_precursor := l_feature.first_precursor
							if l_precursor /= Void then
								if not l_precursor.is_built then
									is_built := False
									build_feature_dynamic_type_sets (l_precursor, l_type)
										-- `build_feature_dynamic_type_sets' may have
										-- added other features to the list.
									nb2 := l_features.count
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
			end
			check_catcall_validity
			object_id_dynamic_type_set := old_object_id_dynamic_type_set
			alive_conforming_descendants_per_type := Void
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_reference_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		local
			i, nb: INTEGER
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_result_type_set := an_item_feature.result_type_set
			if l_result_type_set /= Void then
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					l_item_type_set := l_item_type_sets.item (i)
					if not l_item_type_set.static_type.is_basic then
						l_item_type_set.put_target (l_result_type_set, current_dynamic_system)
					end
					i := i + 1
				end
			end
		end

	build_tuple_put_reference (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_argument_type_sets := a_put_feature.dynamic_type_sets
			if l_argument_type_sets.count > 1 then
				l_argument_type_set := l_argument_type_sets.item (1)
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					l_item_type_set := l_item_type_sets.item (i)
					if not l_item_type_set.static_type.is_basic then
						l_argument_type_set.put_target (l_item_type_set, current_dynamic_system)
					end
					i := i + 1
				end
			end
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		local
			l_call_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_agent_type_set: ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET
		do
			l_call_dynamic_type_sets := a_call_feature.dynamic_type_sets
			if not l_call_dynamic_type_sets.is_empty then
				create l_agent_type_set.make (l_call_dynamic_type_sets.item (1).static_type, an_agent_type)
				l_agent_type_set.set_never_void
				create l_dynamic_type_sets.make_with_capacity (1)
				l_dynamic_type_sets.put_last (l_agent_type_set)
				a_call_feature.set_dynamic_type_sets (l_dynamic_type_sets)
			end
		end

feature {NONE} -- Event handling

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a manifest array of type `a_type' in context
			-- of `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			l_primary_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_expression: ET_EXPRESSION
			l_expression_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				l_primary_type := l_type.primary_type
				mark_type_alive (l_primary_type)
				set_dynamic_type_set (l_type, an_expression)
					-- Make sure that types "SPECIAL [XXX]" (used in feature 'area'), and
					-- "INTEGER" (used in feature 'lower' and 'upper') are marked as alive.
				l_queries := l_primary_type.queries
				if
					current_dynamic_system.array_area_feature = Void or
					current_dynamic_system.array_lower_feature = Void or
					current_dynamic_system.array_upper_feature = Void
				then
						-- Error already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
				elseif l_queries.count < 3 then
						-- Internal error: should not happen after the wellformedness
						-- of the expected attributes in class "ARRAY" has been checked
						-- in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_giaaa_error
				else
						-- Feature 'area' should be the first in the list of features.
					l_dynamic_type_set := l_queries.item (1).result_type_set
					if l_dynamic_type_set = Void then
							-- Internal error: should not happen after the wellformedness
							-- of the expected attributes in class "ARRAY" has been checked
							-- in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif attached {ET_DYNAMIC_SPECIAL_TYPE} l_dynamic_type_set.static_type.primary_type as l_special_type then
						mark_type_alive (l_special_type)
						l_dynamic_type_set.static_type.put_target (l_dynamic_type_set, current_dynamic_system)
						l_item_type_set := l_special_type.item_type_set
						nb := an_expression.count
						from i := 1 until i > nb loop
							l_expression := an_expression.expression (i)
							l_expression_type_set := dynamic_type_set (l_expression)
							if l_expression_type_set = Void then
									-- Internal error: the dynamic type set of the expressions
									-- in the manifest array should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_expression_type_set.put_target (l_item_type_set, current_dynamic_system)
							end
							i := i + 1
						end
					else
							-- Error in feature 'area', already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
					end
						-- Feature 'lower' should be the second in the list of features.
					l_dynamic_type_set := l_queries.item (2).result_type_set
					if l_dynamic_type_set = Void then
							-- Internal error: should not happen after the wellformedness
							-- of the expected attributes in class "ARRAY" has been checked
							-- in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						mark_type_alive (l_dynamic_type_set.static_type.primary_type)
					end
						-- Feature 'upper' should be the third in the list of features.
					l_dynamic_type_set := l_queries.item (3).result_type_set
					if l_dynamic_type_set = Void then
							-- Internal error: should not happen after the wellformedness
							-- of the expected attributes in class "ARRAY" has been checked
							-- in ET_DYNAMIC_SYSTEM.compile_kernel.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						mark_type_alive (l_dynamic_type_set.static_type.primary_type)
					end
				end
			end
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a manifest tuple of type `a_type' in context of
			-- `a_context' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			l_primary_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_expression: ET_EXPRESSION
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				l_primary_type := l_type.primary_type
				mark_type_alive (l_primary_type)
				set_dynamic_type_set (l_type, an_expression)
				if attached {ET_DYNAMIC_TUPLE_TYPE} l_primary_type as l_tuple_type then
					l_item_type_sets := l_tuple_type.item_type_sets
					nb := an_expression.count
					if l_item_type_sets.count /= nb then
							-- Internal error: the tuple type of a manifest tuple should
							-- have the proper number of generic parameters.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						from i := 1 until i > nb loop
							l_expression := an_expression.expression (i)
							l_dynamic_type_set := dynamic_type_set (l_expression)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type set of the expressions
									-- in the manifest tuple should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_dynamic_type_set.put_target (l_item_type_sets.item (i), current_dynamic_system)
							end
							i := i + 1
						end
					end
				else
						-- Internal error: the type of a manifest tuple should be a tuple type.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
		end

feature {NONE} -- Implementation

	propagate_agent_closed_operands_dynamic_types (an_agent: ET_AGENT; an_agent_type: ET_DYNAMIC_ROUTINE_TYPE)
			-- Propagate dynamic types of closed operands of `an_agent' to the
			-- dynamic type set of the attribute 'closed_operands' of `an_agent_type'.
		local
			l_operand: ET_OPERAND
			l_arguments: detachable ET_AGENT_ARGUMENT_OPERANDS
			i, nb_args: INTEGER
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_TUPLE_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			j, nb_items: INTEGER
		do
			l_arguments := an_agent.arguments
			if l_arguments /= Void then
				nb_args := l_arguments.count
				create l_parameters.make_with_capacity (nb_args + 1)
				from i := nb_args until i < 1 loop
					l_operand := l_arguments.actual_argument (i)
					if not l_operand.is_open_operand then
						l_dynamic_type_set := dynamic_type_set (l_operand)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of the closed
								-- operand should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_parameters.put_first (l_dynamic_type_set.static_type.base_type)
						end
					end
					i := i - 1
				end
			else
				create l_parameters.make_with_capacity (1)
			end
			l_operand := an_agent.target
			if not l_operand.is_open_operand then
				l_dynamic_type_set := dynamic_type_set (l_operand)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type set of the closed
						-- operand should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_parameters.put_first (l_dynamic_type_set.static_type.base_type)
				end
			end
			create l_tuple_type.make (tokens.implicit_attached_type_mark, l_parameters, current_universe_impl.tuple_type.named_base_class)
			l_dynamic_type := current_dynamic_system.dynamic_type (l_tuple_type, current_system.any_type)
			if attached {ET_DYNAMIC_TUPLE_TYPE} l_dynamic_type.primary_type as l_dynamic_tuple_type then
				mark_type_alive (l_dynamic_tuple_type)
				if
					current_dynamic_system.routine_rout_disp_feature = Void or
					current_dynamic_system.routine_closed_operands_feature = Void
				then
						-- Error already reported in ET_DYNAMIC_SYSTEM.compile_kernel.
					set_fatal_error
				elseif an_agent_type.attribute_count < 2 then
						-- Internal error: should not happen after the wellformedness
						-- of the expected attributes in class "ROUTINE" has been checked
						-- in ET_DYNAMIC_SYSTEM.compile_kernel.
						-- The second attribute is supposed to be 'closed_operands' in the Agent type
					set_fatal_error
					error_handler.report_giaaa_error
				elseif not attached an_agent_type.queries.item (2).result_type_set as l_result_type_set then
						-- Internal error: an attribute should have a result type set.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_tuple_type.put_target (l_result_type_set, current_dynamic_system)
					l_item_type_sets := l_dynamic_tuple_type.item_type_sets
					j := 1
					nb_items := l_item_type_sets.count
					l_operand := an_agent.target
					if not l_operand.is_open_operand then
						l_dynamic_type_set := dynamic_type_set (l_operand)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of the closed
								-- operand should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif j > nb_items then
								-- Internal error: there is a mismatch between the number of closed
								-- operands and the size of the corresponding Tuple.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type_set.put_target (l_item_type_sets.item (j), current_dynamic_system)
							j := j + 1
						end
					end
					if l_arguments /= Void then
						from i := 1 until i > nb_args loop
							l_operand := l_arguments.actual_argument (i)
							if not l_operand.is_open_operand then
								l_dynamic_type_set := dynamic_type_set (l_operand)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type set of the closed
										-- operand should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
								elseif j > nb_items then
										-- Internal error: there is a mismatch between the number of closed
										-- operands and the size of the corresponding Tuple.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_dynamic_type_set.put_target (l_item_type_sets.item (j), current_dynamic_system)
									j := j + 1
								end
							end
							i := i + 1
						end
					end
				end
			else
					-- Internal error: the dynamic type of a Tuple type
					-- should be a dynamic tuple type.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	propagate_argument_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set `a_formal_type_set' of the
			-- corresponding formal argument.
		local
			l_actual_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_actual_type_set := dynamic_type_set (an_actual)
			if l_actual_type_set = Void then
					-- Internal error: the dynamic type sets of the actual
					-- arguments should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_actual_type_set.put_target (a_formal_type_set, current_dynamic_system)
			end
		end

	propagate_argument_operand_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set of the corresponding formal
			-- argument at index `a_formal' in `a_callee'.
		local
			l_actual_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_formal_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_actual_type_set := dynamic_type_set (an_actual)
			l_formal_type_set := a_callee.argument_type_set (a_formal)
			if l_actual_type_set = Void then
					-- Internal error: the dynamic type sets of the actual
					-- arguments should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_formal_type_set = Void then
					-- Internal error: it has already been checked somewhere else
					-- that there was the same number of actual and formal arguments.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_actual_type_set.put_target (l_formal_type_set, current_dynamic_system)
			end
		end

	propagate_assignment_dynamic_types (an_assignment: ET_ASSIGNMENT)
			-- Propagate dynamic types of the source of `an_assignment'
			-- to the dynamic type set of the target of `an_assignment'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_source_type_set := dynamic_type_set (an_assignment.source)
			l_target_type_set := dynamic_type_set (an_assignment.target)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type sets of the source
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_source_type_set.put_target (l_target_type_set, current_dynamic_system)
			end
		end

	propagate_assignment_attempt_dynamic_types (an_assignment_attempt: ET_ASSIGNMENT_ATTEMPT)
			-- Propagate dynamic types of the source of `an_assignment_attempt'
			-- to the dynamic type set of the target of `an_assignment_attempt'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_source_type_set := dynamic_type_set (an_assignment_attempt.source)
			l_target_type_set := dynamic_type_set (an_assignment_attempt.target)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type sets of the source
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_source_type_set.put_target (l_target_type_set, current_dynamic_system)
			end
		end

	propagate_builtin_dynamic_types (a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' to `a_target_type_set'
			-- in built-in feature `current_dynamic_feature'.
		do
			a_source_type_set.put_target (a_target_type_set, current_dynamic_system)
		end

	propagate_call_agent_result_dynamic_types (an_agent: ET_CALL_AGENT; a_query: ET_DYNAMIC_FEATURE; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the result of `a_query' to the dynamic type set
			-- `a_result_type_set' of the result of type of `an_agent' (probably a FUNCTION
			-- or a PREDICATE)
		local
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_dynamic_type_set := a_query.result_type_set
			if l_dynamic_type_set = Void then
					-- Internal error: a FUNCTION or a PREDICATE should be an agent on a query.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type_set.put_target (a_result_type_set, current_dynamic_system)
			end
		end

	propagate_cap_dynamic_types (a_expression: ET_EXPRESSION; a_detachable_type_set, a_attached_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of a possibly Void expression to
			-- the dynamic types of its attached counterpart when it is
			-- known to be attached with a CAP (Certified Attachment Pattern).
		do
			a_detachable_type_set.put_target (a_attached_type_set, current_dynamic_system)
		end

	propagate_creation_dynamic_type (a_creation_type: ET_DYNAMIC_TYPE; a_creation: ET_CREATION_INSTRUCTION)
			-- Propagate the creation type `a_creation_type' of `a_creation'
			-- to the dynamic type set of the target of `a_creation'.
		local
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_target_type_set := dynamic_type_set (a_creation.target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the
					-- target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				a_creation_type.put_target (l_target_type_set, current_dynamic_system)
			end
		end

	propagate_extended_attribute_result_dynamic_types (a_result_type_set, a_attribute_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_result_type_set' (the dynamic type
			-- set of the entity 'Result' in the body of the extended attribute
			-- `current_dynamic_feature') to `a_attribute_type_set' (the dynamic
			-- type set of this attribute when accessed from other routines).
		do
			a_result_type_set.put_target (a_attribute_type_set, current_dynamic_system)
		end

	propagate_if_expression_dynamic_types (a_if_expression: ET_IF_EXPRESSION; a_sub_expression: ET_EXPRESSION; a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' (which is the dynamic
			-- type set of the sub-expressions `a_sub_expression' within `a_if_expression')
			-- to the dynamic type set `a_target_type_set' (which is the dynamic
			-- type set of `a_if_expression').
		do
			a_source_type_set.put_target (a_target_type_set, current_dynamic_system)
		end

	propagate_inline_agent_result_dynamic_types (an_agent: ET_INLINE_AGENT; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the result of the associated feature of `an_agent'
			-- to the dynamic type set `a_result_type_set' of the result of type of `an_agent'
			-- (probably a FUNCTION or a PREDICATE).
		local
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_implicit_result: detachable ET_RESULT
		do
			l_implicit_result := an_agent.implicit_result
			if l_implicit_result = Void then
					-- Internal error: a FUNCTION or a PREDICATE should be an agent whose
					-- associated feature is a query.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type_set := dynamic_type_set (l_implicit_result)
				if l_dynamic_type_set = Void then
						-- Internal error: a FUNCTION or a PREDICATE should be an agent whose
						-- associated feature is a query.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type_set.put_target (a_result_type_set, current_dynamic_system)
				end
			end
		end

	propagate_inspect_expression_dynamic_types (a_inspect_expression: ET_INSPECT_EXPRESSION; a_sub_expression: ET_EXPRESSION; a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' (which is the dynamic
			-- type set of the sub-expressions `a_sub_expression' within `a_inspect_expression')
			-- to the dynamic type set `a_target_type_set' (which is the dynamic
			-- type set of `a_inspect_expression').
		do
			a_source_type_set.put_target (a_target_type_set, current_dynamic_system)
		end

	propagate_like_argument_dynamic_types (a_call: ET_FEATURE_CALL_EXPRESSION; a_formal_type_set, an_actual_type_set: ET_DYNAMIC_TYPE_SET)
			-- When `a_call' is a call to a query whose type is of the form "like argument",
			-- propagate dynamic types `a_formal_type_set' of the result of that query
			-- to the dynamic type set `an_actual_type_set' of the call.
			-- `a_formal_type_set' has a static type which corresponds to the formal type of the argument.
			-- `an_actual_type_set' has a static type which corresponds to the actual type of the argument.
		do
			a_formal_type_set.put_target (an_actual_type_set, current_dynamic_system)
		end

	propagate_manifest_string_area_dynamic_type (a_area_type: ET_DYNAMIC_TYPE; a_area_type_set: ET_DYNAMIC_TYPE_SET; a_string: ET_MANIFEST_STRING)
			-- Propagate the dynamic type of the 'area' of manifest string `a_string'
			-- to its dynamic type set `a_area_type_set'.
		do
			a_area_type.put_target (a_area_type_set, current_dynamic_system)
		end

	propagate_named_object_test_dynamic_types (a_object_test: ET_NAMED_OBJECT_TEST)
			-- Propagate dynamic types of the expression of `a_object_test'
			-- to the dynamic type set of the local of `a_object_test'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_source_type_set := dynamic_type_set (a_object_test.expression)
			l_target_type_set := dynamic_type_set (a_object_test.name)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type sets of the expression
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the object-test label
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_source_type_set.put_target (l_target_type_set, current_dynamic_system)
			end
		end

	propagate_qualified_call_target_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate the dynamic types of the target of `a_call' to the call itself.
		do
			a_call.target_type_set.put_target (a_call, current_dynamic_system)
		end

	propagate_equality_expression_target_dynamic_types (a_equality: ET_DYNAMIC_EQUALITY_EXPRESSION)
			-- Propagate the dynamic types of the target of `a_equality' to the equality itself.
		do
			a_equality.target_type_set.put_target (a_equality, current_dynamic_system)
		end

	propagate_object_equality_expression_target_dynamic_types (a_equality: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION)
			-- Propagate the dynamic types of the target of `a_equality' to the object-equality itself.
		do
			a_equality.target_type_set.put_target (a_equality, current_dynamic_system)
		end

	propagate_tuple_label_argument_dynamic_types (a_label_type_set: ET_DYNAMIC_TYPE_SET; a_assigner: ET_ASSIGNER_INSTRUCTION)
			-- Propagate dynamic types of the source of tuple label setter `a_assigner'
			-- to the dynamic type set `a_label_type_set' of the corresponding tuple label.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_source_type_set := current_dynamic_feature.dynamic_type_set (a_assigner.source)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type set of the source
					-- of the label setter should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_source_type_set.put_target (a_label_type_set, current_dynamic_system)
			end
		end

	propagate_tuple_label_result_dynamic_types (a_label_type_set, a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types `a_label_type_set' of a tuple label
			-- to the dynamic type set `a_result_type_set' of the result type
			-- of the associated qualified call.
		do
			a_label_type_set.put_target (a_result_type_set, current_dynamic_system)
		end

end
