indexing

	description:

		"Eiffel dynamic type set builders where types are pulled from subsets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PULL_TYPE_SET_BUILDER

inherit

	ET_DYNAMIC_TYPE_BUILDER
		rename
			report_catcall_error as old_report_catcall_error
		redefine
			new_dynamic_type_set,
			build_dynamic_type_sets,
			build_tuple_item,
			build_tuple_put,
			build_agent_call,
			propagate_call_type,
			check_catcall_target_validity,
			report_assignment,
			report_assignment_attempt,
			report_creation_expression,
			report_creation_instruction,
			report_manifest_array,
			report_manifest_tuple,
			report_precursor_expression,
			report_precursor_instruction,
			report_qualified_call_agent,
			report_static_call_expression,
			report_static_call_instruction,
			report_string_constant,
			report_unqualified_call_agent,
			report_unqualified_call_expression,
			report_unqualified_call_instruction,
			report_builtin_any_twin
		end

create

	make

create {ET_FEATURE_CHECKER}

	make_from_checker

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		do
			if a_type.is_expanded then
				Result := a_type
			else
				create {ET_DYNAMIC_PULL_TYPE_SET} Result.make (a_type)
			end
		end

feature -- Generation

	build_dynamic_type_sets is
			-- Build dynamic type sets for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			k, nb3: INTEGER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_call: ET_DYNAMIC_QUALIFIED_CALL
			l_agent: ET_DYNAMIC_QUALIFIED_AGENT
			l_target: ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
		do
			has_fatal_error := False
			l_dynamic_types := current_system.dynamic_types
			is_built := False
			from until is_built loop
				is_built := True
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					l_tuple_type ?= l_type
					if l_tuple_type /= Void then
						propagate_types (l_tuple_type.item_type_sets)
					else
						l_agent_type ?= l_type
						if l_agent_type /= Void then
							propagate_types (l_agent_type.open_operand_type_sets)
						end
					end
					l_features := l_type.features
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
					i := i + 1
				end
				nb := dynamic_qualified_calls.count
				from i := 1 until i > nb loop
					l_call := dynamic_qualified_calls.item (i)
					l_count := l_call.count
					l_call.propagate_types (Current)
					if l_call.count /= l_count then
						is_built := False
					end
					l_target := l_call.result_type_set
					if l_target /= Void then
						l_count := l_target.count
						l_target.propagate_types (current_system)
						if l_target.count /= l_count then
							is_built := False
						end
					end
					i := i + 1
				end
				nb := dynamic_qualified_agents.count
				from i := 1 until i > nb loop
					l_agent := dynamic_qualified_agents.item (i)
					l_call := l_agent.qualified_call
					l_count := l_call.count
					l_call.propagate_types (Current)
					if l_call.count /= l_count then
						is_built := False
					end
					l_target := l_call.result_type_set
					if l_target /= Void then
						l_count := l_target.count
						l_target.propagate_types (current_system)
						if l_target.count /= l_count then
							is_built := False
						end
					end
					i := i + 1
				end
			end
			check_catcall_validity
			dynamic_qualified_calls.wipe_out
			dynamic_qualified_agents.wipe_out
			dynamic_unqualified_agents.wipe_out
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		do
			a_call.propagate_type (a_type, Current)
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		local
			i, nb: INTEGER
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_result_type_set := an_item_feature.result_type_set
			if l_result_type_set /= Void and then not l_result_type_set.is_expanded then
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					create l_attachment.make (l_item_type_sets.item (i), an_item_feature, a_tuple_type)
					l_result_type_set.put_source (l_attachment, current_system)
					i := i + 1
				end
			end
		end

	build_tuple_put (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE) is
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
					if not l_item_type_set.is_expanded then
						create l_attachment.make (l_argument_type_set, a_put_feature, a_tuple_type)
						l_item_type_set.put_source (l_attachment, current_system)
					end
					i := i + 1
				end
			end
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		local
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_agent_type_set: ET_DYNAMIC_AGENT_OPERAND_PULL_TYPE_SET
		do
			l_dynamic_type_sets := a_call_feature.dynamic_type_sets
			if not l_dynamic_type_sets.is_empty then
				create l_agent_type_set.make (l_dynamic_type_sets.item (1).static_type, an_agent_type)
				l_dynamic_type_sets.put (l_agent_type_set, 1)
			end
		end

feature {NONE} -- Generation

	propagate_types (a_type_sets: ET_DYNAMIC_TYPE_SET_LIST) is
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
				l_type_set.propagate_types (current_system)
				if l_type_set.count /= l_count then
					is_built := False
				end
				i := i + 1
			end
		end

	propagate_feature_types (a_feature: ET_DYNAMIC_FEATURE) is
			-- Propagated types in dynamic type sets of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_target: ET_DYNAMIC_TYPE_SET
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
							error_handler.report_gibdo_error
						end
					else
						from i := 1 until i > nb loop
							l_target := l_dynamic_type_sets.item (i)
							l_count := l_target.count
							l_target.propagate_types (current_system)
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
							error_handler.report_gibdq_error
						end
					else
						l_count := l_target.count
						l_target.propagate_types (current_system)
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
				l_target.propagate_types (current_system)
				if l_target.count /= l_count then
					is_built := False
				end
			end
		end

feature {NONE} -- CAT-calls

	check_catcall_target_validity (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Check whether target type `a_type' introduces CAT-calls in `a_call'.
		local
			l_seed: INTEGER
			l_feature: ET_FEATURE
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
			l_source: ET_DYNAMIC_ATTACHMENT
		do
			l_seed := a_call.static_call.name.seed
			l_feature := a_type.base_class.seeded_feature (l_seed)
			if l_feature = Void then
					-- Internal error: there should be a feature with seed
					-- `l_seed' in all descendants of `target_type.static_type'.
				set_fatal_error
				error_handler.report_gibby_error
			else
				l_dynamic_feature := a_type.dynamic_feature (l_feature, current_system)
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
							error_handler.report_gibbz_error
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
									error_handler.report_gibfa_error
								else
									l_source_type := l_source_type_set.first_type
									if l_source_type /= Void then
										if not l_source_type.conforms_to_type (l_target_type, current_system) then
											from
												l_source := l_target_type_set.sources
											until
												l_source = Void
											loop
												if l_source.source_type_set = l_source_type_set then
													report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_source_type, l_source, a_call)
												end
												l_source := l_source.next_attachment
											end
										end
										l_other_types := l_source_type_set.other_types
										if l_other_types /= Void then
											nb2 := l_other_types.count
											from j := 1 until j > nb2 loop
												l_source_type := l_other_types.item (j)
												if not l_source_type.conforms_to_type (l_target_type, current_system) then
													from
														l_source := l_target_type_set.sources
													until
														l_source = Void
													loop
														if l_source.source_type_set = l_source_type_set then
															report_catcall_error (a_type, l_dynamic_feature, i, l_target_type, l_source_type, l_source, a_call)
														end
														l_source := l_source.next_attachment
													end
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
		arg: INTEGER; a_formal_type: ET_DYNAMIC_TYPE; an_actual_type: ET_DYNAMIC_TYPE;
		an_actual_source: ET_DYNAMIC_ATTACHMENT; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Report a CAT-call error in `a_call'. When the target is of type `a_target_type', we
			-- try to pass to the corresponding feature `a_dynamic_feature' an actual
			-- argument of type `an_actual_type' (coming from `an_actual_source')
			-- which does not conform to the type of the `arg'-th corresponding formal
			-- argument `a_formal_type'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_dynamic_feature_not_void: a_dynamic_feature /= Void
			a_formal_type_not_void: a_formal_type /= Void
			an_actual_type_not_void: an_actual_type /= Void
			an_actual_source_not_void: an_actual_source /= Void
			a_call_not_void: a_call /= Void
		local
			l_message: STRING
			l_class_impl: ET_CLASS
			l_source: ET_DYNAMIC_ATTACHMENT
			l_type_set: ET_DYNAMIC_TYPE_SET
			l_visited_sources: DS_ARRAYED_LIST [ET_DYNAMIC_ATTACHMENT]
			l_source_stack: DS_ARRAYED_STACK [ET_DYNAMIC_ATTACHMENT]
			l_target: ET_TARGET_OPERAND
			l_position: ET_POSITION
			i, j, nb: INTEGER
		do
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
			l_message.append_string ("':%N")
			l_visited_sources := shared_visited_sources
			l_visited_sources.wipe_out
			l_source_stack := shared_source_stack
			l_source_stack.wipe_out
			from
				l_message.append_string ("%TTarget type: '")
				l_message.append_string (a_target_type.base_type.to_text)
				l_message.append_string ("'%N")
				l_type_set := a_call.target_type_set
			until
				l_type_set = Void
			loop
				if l_type_set = a_target_type then
					j := j + 1
					l_message.append_string ("%T%TAttachment stack #")
					l_message.append_string (j.out)
					l_message.append_character ('%N')
					l_message.append_string ("%T%T%Tclass ")
					l_message.append_string (a_call.current_type.base_type.to_text)
					l_message.append_string (" (")
					l_class_impl := a_call.current_feature.static_feature.implementation_class
					if a_call.current_type.base_type.direct_base_class (universe) /= l_class_impl then
						l_message.append_string (l_class_impl.name.name)
						l_message.append_character (',')
					end
					l_target := a_call.static_call.target
					l_position := l_target.position
					l_message.append_string (l_position.line.out)
					l_message.append_character (',')
					l_message.append_string (l_position.column.out)
					if l_target.is_open_operand then
						l_message.append_string ("): open target%N")
					else
						l_message.append_string ("): target%N")
					end
					nb := l_source_stack.count
					from i := 1 until i > nb loop
						l_source := l_source_stack.i_th (i)
						if not l_source.is_null_attachment then
							l_message.append_string ("%T%T%Tclass ")
							l_message.append_string (l_source.current_type.base_type.to_text)
							l_message.append_string (" (")
							l_class_impl := l_source.current_feature.static_feature.implementation_class
							if l_source.current_type.base_type.direct_base_class (universe) /= l_class_impl then
								l_message.append_string (l_class_impl.name.name)
								l_message.append_character (',')
							end
							l_position := l_source.position
							l_message.append_string (l_position.line.out)
							l_message.append_character (',')
							l_message.append_string (l_position.column.out)
							l_message.append_character (')')
							l_message.append_character (':')
							l_message.append_character (' ')
							l_message.append_string (l_source.description)
							l_message.append_character ('%N')
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
				l_message.append_string ("%TArgument type: '")
				l_message.append_string (an_actual_type.base_type.to_text)
				l_message.append_string ("'%N")
				l_source := an_actual_source
				l_source.set_visited (True)
				l_visited_sources.force_last (l_source)
				l_type_set := l_source.source_type_set
			until
				l_type_set = Void
			loop
				if l_type_set = an_actual_type then
					j := j + 1
					l_message.append_string ("%T%TAttachment stack #")
					l_message.append_string (j.out)
					l_message.append_character ('%N')
					nb := l_source_stack.count
					from i := 0 until i > nb loop
						if i = 0 then
							l_source := an_actual_source
						else
							l_source := l_source_stack.i_th (i)
						end
						if not l_source.is_null_attachment then
							l_message.append_string ("%T%T%Tclass ")
							l_message.append_string (l_source.current_type.base_type.to_text)
							l_message.append_string (" (")
							l_class_impl := l_source.current_feature.static_feature.implementation_class
							if l_source.current_type.base_type.direct_base_class (universe) /= l_class_impl then
								l_message.append_string (l_class_impl.name.name)
								l_message.append_character (',')
							end
							l_position := l_source.position
							l_message.append_string (l_position.line.out)
							l_message.append_character (',')
							l_message.append_string (l_position.column.out)
							l_message.append_character (')')
							l_message.append_character (':')
							l_message.append_character (' ')
							l_message.append_string (l_source.description)
							l_message.append_character ('%N')
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
			end
			nb := l_visited_sources.count
			from i := 1 until i > nb loop
				l_visited_sources.item (i).set_visited (False)
				i := i + 1
			end
			l_visited_sources.wipe_out
			l_source_stack.wipe_out
			set_fatal_error
			error_handler.report_error_message (l_message)
			STRING_.wipe_out (l_message)
		end

	shared_visited_sources: DS_ARRAYED_LIST [ET_DYNAMIC_ATTACHMENT] is
			-- Shared visited sources (used in `report_catcall_error')
		once
			create Result.make (20)
		ensure
			shared_visited_sources_not_void: Result /= Void
		end

	shared_source_stack: DS_ARRAYED_STACK [ET_DYNAMIC_ATTACHMENT] is
			-- Shared stack of sources (used in `report_catcall_error')
		once
			create Result.make (20)
		ensure
			shared_source_stack_not_void: Result /= Void
		end

feature {NONE} -- Event handling

	report_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Report that an assignment instruction has been processed.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ASSIGNMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_source_type_set := dynamic_type_set (an_instruction.source)
				l_target_type_set := dynamic_type_set (an_instruction.target)
				if l_source_type_set = Void or l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the source
						-- and the target should be known at this stage.
					set_fatal_error
					error_handler.report_gibaa_error
				elseif not l_target_type_set.is_expanded then
					create l_attachment.make (l_source_type_set, an_instruction, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.put_source (l_attachment, current_system)
				end
			end
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Report that an assignment attempt instruction has been processed.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
		do
			if current_type = current_dynamic_type.base_type then
				l_source_type_set := dynamic_type_set (an_instruction.source)
				l_target_type_set := dynamic_type_set (an_instruction.target)
				if l_source_type_set = Void or l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the source
						-- and the target should be known at this stage.
					set_fatal_error
					error_handler.report_gibab_error
				elseif not l_target_type_set.is_expanded then
					create l_assignment_attempt.make (l_source_type_set, an_instruction, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.put_source (l_assignment_attempt, current_system)
				end
			end
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_NAMED_TYPE;
		a_procedure: ET_FEATURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression has been processed.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_feature (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				if an_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_procedure.dynamic_type_sets
					nb := an_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibae_error
					else
						from i := 1 until i > nb loop
							l_actual := an_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibad_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
				set_dynamic_type_set (l_dynamic_creation_type, an_expression)
			end
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_NAMED_TYPE; a_procedure: ET_FEATURE) is
			-- Report that a creation instruction has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_creation: ET_DYNAMIC_CREATION_INSTRUCTION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_feature (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_procedure.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibag_error
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibaf_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
				l_target_type_set := dynamic_type_set (an_instruction.target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_gibah_error
				elseif not l_target_type_set.is_expanded then
					create l_creation.make (l_dynamic_creation_type, an_instruction, current_dynamic_feature, current_dynamic_type)
					l_target_type_set.put_source (l_creation, current_system)
				end
			end
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE) is
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_expression: ET_EXPRESSION
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_item_attachment: ET_DYNAMIC_MANIFEST_ARRAY_ITEM_ATTACHMENT
			l_area_attachment: ET_DYNAMIC_MANIFEST_ARRAY_AREA_ATTACHMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, current_type)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
					-- Make sure that type SPECIAL[XXX] (used in feature 'area') is marked as alive.
					-- Feature 'area' should be the first in the list of features.
				l_features := l_type.features
				if l_features.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
				else
					l_area_type_set := l_features.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
						set_fatal_error
					else
						l_special_type ?= l_area_type_set.static_type
						if l_special_type = Void then
								-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
							set_fatal_error
						else
							l_special_type.set_alive
							if not l_area_type_set.is_expanded then
								create l_area_attachment.make (l_special_type, an_expression, current_dynamic_feature, current_dynamic_type)
								l_area_type_set.put_source (l_area_attachment, current_system)
							end
							l_item_type_set := l_special_type.item_type_set
							if not l_item_type_set.is_expanded then
								nb := an_expression.count
								from i := 1 until i > nb loop
									l_expression := an_expression.expression (i)
									l_dynamic_type_set := dynamic_type_set (l_expression)
									if l_dynamic_type_set = Void then
											-- Internal error: the dynamic type set of the expressions
											-- in the manifest array should be known at this stage.
										set_fatal_error
										error_handler.report_gibcf_error
									else
										create l_item_attachment.make (l_dynamic_type_set, l_expression, current_dynamic_feature, current_dynamic_type)
										l_item_type_set.put_source (l_item_attachment, current_system)
									end
									i := i + 1
								end
							end
						end
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
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			i, nb: INTEGER
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_expression: ET_EXPRESSION
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_MANIFEST_TUPLE_ITEM_ATTACHMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.dynamic_type (a_type, current_type)
				l_type.set_alive
				set_dynamic_type_set (l_type, an_expression)
				l_tuple_type ?= l_type
				if l_tuple_type = Void then
						-- Internal error: the type of a manifest tuple should be a tuple type.
					set_fatal_error
					error_handler.report_gibfz_error
				else
					l_item_type_sets := l_tuple_type.item_type_sets
					nb := an_expression.count
					if l_item_type_sets.count /= nb then
							-- Internal error: the tuple type of a manifest tuple should
							-- have the proper number of generic parameters.
						set_fatal_error
						error_handler.report_gibce_error
					else
						from i := 1 until i > nb loop
							l_expression := an_expression.expression (i)
							l_dynamic_type_set := dynamic_type_set (l_expression)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type set of the expressions
									-- in the manifest tuple should be known at this stage.
								set_fatal_error
								error_handler.report_gibex_error
							else
								l_item_type_set := l_item_type_sets.item (i)
								if not l_item_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_expression, current_dynamic_feature, current_dynamic_type)
									l_item_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_feature' is the precursor feature.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_parent_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_query := current_dynamic_feature.dynamic_precursor (a_feature, l_parent_type, current_system)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_query.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibat_error
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibas_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
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
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_parent_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_parent_type := current_system.dynamic_type (a_parent_type, current_type)
				l_procedure := current_dynamic_feature.dynamic_precursor (a_feature, l_parent_type, current_system)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_procedure.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibaw_error
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibav_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	report_qualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_agent: ET_DYNAMIC_QUALIFIED_AGENT
			l_dynamic_call: ET_DYNAMIC_QUALIFIED_CALL
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
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_agent_type ?= l_dynamic_type
				if l_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_gibgi_error
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
						error_handler.report_gibgn_error
					else
						l_dynamic_feature := l_target_type_set.static_type.dynamic_feature (a_feature, current_system)
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
								error_handler.report_gibgj_error
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
											error_handler.report_gibgk_error
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
									error_handler.report_gibgm_error
								end
							end
						end
						create l_dynamic_call.make (an_expression, l_target_type_set, current_dynamic_feature, current_dynamic_type)
						l_result_type_set := l_agent_type.result_type_set
						if l_result_type_set /= Void then
							if not l_result_type_set.is_expanded then
								l_dynamic_type_set := new_dynamic_type_set (l_result_type_set.static_type)
								l_dynamic_call.set_result_type_set (l_dynamic_type_set)
								create l_result_attachment.make (l_dynamic_type_set, an_expression.name, current_dynamic_feature, current_dynamic_type)
								l_result_type_set.put_source (l_result_attachment, current_system)
							else
								l_dynamic_call.set_result_type_set (l_result_type_set)
							end
						end
						create l_dynamic_agent.make (an_expression, l_agent_type, l_dynamic_call, current_dynamic_feature, current_dynamic_type)
						dynamic_qualified_agents.force_last (l_dynamic_agent)
					end
				end
			end
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call expression has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_query := l_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_static (True)
				l_dynamic_type.set_static (True)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_query.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibbi_error
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibbh_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
				l_dynamic_type_set := l_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibbj_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call instruction has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type := current_system.dynamic_type (a_type, current_type)
				l_procedure := l_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_static (True)
				l_dynamic_type.set_static (True)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_procedure.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibbl_error
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibbk_error
							else
								l_argument_type_set := l_argument_type_sets.item (i)
								if not l_argument_type_set.is_expanded then
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	report_string_constant (a_string: ET_MANIFEST_STRING) is
			-- Report that a string has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_TYPE
			l_attachment: ET_DYNAMIC_MANIFEST_STRING_AREA_ATTACHMENT
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
					-- Feature 'area' should be the first in the list of features.
				l_special_type := current_system.special_character_type
				l_special_type.set_alive
				l_features := l_type.features
				if l_features.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
				else
					l_area_type_set := l_features.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
						set_fatal_error
					elseif not l_area_type_set.is_expanded then
						create l_attachment.make (l_special_type, a_string, current_dynamic_feature, current_dynamic_type)
						l_area_type_set.put_source (l_attachment, current_system)
					end
				end
					-- Make sure that type CHARACTER (used as actual generic type
					-- of 'SPECIAL[CHARACTER]' in feature 'area') is marked as alive.
				current_system.character_type.set_alive
					-- Make sure that type INTEGER (used in attribute 'count') is marked as alive.
				current_system.integer_type.set_alive
			end
		end

	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_agent: ET_DYNAMIC_UNQUALIFIED_AGENT
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual_expression: ET_EXPRESSION
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			j, nb2: INTEGER
			l_actual_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
			l_routine_type: ET_DYNAMIC_ROUTINE_TYPE
			l_routine_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_no_manifest_tuple: BOOLEAN
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_dynamic_feature.set_regular (True)
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
				l_agent_type ?= l_dynamic_type
				if l_agent_type = Void then
						-- Internal error: the dynamic type of an agent should be an agent type.
					set_fatal_error
					error_handler.report_gibcm_error
				else
					l_result_type_set := l_agent_type.result_type_set
					if l_result_type_set /= Void then
						if not l_result_type_set.is_expanded then
							l_dynamic_type_set := l_dynamic_feature.result_type_set
							if l_dynamic_type_set = Void then
									-- Internal error: a FUNCTION should be an agent on a query.
								set_fatal_error
								error_handler.report_gibcn_error
							else
								create l_result_attachment.make (l_dynamic_type_set, an_expression.name, current_dynamic_feature, current_dynamic_type)
								l_result_type_set.put_source (l_result_attachment, current_system)
							end
						end
					end
					l_open_operand_type_sets := l_agent_type.open_operand_type_sets
					nb2 := l_open_operand_type_sets.count
					create l_dynamic_agent.make (an_expression, l_agent_type, l_dynamic_feature, current_dynamic_feature, current_dynamic_type)
					dynamic_unqualified_agents.force_last (l_dynamic_agent)
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
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
							error_handler.report_gibep_error
						else
							if (l_dynamic_feature.is_builtin_routine_call or l_dynamic_feature.is_builtin_function_item) and then current_dynamic_type.is_agent_type then
									-- This is something of the form:  'agent call ([...])' or 'agent item ([...])'
									-- Try to get the open operand type sets directly from the
									-- argument if it is a manifest tuple.
								l_routine_type ?= current_dynamic_type
								if l_routine_type = Void then
										-- Internal error: it has to be an agent type.
									set_fatal_error
									error_handler.report_gibhz_error
								else
									if nb /= 1 then
											-- Internal error: 'call' or 'item' should have exactly one argument.
										set_fatal_error
										error_handler.report_gibeo_error
									else
										l_actual := l_actuals.actual_argument (1)
										l_manifest_tuple ?= l_actual
										if l_manifest_tuple /= Void then
											l_routine_open_operand_type_sets := l_routine_type.open_operand_type_sets
											nb := l_routine_open_operand_type_sets.count
											if l_manifest_tuple.count < nb then
													-- Internal error: the actual argument conforms to the
													-- formal argument of 'call' or 'item', so there cannot
													-- be less items in the tuple.
												set_fatal_error
												error_handler.report_gibay_error
											else
												from i := 1 until i > nb loop
													l_argument_type_set := l_routine_open_operand_type_sets.item (i)
													if not l_argument_type_set.is_expanded then
														l_actual_expression := l_manifest_tuple.expression (i)
														l_dynamic_type_set := dynamic_type_set (l_actual_expression)
														if l_dynamic_type_set = Void then
																-- Internal error: the dynamic type sets of the actual
																-- arguments should be known at this stage.
															set_fatal_error
															error_handler.report_gibgc_error
														else
															create l_actual_attachment.make (l_dynamic_type_set, l_actual_expression, current_dynamic_feature, current_dynamic_type)
															l_argument_type_set.put_source (l_actual_attachment, current_system)
														end
													end
													i := i + 1
												end
											end
										else
											l_no_manifest_tuple := True
										end
									end
								end
							else
								l_no_manifest_tuple := True
							end
							if l_no_manifest_tuple then
								from i := 1 until i > nb loop
									l_actual := l_actuals.actual_argument (i)
									l_actual_expression ?= l_actual
									if l_actual_expression /= Void then
										l_argument_type_set := l_argument_type_sets.item (i)
										if not l_argument_type_set.is_expanded then
											l_dynamic_type_set := dynamic_type_set (l_actual_expression)
											if l_dynamic_type_set = Void then
													-- Internal error: the dynamic type sets of the actual
													-- arguments should be known at this stage.
												set_fatal_error
												error_handler.report_gibcq_error
											else
												create l_actual_attachment.make (l_dynamic_type_set, l_actual_expression, current_dynamic_feature, current_dynamic_type)
												l_argument_type_set.put_source (l_actual_attachment, current_system)
											end
										end
									else
											-- Open operand.
										j := j + 1
										if j > nb2 then
												-- Internal error: missing open operands.
											set_fatal_error
											error_handler.report_gibch_error
										else
											l_argument_type_set := l_argument_type_sets.item (i)
											if not l_argument_type_set.is_expanded then
												l_dynamic_type_set := l_open_operand_type_sets.item (j)
												set_dynamic_type_set (l_dynamic_type_set, l_actual)
												create l_actual_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
												l_argument_type_set.put_source (l_actual_attachment, current_system)
											end
										end
									end
									i := i + 1
								end
								if j < nb2 then
										-- Internal error: too many open operands.
									set_fatal_error
									error_handler.report_gibbm_error
								end
							end
						end
					end
				end
			end
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_feature: ET_FEATURE) is
			-- Report that an unqualified call expression has been processed.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_manifest_tuple: ET_MANIFEST_TUPLE
		do
			if current_type = current_dynamic_type.base_type then
				l_query := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_regular (True)
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_query.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibbp_error
					elseif l_query.is_builtin_function_item and then current_dynamic_type.is_agent_type then
							-- This is something of the form:  'item ([...])'
							-- Try to get the open operand type sets directly from the
							-- argument if it is a manifest tuple.
						l_agent_type ?= current_dynamic_type
						if l_agent_type = Void then
								-- Internal error: it has to be an agent type.
							set_fatal_error
								error_handler.report_gibgd_error
						else
							if nb /= 1 then
									-- Internal error: 'item' should have exactly one argument.
								set_fatal_error
								error_handler.report_gibge_error
							else
								l_actual := l_actuals.actual_argument (1)
								l_manifest_tuple ?= l_actual
								if l_manifest_tuple /= Void then
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- Internal error: the actual argument conforms to the
											-- formal argument of 'item', so there cannot be less
											-- items in the tuple.
										set_fatal_error
										error_handler.report_gibhr_error
									else
										from i := 1 until i > nb loop
											l_argument_type_set := l_open_operand_type_sets.item (i)
											if not l_argument_type_set.is_expanded then
												l_actual := l_manifest_tuple.expression (i)
												l_dynamic_type_set := dynamic_type_set (l_actual)
												if l_dynamic_type_set = Void then
														-- Internal error: the dynamic type sets of the actual
														-- arguments should be known at this stage.
													set_fatal_error
													error_handler.report_gibhs_error
												else
													create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
													l_argument_type_set.put_source (l_attachment, current_system)
												end
											end
											i := i + 1
										end
									end
								else
									l_argument_type_set := l_argument_type_sets.item (1)
									if not l_argument_type_set.is_expanded then
										l_dynamic_type_set := dynamic_type_set (l_actual)
										if l_dynamic_type_set = Void then
												-- Internal error: the dynamic type sets of the actual
												-- arguments should be known at this stage.
											set_fatal_error
												error_handler.report_gibht_error
										else
											create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
											l_argument_type_set.put_source (l_attachment, current_system)
										end
									end
								end
							end
						end
					else
						from i := 1 until i > nb loop
							l_argument_type_set := l_argument_type_sets.item (i)
							if not l_argument_type_set.is_expanded then
								l_actual := l_actuals.actual_argument (i)
								l_dynamic_type_set := dynamic_type_set (l_actual)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibbo_error
								else
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
				l_dynamic_type_set := l_query.result_type_set
				if l_dynamic_type_set = Void then
						-- Internal error: the result type set of a query cannot be void.
					set_fatal_error
					error_handler.report_gibbq_error
				else
					set_dynamic_type_set (l_dynamic_type_set, an_expression)
				end
			end
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_feature: ET_FEATURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_agent_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_manifest_tuple: ET_MANIFEST_TUPLE
		do
			if current_type = current_dynamic_type.base_type then
				l_procedure := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_regular (True)
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_type_sets := l_procedure.dynamic_type_sets
					nb := l_actuals.count
					if nb = 0 then
						-- Do nothing.
					elseif l_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibbs_error
					elseif l_procedure.is_builtin_routine_call and then current_dynamic_type.is_agent_type then
							-- This is something of the form:  'call ([...])'
							-- Try to get the open operand type sets directly from the
							-- argument if it is a manifest tuple.
						l_agent_type ?= current_dynamic_type
						if l_agent_type = Void then
								-- Internal error: it has to be an agent type.
							set_fatal_error
							error_handler.report_gibhu_error
						else
							if nb /= 1 then
									-- Internal error: 'call' should have exactly one argument.
								set_fatal_error
								error_handler.report_gibhv_error
							else
								l_actual := l_actuals.actual_argument (1)
								l_manifest_tuple ?= l_actual
								if l_manifest_tuple /= Void then
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- Internal error: the actual argument conforms to the
											-- formal argument of 'call', so there cannot be less
											-- items in the tuple.
										set_fatal_error
										error_handler.report_gibhw_error
									else
										from i := 1 until i > nb loop
											l_argument_type_set := l_open_operand_type_sets.item (i)
											if not l_argument_type_set.is_expanded then
												l_actual := l_manifest_tuple.expression (i)
												l_dynamic_type_set := dynamic_type_set (l_actual)
												if l_dynamic_type_set = Void then
														-- Internal error: the dynamic type sets of the actual
														-- arguments should be known at this stage.
													set_fatal_error
													error_handler.report_gibgf_error
												else
													create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
													l_argument_type_set.put_source (l_attachment, current_system)
												end
											end
											i := i + 1
										end
									end
								else
									l_argument_type_set := l_argument_type_sets.item (1)
									if not l_argument_type_set.is_expanded then
										l_dynamic_type_set := dynamic_type_set (l_actual)
										if l_dynamic_type_set = Void then
												-- Internal error: the dynamic type sets of the actual
												-- arguments should be known at this stage.
											set_fatal_error
											error_handler.report_gibgg_error
										else
											create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
											l_argument_type_set.put_source (l_attachment, current_system)
										end
									end
								end
							end
						end
					else
						from i := 1 until i > nb loop
							l_argument_type_set := l_argument_type_sets.item (i)
							if not l_argument_type_set.is_expanded then
								l_actual := l_actuals.actual_argument (i)
								l_dynamic_type_set := dynamic_type_set (l_actual)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibbr_error
								else
									create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
									l_argument_type_set.put_source (l_attachment, current_system)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

feature {NONE} -- Built-in features

	report_builtin_any_twin (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Report that built-in feature ANY.twin is being analyzed.
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
			l_copy_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				current_dynamic_feature.set_builtin_code (builtin_any_twin)
				l_result_type_set := current_dynamic_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it was already checked during parsing
						-- that the signature should be 'twin: like Current'.
					set_fatal_error
					error_handler.report_gibgo_error
				else
					if not l_result_type_set.is_expanded then
						create l_attachment.make (current_dynamic_type, current_dynamic_feature, current_dynamic_type)
						l_result_type_set.put_source (l_attachment, current_system)
					end
						-- Feature `copy' is called internally.
					l_copy_feature := current_class.seeded_feature (universe.copy_seed)
					if l_copy_feature = Void then
							-- Internal error: all classes should have a feature
							-- 'copy'. Otherwise we get an error when parsing
							-- class ANY if there is no such feature.
						set_fatal_error
						error_handler.report_gibgp_error
					else
						l_dynamic_feature := current_dynamic_type.dynamic_feature (l_copy_feature, current_system)
						l_dynamic_feature.set_regular (True)
						l_dynamic_type_sets := l_dynamic_feature.dynamic_type_sets
						if l_dynamic_type_sets.count >= 1 then
							l_dynamic_type_set := l_dynamic_type_sets.item (1)
							if not l_dynamic_type_set.is_expanded then
								create l_attachment.make (current_dynamic_type, current_dynamic_feature, current_dynamic_type)
								l_dynamic_type_set.put_source (l_attachment, current_system)
							end
						end
					end
				end
			end
		end

end
