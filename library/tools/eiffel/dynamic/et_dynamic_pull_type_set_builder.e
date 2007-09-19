indexing

	description:

		"Eiffel dynamic type set builders where types are pulled from subsets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "MIT License"
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
			report_agent_qualified_query_call,
			report_manifest_array,
			report_manifest_tuple,
			report_string_constant,
			propagate_argument_dynamic_types,
			propagate_argument_operand_dynamic_types,
			propagate_assignment_dynamic_types,
			propagate_assignment_attempt_dynamic_types,
			propagate_builtin_argument_dynamic_types,
			propagate_builtin_result_dynamic_types,
			propagate_call_agent_result_dynamic_types,
			propagate_creation_dynamic_type,
			propagate_inline_agent_result_dynamic_types,
			propagate_like_argument_dynamic_types,
			propagate_tuple_label_setter_dynamic_types
		end

create

	make

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		do
			if a_type.is_expanded and then not a_type.is_generic then
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
			l_procedure_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_query_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_target: ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
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
					l_tuple_type ?= l_type
					if l_tuple_type /= Void then
						propagate_types (l_tuple_type.item_type_sets)
					else
						l_agent_type ?= l_type
						if l_agent_type /= Void then
							propagate_types (l_agent_type.open_operand_type_sets)
						end
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
						l_target.propagate_types (current_system)
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
					i := i + 1
				end
			end
			check_catcall_validity
			object_id_dynamic_type_set := old_object_id_dynamic_type_set
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
							error_handler.report_giaaa_error
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
							error_handler.report_giaaa_error
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
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ARGUMENT_OPERANDS
			l_current_feature: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			j, nb2: INTEGER
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type: ET_DYNAMIC_TYPE
			l_source: ET_DYNAMIC_ATTACHMENT
		do
			l_seed := a_call.static_call.name.seed
			l_dynamic_feature := a_call.seeded_dynamic_feature (l_seed, a_type, current_system)
			if l_dynamic_feature = Void then
					-- Internal error: there should be a feature with seed
					-- `l_seed' in all descendants of `target_type.static_type'.
				set_fatal_error
				error_handler.report_giaaa_error
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
							error_handler.report_giaaa_error
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
									error_handler.report_giaaa_error
								else
									nb2 := l_source_type_set.count
									from j := 1 until j > nb2 loop
										l_source_type := l_source_type_set.dynamic_type (j)
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
						l_message.append_string (l_class_impl.upper_name)
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
								l_message.append_string (l_class_impl.upper_name)
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
				if j >= 10 then
						-- Report no more than 10 entries in the
						-- attachment stack, otherwise `l_message'
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
								l_message.append_string (l_class_impl.upper_name)
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
				if j >= 10 then
						-- Report no more than 10 entries in the
						-- attachment stack, otherwise `l_message'
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
			if catcall_mode then
					-- CAT-calls are considered as fatal errors.
				set_fatal_error
			end
			error_handler.report_catcall_error (l_message)
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

	report_agent_qualified_query_call (an_expression: ET_CALL_AGENT; a_target_type_set: ET_DYNAMIC_TYPE_SET; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
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
				a_target_type_set.static_type.put_query_call (l_dynamic_query_call)
				create l_result_attachment.make (l_result_type_set, an_expression, current_dynamic_feature, current_dynamic_type)
				l_result_type_set.put_source (l_result_attachment, current_system)
			else
				create l_dynamic_query_call.make (an_expression, a_target_type_set, l_result_type_set, current_dynamic_feature, current_dynamic_type)
				a_target_type_set.static_type.put_query_call (l_dynamic_query_call)
			end
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE) is
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_queries: ET_DYNAMIC_FEATURE_LIST
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
				l_queries := l_type.queries
				if l_queries.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
-- TODO: report internal error.
				else
					l_area_type_set := l_queries.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
						set_fatal_error
-- TODO: report internal error.
					else
						l_special_type ?= l_area_type_set.static_type
						if l_special_type = Void then
								-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
							set_fatal_error
-- TODO: report internal error.
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
										error_handler.report_giaaa_error
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
									l_item_type_set.put_source (l_attachment, current_system)
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
			l_queries: ET_DYNAMIC_FEATURE_LIST
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
				l_queries := l_type.queries
				if l_queries.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
				else
					l_area_type_set := l_queries.item (1).result_type_set
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

feature {NONE} -- Implementation

	propagate_argument_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set `a_formal_type_set' of the
			-- corresponding formal argument.
		local
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
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
				a_formal_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_argument_operand_dynamic_types (an_actual: ET_ARGUMENT_OPERAND; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of actual argument `an_actual'
			-- to the dynamic type set of the corresponding formal
			-- argument at index `a_formal' in `a_callee'.
		local
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
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
				l_formal_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_assignment_dynamic_types (an_assignment: ET_ASSIGNMENT) is
			-- Propagate dynamic types of the source of `an_assignment'
			-- to the dynamic type set of the target of `an_assignment'.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
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
				l_target_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_assignment_attempt_dynamic_types (an_assignment_attempt: ET_ASSIGNMENT_ATTEMPT) is
			-- Propagate dynamic types of the source of `an_assignment_attempt'
			-- to the dynamic type set of the target of `an_assignment_attempt'.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
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
				l_target_type_set.put_source (l_assignment_attempt, current_system)
			end
		end

	propagate_builtin_argument_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_formal: INTEGER; a_callee: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the formal argument at index `a_formal' in `a_callee' when involved
			-- in built-in feature `current_dynamic_feature'.
		local
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_formal_type_set := a_callee.argument_type_set (a_formal)
			if l_formal_type_set = Void then
					-- Internal error: it has already been checked somewhere else
					-- that there was the same number of actual and formal arguments.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not l_formal_type_set.is_expanded then
				create l_attachment.make (a_source_type_set, current_dynamic_feature, current_dynamic_type)
				l_formal_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_builtin_result_dynamic_types (a_source_type_set: ET_DYNAMIC_TYPE_SET; a_query: ET_DYNAMIC_FEATURE) is
			-- Propagate dynamic types of `a_source_type_set' to the dynamic type set
			-- of the result of the built-in feature `a_query'.
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_result_type_set := a_query.result_type_set
			if l_result_type_set = Void then
					-- Internal error: it is expected that `a_query' is a query.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if not l_result_type_set.is_expanded then
					create l_attachment.make (a_source_type_set, current_dynamic_feature, current_dynamic_type)
					l_result_type_set.put_source (l_attachment, current_system)
				end
			end
		end

	propagate_call_agent_result_dynamic_types (an_agent: ET_CALL_AGENT; a_query: ET_DYNAMIC_FEATURE; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the result of `a_query' to the dynamic type set
			-- `a_result_type_set' of the result of type of `an_agent' (probably a FUNCTION
			-- or a PREDICATE).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_result_attachment: ET_DYNAMIC_AGENT_RESULT_ATTACHMENT
		do
			l_dynamic_type_set := a_query.result_type_set
			if l_dynamic_type_set = Void then
					-- Internal error: a FUNCTION or a PREDICATE should be an agent on a query.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not a_result_type_set.is_expanded then
				create l_result_attachment.make (l_dynamic_type_set, an_agent, current_dynamic_feature, current_dynamic_type)
				a_result_type_set.put_source (l_result_attachment, current_system)
			end
		end

	propagate_creation_dynamic_type (a_creation_type: ET_DYNAMIC_TYPE; a_creation: ET_CREATION_INSTRUCTION) is
			-- Propagate the creation type `a_creation_type' of `a_creation'
			-- to the dynamic type set of the target of `a_creation'.
		local
			l_attachment: ET_DYNAMIC_CREATION_INSTRUCTION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_target_type_set := dynamic_type_set (a_creation.target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the
					-- target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not l_target_type_set.is_expanded then
				create l_attachment.make (a_creation_type, a_creation, current_dynamic_feature, current_dynamic_type)
				l_target_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_inline_agent_result_dynamic_types (an_agent: ET_INLINE_AGENT; a_result_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the result of the associated feature of `an_agent'
			-- to the dynamic type set `a_result_type_set' of the result of type of `an_agent'
			-- (probably a FUNCTION or a PREDICATE).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_implicit_result: ET_RESULT
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
					a_result_type_set.put_source (l_result_attachment, current_system)
				end
			end
		end

	propagate_like_argument_dynamic_types (a_call: ET_FEATURE_CALL_EXPRESSION; a_formal_type_set, an_actual_type_set: ET_DYNAMIC_TYPE_SET) is
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
				an_actual_type_set.put_source (l_attachment, current_system)
			end
		end

	propagate_tuple_label_setter_dynamic_types (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate dynamic types of the source of `an_assigner' to the dynamic
			-- type set `a_target_type_set' of the corresponding tuple label.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_TUPLE_LABEL_SETTER
		do
			l_source_type_set := dynamic_type_set (an_assigner.source)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type sets of the source
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not a_target_type_set.is_expanded then
				create l_attachment.make (l_source_type_set, an_assigner, current_dynamic_feature, current_dynamic_type)
				a_target_type_set.put_source (l_attachment, current_system)
			end
		end

end
