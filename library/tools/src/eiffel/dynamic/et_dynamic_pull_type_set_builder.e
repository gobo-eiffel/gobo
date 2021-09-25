note

	description:

		"Eiffel dynamic type set builders where types are pulled from subsets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PULL_TYPE_SET_BUILDER

inherit

	ET_DYNAMIC_TYPE_BUILDER
		redefine
			new_dynamic_type_set,
			build_dynamic_type_sets,
			build_tuple_reference_item,
			build_tuple_put_reference,
			build_agent_call,
			propagate_call_type,
			append_catcall_error_message,
			report_agent_qualified_query_call,
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
			propagate_tuple_label_argument_dynamic_types
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
				create {ET_DYNAMIC_PULL_TYPE_SET} Result.make (a_type)
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
			l_procedure_call: detachable ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_query_call: detachable ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_target: ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
			old_object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_equality: detachable ET_DYNAMIC_EQUALITY_EXPRESSION
			l_object_equality: detachable ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION
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
					if attached {ET_DYNAMIC_TUPLE_TYPE} l_type as l_tuple_type then
						propagate_types (l_tuple_type.item_type_sets)
					elseif attached {ET_DYNAMIC_ROUTINE_TYPE} l_type as l_agent_type then
						propagate_types (l_agent_type.open_operand_type_sets)
					end
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
						end
						propagate_feature_types (l_feature)
						l_precursor := l_feature.first_precursor
						if l_precursor /= Void then
							if not l_precursor.is_built then
								is_built := False
								build_feature_dynamic_type_sets (l_precursor, l_type)
									-- `build_feature_dynamic_type_sets' may have
									-- added other features to the list.
								nb2 := l_features.count
							end
							propagate_feature_types (l_precursor)
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
									propagate_feature_types (l_precursor)
									k := k + 1
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
						end
						propagate_feature_types (l_feature)
						l_precursor := l_feature.first_precursor
						if l_precursor /= Void then
							if not l_precursor.is_built then
								is_built := False
								build_feature_dynamic_type_sets (l_precursor, l_type)
									-- `build_feature_dynamic_type_sets' may have
									-- added other features to the list.
								nb2 := l_features.count
							end
							propagate_feature_types (l_precursor)
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
									propagate_feature_types (l_precursor)
									k := k + 1
								end
							end
						end
						j := j + 1
					end
						-- Process dynamic qualified query calls.
					from
						l_query_call := l_type.query_calls
					until
						l_query_call = Void
					loop
						l_count := l_query_call.count
						l_query_call.propagate_types (Current)
						if l_query_call.count /= l_count then
							is_built := False
						end
						l_target := l_query_call.result_type_set
						l_count := l_target.count
						l_target.propagate_types (current_dynamic_system)
						if l_target.count /= l_count then
							is_built := False
						end
						l_query_call := l_query_call.next
					end
						-- Process dynamic qualified procedure calls.
					from
						l_procedure_call := l_type.procedure_calls
					until
						l_procedure_call = Void
					loop
						l_count := l_procedure_call.count
						l_procedure_call.propagate_types (Current)
						if l_procedure_call.count /= l_count then
							is_built := False
						end
						l_procedure_call := l_procedure_call.next
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
			end
			check_catcall_validity
			object_id_dynamic_type_set := old_object_id_dynamic_type_set
			alive_conforming_descendants_per_type := Void
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate `a_type' from target type set `a_call'.
		do
			a_call.propagate_type (a_type, Current)
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_reference_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		local
			i, nb: INTEGER
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_result_type_set := an_item_feature.result_type_set
			if l_result_type_set /= Void and then not l_result_type_set.is_expanded then
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					l_item_type_set := l_item_type_sets.item (i)
					if not l_item_type_set.static_type.is_basic then
						create l_attachment.make (l_item_type_set, an_item_feature, a_tuple_type)
						l_result_type_set.put_source (l_attachment, current_dynamic_system)
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
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_argument_type_sets := a_put_feature.dynamic_type_sets
			if l_argument_type_sets.count > 1 then
				l_argument_type_set := l_argument_type_sets.item (1)
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					l_item_type_set := l_item_type_sets.item (i)
					if not l_item_type_set.static_type.is_basic then
						create l_attachment.make (l_argument_type_set, a_put_feature, a_tuple_type)
						l_item_type_set.put_source (l_attachment, current_dynamic_system)
					end
					i := i + 1
				end
			end
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		local
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_call_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_agent_type_set: ET_DYNAMIC_AGENT_OPERAND_PULL_TYPE_SET
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

feature {NONE} -- Generation

	propagate_types (a_type_sets: ET_DYNAMIC_TYPE_SET_LIST)
			-- Propagates types in `a_type_sets'.
		require
			a_type_sets_not_void: a_type_sets /= Void
		local
			i, nb: INTEGER
			l_type_set: ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
		do
			nb := a_type_sets.count
			from i := 1 until i > nb loop
				l_type_set := a_type_sets.item (i)
				l_count := l_type_set.count
				l_type_set.propagate_types (current_dynamic_system)
				if l_type_set.count /= l_count then
					is_built := False
				end
				i := i + 1
			end
		end

	propagate_feature_types (a_feature: ET_DYNAMIC_FEATURE)
			-- Propagated types in dynamic type sets of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_locals: detachable ET_LOCAL_VARIABLE_LIST
			l_target: detachable ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
			i, nb: INTEGER
		do
			l_arguments := a_feature.static_feature.arguments
			if l_arguments /= Void then
				nb := l_arguments.count
				if nb > 0 then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_dynamic_type_sets := a_feature.dynamic_type_sets
					if l_dynamic_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of formal arguments in
							-- feature redeclaration.
						if not has_fatal_error then
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						from i := 1 until i > nb loop
							l_target := l_dynamic_type_sets.item (i)
							l_count := l_target.count
							l_target.propagate_types (current_dynamic_system)
							if l_target.count /= l_count then
								is_built := False
							end
							i := i + 1
						end
					end
				end
			end
			l_locals := a_feature.static_feature.locals
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					l_target := a_feature.dynamic_type_set (l_locals.local_variable (i).name)
					if l_target = Void then
							-- Internal error: the dynamic type sets of the local
							-- variables should be known at this stage.
						if not has_fatal_error then
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						l_count := l_target.count
						l_target.propagate_types (current_dynamic_system)
						if l_target.count /= l_count then
							is_built := False
						end
					end
					i := i + 1
				end
			end
			l_target := a_feature.result_type_set
			if l_target /= Void then
				l_count := l_target.count
				l_target.propagate_types (current_dynamic_system)
				if l_target.count /= l_count then
					is_built := False
				end
			end
		end

feature {NONE} -- CAT-calls

	append_catcall_error_message (a_message: STRING; a_target_type: ET_DYNAMIC_PRIMARY_TYPE; a_dynamic_feature: detachable ET_DYNAMIC_FEATURE;
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; an_actual_type: ET_DYNAMIC_PRIMARY_TYPE;
		an_actual_type_set: ET_DYNAMIC_TYPE_SET; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Append to `a_message' the error message of a CAT-call error in `a_call'.
			-- When the target is of type `a_target_type', we try to pass to the corresponding
			-- feature `a_dynamic_feature' an actual argument of type `an_actual_type' (which
			-- is one of the types of `an_actual_type_set') which does not conform to the type
			-- of the `arg'-th corresponding formal argument `a_formal_type'.
			-- When `a_dynamic_feature' is Void, then the call is assumed to be a Tuple label setter.
		local
			l_class_impl: ET_CLASS
			l_source: detachable ET_DYNAMIC_ATTACHMENT
			l_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_visited_sources: DS_ARRAYED_LIST [ET_DYNAMIC_ATTACHMENT]
			l_source_stack: DS_ARRAYED_STACK [ET_DYNAMIC_ATTACHMENT]
			l_position: ET_POSITION
			l_argument: ET_ARGUMENT_OPERAND
			i, j, nb: INTEGER
		do
-- TODO: better error message reporting.
			if not attached a_call.static_call.arguments as l_arguments then
					-- Should never happen according to the precondition.
				check precondition_valid_arg: False end
			elseif not attached a_call.static_call.target as l_target then
					-- Should never happen since according to the precondition
					-- the target type set is not void.
				check target_not_void: False end
			else
				precursor (a_message, a_target_type, a_dynamic_feature, arg, a_formal_type, an_actual_type, an_actual_type_set, a_call)
				a_message.append_string (":%N")
				l_visited_sources := shared_visited_sources
				l_visited_sources.wipe_out
				l_source_stack := shared_source_stack
				l_source_stack.wipe_out
				from
					a_message.append_string ("%TTarget type: '")
					a_message.append_string (a_target_type.base_type.to_text)
					a_message.append_string ("'%N")
					l_type_set := a_call.target_type_set
				until
					l_type_set = Void
				loop
					if l_type_set = a_target_type then
						j := j + 1
						a_message.append_string ("%T%TAttachment stack #")
						a_message.append_string (j.out)
						a_message.append_character ('%N')
						a_message.append_string ("%T%T%Tclass ")
						a_message.append_string (a_call.current_type.base_type.to_text)
						a_message.append_string (" (")
						l_class_impl := a_call.current_feature.static_feature.implementation_class
						if a_call.current_type.base_class /= l_class_impl then
							a_message.append_string (l_class_impl.upper_name)
							a_message.append_character (',')
						end
						l_position := l_target.position
						a_message.append_string (l_position.line.out)
						a_message.append_character (',')
						a_message.append_string (l_position.column.out)
						if l_target.is_open_operand then
							a_message.append_string ("): open target%N")
						else
							a_message.append_string ("): target%N")
						end
						nb := l_source_stack.count
						from i := 1 until i > nb loop
							l_source := l_source_stack.i_th (i)
							if not l_source.is_null_attachment then
								a_message.append_string ("%T%T%Tclass ")
								a_message.append_string (l_source.current_type.base_type.to_text)
								a_message.append_string (" (")
								l_class_impl := l_source.current_feature.static_feature.implementation_class
								if l_source.current_type.base_class /= l_class_impl then
									a_message.append_string (l_class_impl.upper_name)
									a_message.append_character (',')
								end
								l_position := l_source.position
								a_message.append_string (l_position.line.out)
								a_message.append_character (',')
								a_message.append_string (l_position.column.out)
								a_message.append_character (')')
								a_message.append_character (':')
								a_message.append_character (' ')
								a_message.append_string (l_source.description)
								a_message.append_character ('%N')
							end
							i := i + 1
						end
						from
							l_source := Void
						until
							l_source /= Void or l_source_stack.is_empty
						loop
							l_source := l_source_stack.item.next_attachment
							l_source_stack.remove
						end
					else
						l_source := l_type_set.sources
					end
					from
						l_type_set := Void
					until
						l_source = Void
					loop
						if l_source.visited then
							from
								l_source := l_source.next_attachment
							until
								l_source /= Void or l_source_stack.is_empty
							loop
								l_source := l_source_stack.item.next_attachment
								l_source_stack.remove
							end
						elseif l_source.has_type (a_target_type) then
							l_source.set_visited (True)
							l_visited_sources.force_last (l_source)
							l_source_stack.force (l_source)
							l_type_set := l_source.source_type_set
								-- Jump out of the loop.
							l_source := Void
						else
							from
								l_source := l_source.next_attachment
							until
								l_source /= Void or l_source_stack.is_empty
							loop
								l_source := l_source_stack.item.next_attachment
								l_source_stack.remove
							end
						end
					end
					if j >= 10 then
							-- Report no more than 10 entries in the
							-- attachment stack, otherwise `a_message'
							-- gets too big and we run out of memory.
						l_type_set := Void
					end
				end
				nb := l_visited_sources.count
				from i := 1 until i > nb loop
					l_visited_sources.item (i).set_visited (False)
					i := i + 1
				end
				l_visited_sources.wipe_out
				l_source_stack.wipe_out
				j := 0
				from
					a_message.append_string ("%TArgument type: '")
					a_message.append_string (an_actual_type.base_type.to_text)
					a_message.append_string ("'%N")
					l_type_set := an_actual_type_set
				until
					l_type_set = Void
				loop
					if l_type_set = an_actual_type then
						j := j + 1
						a_message.append_string ("%T%TAttachment stack #")
						a_message.append_string (j.out)
						a_message.append_character ('%N')
						a_message.append_string ("%T%T%Tclass ")
						a_message.append_string (a_call.current_type.base_type.to_text)
						a_message.append_string (" (")
						l_class_impl := a_call.current_feature.static_feature.implementation_class
						if a_call.current_type.base_class /= l_class_impl then
							a_message.append_string (l_class_impl.upper_name)
							a_message.append_character (',')
						end
						l_argument := l_arguments.actual_argument (arg)
						l_position := l_argument.position
						a_message.append_string (l_position.line.out)
						a_message.append_character (',')
						a_message.append_string (l_position.column.out)
						if l_argument.is_open_operand then
							if attached {ET_AGENT_IMPLICIT_OPEN_ARGUMENT} l_argument as l_implicit_open_argument then
								a_message.append_string ("): implicit open argument #")
								a_message.append_string (l_implicit_open_argument.argument_index.out)
								a_message.append_character ('%N')
							else
								a_message.append_string ("): open argument%N")
							end
						else
							a_message.append_string ("): argument%N")
						end
						nb := l_source_stack.count
						from i := 1 until i > nb loop
							l_source := l_source_stack.i_th (i)
							if not l_source.is_null_attachment then
								a_message.append_string ("%T%T%Tclass ")
								a_message.append_string (l_source.current_type.base_type.to_text)
								a_message.append_string (" (")
								l_class_impl := l_source.current_feature.static_feature.implementation_class
								if l_source.current_type.base_class /= l_class_impl then
									a_message.append_string (l_class_impl.upper_name)
									a_message.append_character (',')
								end
								l_position := l_source.position
								a_message.append_string (l_position.line.out)
								a_message.append_character (',')
								a_message.append_string (l_position.column.out)
								a_message.append_character (')')
								a_message.append_character (':')
								a_message.append_character (' ')
								a_message.append_string (l_source.description)
								a_message.append_character ('%N')
							end
							i := i + 1
						end
						from
							l_source := Void
						until
							l_source /= Void or l_source_stack.is_empty
						loop
							l_source := l_source_stack.item.next_attachment
							l_source_stack.remove
						end
					else
						l_source := l_type_set.sources
					end
					from
						l_type_set := Void
					until
						l_source = Void
					loop
						if l_source.visited then
							from
								l_source := l_source.next_attachment
							until
								l_source /= Void or l_source_stack.is_empty
							loop
								l_source := l_source_stack.item.next_attachment
								l_source_stack.remove
							end
						elseif l_source.has_type (an_actual_type) then
							l_source.set_visited (True)
							l_visited_sources.force_last (l_source)
							l_source_stack.force (l_source)
							l_type_set := l_source.source_type_set
								-- Jump out of the loop.
							l_source := Void
						else
							from
								l_source := l_source.next_attachment
							until
								l_source /= Void or l_source_stack.is_empty
							loop
								l_source := l_source_stack.item.next_attachment
								l_source_stack.remove
							end
						end
					end
					if j >= 10 then
							-- Report no more than 10 entries in the
							-- attachment stack, otherwise `a_message'
							-- gets too big and we run out of memory.
						l_type_set := Void
					end
				end
				nb := l_visited_sources.count
				from i := 1 until i > nb loop
					l_visited_sources.item (i).set_visited (False)
					i := i + 1
				end
				l_visited_sources.wipe_out
				l_source_stack.wipe_out
			end
		end

	shared_visited_sources: DS_ARRAYED_LIST [ET_DYNAMIC_ATTACHMENT]
			-- Shared visited sources (used in `report_catcall_error')
		once
			create Result.make (20)
		ensure
			shared_visited_sources_not_void: Result /= Void
		end

	shared_source_stack: DS_ARRAYED_STACK [ET_DYNAMIC_ATTACHMENT]
			-- Shared stack of sources (used in `report_catcall_error')
		once
			create Result.make (20)
		ensure
			shared_source_stack_not_void: Result /= Void
		end

feature {NONE} -- Event handling

	report_agent_qualified_query_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Report the agent `an_expression' makes a qualified query call
			-- on `a_target_type_set' and returns `a_result_type_set'.
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_query_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
		do
			l_result_type_set := a_result_type_set
			if not l_result_type_set.is_expanded then
				l_result_type_set := new_dynamic_type_set (l_result_type_set.static_type)
				create l_dynamic_query_call.make (an_expression, a_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
				a_target_type_set.static_type.primary_type.put_query_call (l_dynamic_query_call)
				create l_result_attachment.make (a_result_type_set, an_expression, current_dynamic_feature, current_dynamic_type)
				l_result_type_set.put_source (l_result_attachment, current_dynamic_system)
			else
				create l_dynamic_query_call.make (an_expression, a_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
				a_target_type_set.static_type.primary_type.put_query_call (l_dynamic_query_call)
			end
		end

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
			l_item_attachment: ET_DYNAMIC_MANIFEST_ARRAY_ITEM_ATTACHMENT
			l_area_attachment: ET_DYNAMIC_MANIFEST_ARRAY_AREA_ATTACHMENT
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
					else
						if not attached {ET_DYNAMIC_SPECIAL_TYPE} l_dynamic_type_set.static_type.primary_type as l_special_type then
								-- Internal error: should not happen after the wellformedness
								-- of the expected attributes in class "ARRAY" has been checked
								-- in ET_DYNAMIC_SYSTEM.compile_kernel.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							mark_type_alive (l_special_type)
							if not l_dynamic_type_set.is_expanded then
								create l_area_attachment.make (l_dynamic_type_set.static_type, an_expression, current_dynamic_feature, current_dynamic_type)
								l_dynamic_type_set.put_source (l_area_attachment, current_dynamic_system)
							end
							l_item_type_set := l_special_type.item_type_set
							if not l_item_type_set.is_expanded then
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
										create l_item_attachment.make (l_item_type_set, l_expression, current_dynamic_feature, current_dynamic_type)
										l_expression_type_set.put_source (l_item_attachment, current_dynamic_system)
									end
									i := i + 1
								end
							end
						end
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
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_expression: ET_EXPRESSION
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_MANIFEST_TUPLE_ITEM_ATTACHMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_dynamic_system.dynamic_type (a_type, a_context)
				l_primary_type := l_type.primary_type
				mark_type_alive (l_primary_type)
				set_dynamic_type_set (l_type, an_expression)
				if not attached {ET_DYNAMIC_TUPLE_TYPE} l_primary_type as l_tuple_type then
						-- Internal error: the type of a manifest tuple should be a tuple type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
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
								l_item_type_set := l_item_type_sets.item (i)
								if not l_item_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_expression, current_dynamic_feature, current_dynamic_type)
									l_item_type_set.put_source (l_attachment, current_dynamic_system)
								end
							end
							i := i + 1
						end
					end
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
			l_item_attachment: ET_DYNAMIC_AGENT_CLOSED_OPERANDS_ITEM_ATTACHMENT
			l_tuple_attachment: ET_DYNAMIC_AGENT_CLOSED_OPERANDS_ATTACHMENT
			l_item_type_set: ET_DYNAMIC_TYPE_SET
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
			if not attached {ET_DYNAMIC_TUPLE_TYPE} l_dynamic_type.primary_type as l_dynamic_tuple_type then
					-- Internal error: the dynamic type of a Tuple type
					-- should be a dynamic tuple type.
				set_fatal_error
				error_handler.report_giaaa_error
			else
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
					if not l_result_type_set.is_expanded then
						create l_tuple_attachment.make (l_dynamic_tuple_type, an_agent, current_dynamic_feature, current_dynamic_type)
						l_result_type_set.put_source (l_tuple_attachment, current_dynamic_system)
					end
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
							l_item_type_set := l_item_type_sets.item (j)
							if not l_item_type_set.is_expanded then
								create l_item_attachment.make (l_dynamic_type_set, l_operand, current_dynamic_feature, current_dynamic_type)
								l_item_type_set.put_source (l_item_attachment, current_dynamic_system)
							end
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
									l_item_type_set := l_item_type_sets.item (j)
									if not l_item_type_set.is_expanded then
										create l_item_attachment.make (l_dynamic_type_set, l_operand, current_dynamic_feature, current_dynamic_type)
										l_item_type_set.put_source (l_item_attachment, current_dynamic_system)
									end
									j := j + 1
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	propagate_argument_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set `a_formal_type_set' of the
			-- corresponding formal argument.
		local
			l_actual_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
		do
			l_actual_type_set := dynamic_type_set (an_actual)
			if l_actual_type_set = Void then
					-- Internal error: the dynamic type sets of the actual
					-- arguments should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not a_formal_type_set.is_expanded then
				create l_attachment.make (l_actual_type_set, an_actual, current_dynamic_feature, current_dynamic_type)
				a_formal_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_argument_operand_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE)
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set of the corresponding formal
			-- argument at index `a_formal' in `a_callee'.
		local
			l_actual_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_formal_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
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
			elseif not l_formal_type_set.is_expanded then
				create l_attachment.make (l_actual_type_set, an_actual, current_dynamic_feature, current_dynamic_type)
				l_formal_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_assignment_dynamic_types (an_assignment: ET_ASSIGNMENT)
			-- Propagate dynamic types of the source of `an_assignment'
			-- to the dynamic type set of the target of `an_assignment'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ASSIGNMENT
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
			elseif not l_target_type_set.is_expanded then
				create l_attachment.make (l_source_type_set, an_assignment, current_dynamic_feature, current_dynamic_type)
				l_target_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_assignment_attempt_dynamic_types (an_assignment_attempt: ET_ASSIGNMENT_ATTEMPT)
			-- Propagate dynamic types of the source of `an_assignment_attempt'
			-- to the dynamic type set of the target of `an_assignment_attempt'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
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
			elseif not l_target_type_set.is_expanded then
				create l_assignment_attempt.make (l_source_type_set, an_assignment_attempt, current_dynamic_feature, current_dynamic_type)
				l_target_type_set.put_source (l_assignment_attempt, current_dynamic_system)
			end
		end

	propagate_builtin_dynamic_types (a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' to `a_target_type_set'
			-- in built-in feature `current_dynamic_feature'.
		local
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			if not a_target_type_set.is_expanded then
				create l_attachment.make (a_source_type_set, current_dynamic_feature, current_dynamic_type)
				a_target_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_call_agent_result_dynamic_types (an_agent: ET_CALL_AGENT; a_query: ET_DYNAMIC_FEATURE; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the result of `a_query' to the dynamic type set
			-- `a_result_type_set' of the result of type of `an_agent' (probably a FUNCTION
			-- or a PREDICATE).
		local
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
		do
			l_dynamic_type_set := a_query.result_type_set
			if l_dynamic_type_set = Void then
					-- Internal error: a FUNCTION or a PREDICATE should be an agent on a query.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not a_result_type_set.is_expanded then
				create l_result_attachment.make (l_dynamic_type_set, an_agent, current_dynamic_feature, current_dynamic_type)
				a_result_type_set.put_source (l_result_attachment, current_dynamic_system)
			end
		end

	propagate_cap_dynamic_types (a_expression: ET_EXPRESSION; a_detachable_type_set, a_attached_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of a possibly Void expression to
			-- the dynamic types of its attached counterpart when it is
			-- known to be attached with a CAP (Certified Attachment Pattern).
		local
			l_attachment: ET_DYNAMIC_CAP_ATTACHMENT
		do
			create l_attachment.make (a_detachable_type_set, a_expression, current_dynamic_feature, current_dynamic_type)
			a_attached_type_set.put_source (l_attachment, current_dynamic_system)
		end

	propagate_creation_dynamic_type (a_creation_type: ET_DYNAMIC_TYPE; a_creation: ET_CREATION_INSTRUCTION)
			-- Propagate the creation type `a_creation_type' of `a_creation'
			-- to the dynamic type set of the target of `a_creation'.
		local
			l_attachment: ET_DYNAMIC_CREATION_INSTRUCTION
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			l_target_type_set := dynamic_type_set (a_creation.target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the
					-- target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not l_target_type_set.is_expanded then
				create l_attachment.make (a_creation_type, a_creation, current_dynamic_feature, current_dynamic_type)
				l_target_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_extended_attribute_result_dynamic_types (a_result_type_set, a_attribute_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_result_type_set' (the dynamic type
			-- set of the entity 'Result' in the body of the extended attribute
			-- `current_dynamic_feature') to `a_attribute_type_set' (the dynamic
			-- type set of this attribute when accessed from other routines).
		local
			l_attachment: ET_DYNAMIC_EXTENDED_ATTRIBUTE_RESULT_ATTACHMENT
		do
			if not a_attribute_type_set.is_expanded then
				create l_attachment.make (a_result_type_set, current_dynamic_feature, current_dynamic_type)
				a_attribute_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_if_expression_dynamic_types (a_if_expression: ET_IF_EXPRESSION; a_sub_expression: ET_EXPRESSION; a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' (which is the dynamic
			-- type set of the sub-expressions `a_sub_expression' within `a_if_expression')
			-- to the dynamic type set `a_target_type_set' (which is the dynamic
			-- type set of `a_if_expression').
		local
			l_attachment: ET_DYNAMIC_IF_EXPRESSION_ATTACHMENT
		do
			create l_attachment.make (a_source_type_set, a_if_expression, a_sub_expression, current_dynamic_feature, current_dynamic_type)
			a_target_type_set.put_source (l_attachment, current_dynamic_system)
		end

	propagate_inline_agent_result_dynamic_types (an_agent: ET_INLINE_AGENT; a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of the result of the associated feature of `an_agent'
			-- to the dynamic type set `a_result_type_set' of the result of type of `an_agent'
			-- (probably a FUNCTION or a PREDICATE).
		local
			l_dynamic_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_implicit_result: detachable ET_RESULT
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
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
				elseif not a_result_type_set.is_expanded then
					create l_result_attachment.make (l_dynamic_type_set, an_agent, current_dynamic_feature, current_dynamic_type)
					a_result_type_set.put_source (l_result_attachment, current_dynamic_system)
				end
			end
		end

	propagate_inspect_expression_dynamic_types (a_inspect_expression: ET_INSPECT_EXPRESSION; a_sub_expression: ET_EXPRESSION; a_source_type_set, a_target_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types of `a_source_type_set' (which is the dynamic
			-- type set of the sub-expressions `a_sub_expression' within `a_inspect_expression')
			-- to the dynamic type set `a_target_type_set' (which is the dynamic
			-- type set of `a_inspect_expression').
		local
			l_attachment: ET_DYNAMIC_INSPECT_EXPRESSION_ATTACHMENT
		do
			create l_attachment.make (a_source_type_set, a_inspect_expression, a_sub_expression, current_dynamic_feature, current_dynamic_type)
			a_target_type_set.put_source (l_attachment, current_dynamic_system)
		end

	propagate_like_argument_dynamic_types (a_call: ET_FEATURE_CALL_EXPRESSION; a_formal_type_set, an_actual_type_set: ET_DYNAMIC_TYPE_SET)
			-- When `a_call' is a call to a query whose type is of the form "like argument",
			-- propagate dynamic types `a_formal_type_set' of the result of that query
			-- to the dynamic type set `an_actual_type_set' of the call.
			-- `a_formal_type_set' has a static type which corresponds to the formal type of the argument.
			-- `an_actual_type_set' has a static type which corresponds to the actual type of the argument.
		local
			l_attachment: ET_DYNAMIC_LIKE_ARGUMENT_CALL_ATTACHMENT
		do
			if not an_actual_type_set.is_expanded then
				create l_attachment.make (a_formal_type_set, a_call, current_dynamic_feature, current_dynamic_type)
				an_actual_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_manifest_string_area_dynamic_type (a_area_type: ET_DYNAMIC_TYPE; a_area_type_set: ET_DYNAMIC_TYPE_SET; a_string: ET_MANIFEST_STRING)
			-- Propagate the dynamic type of the 'area' of manifest string `a_string'
			-- to its dynamic type set `a_area_type_set'.
		local
			l_attachment: ET_DYNAMIC_MANIFEST_STRING_AREA_ATTACHMENT
		do
			if not a_area_type_set.is_expanded then
				create l_attachment.make (a_area_type, a_string, current_dynamic_feature, current_dynamic_type)
				a_area_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_named_object_test_dynamic_types (a_object_test: ET_NAMED_OBJECT_TEST)
			-- Propagate dynamic types of the expression of `a_object_test'
			-- to the dynamic type set of the local of `a_object_test'.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_dynamic_object_test: ET_DYNAMIC_OBJECT_TEST
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
			elseif not l_target_type_set.is_expanded then
				create l_dynamic_object_test.make (l_source_type_set, a_object_test, current_dynamic_feature, current_dynamic_type)
				l_target_type_set.put_source (l_dynamic_object_test, current_dynamic_system)
			end
		end

	propagate_tuple_label_argument_dynamic_types (a_label_type_set: ET_DYNAMIC_TYPE_SET; a_assigner: ET_ASSIGNER_INSTRUCTION)
			-- Propagate dynamic types of the source of tuple label setter `a_assigner'
			-- to the dynamic type set `a_label_type_set' of the corresponding tuple label.
		local
			l_source_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_TUPLE_LABEL_SETTER
		do
			l_source_type_set := current_dynamic_feature.dynamic_type_set (a_assigner.source)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type set of the source
					-- of the label setter should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not a_label_type_set.is_expanded then
				create l_attachment.make (l_source_type_set, a_assigner, current_dynamic_feature, current_dynamic_type)
				a_label_type_set.put_source (l_attachment, current_dynamic_system)
			end
		end

	propagate_tuple_label_result_dynamic_types (a_label_type_set, a_result_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate dynamic types `a_label_type_set' of a tuple label
			-- to the dynamic type set `a_result_type_set' of the result type
			-- of the associated qualified call.
		local
			l_result_attachment: ET_DYNAMIC_NULL_ATTACHMENT
		do
			if not a_result_type_set.is_expanded then
				create l_result_attachment.make (a_label_type_set, current_dynamic_feature, current_dynamic_type)
				a_result_type_set.put_source (l_result_attachment, current_dynamic_system)
			end
		end

end
