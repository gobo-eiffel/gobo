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

	ET_DYNAMIC_TYPE_SET_BUILDER
		rename
			report_catcall_error as old_report_catcall_error
		redefine
			new_dynamic_type_set,
			build_dynamic_type_sets,
			build_tuple_item,
			build_tuple_put,
			propagate_call_type,
			check_catcall_target_validity,
			report_agent_open_operand,
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
			report_unqualified_call_instruction
		end

creation

	make

creation {ET_FEATURE_CHECKER}

	make_from_checker

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		do
			create {ET_DYNAMIC_PULL_TYPE_SET} Result.make (a_type)
		end

feature -- Generation

	build_dynamic_type_sets is
			-- Build dynamic type sets for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			k, nb3: INTEGER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_call: ET_DYNAMIC_CALL
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
						propagate_tuple_item_types (l_tuple_type.item_type_sets)
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
				nb := dynamic_calls.count
				from i := 1 until i > nb loop
					l_call := dynamic_calls.item (i)
					l_count := l_call.count
					propagate_call_types (l_call)
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
			dynamic_calls.wipe_out
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
			if l_result_type_set /= Void then
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
			l_attachment: ET_DYNAMIC_BUILTIN_ATTACHMENT
		do
			l_argument_type_sets := a_put_feature.dynamic_type_sets
			if l_argument_type_sets.count > 1 then
				l_argument_type_set := l_argument_type_sets.item (1)
				l_item_type_sets := a_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					create l_attachment.make (l_argument_type_set, a_put_feature, a_tuple_type)
					l_item_type_sets.item (i).put_source (l_attachment, current_system)
					i := i + 1
				end
			end
		end

feature {NONE} -- Generation

	propagate_tuple_item_types (an_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST) is
			-- Propagates types of items of Tuple types.
		require
			an_item_type_sets_not_void: an_item_type_sets /= Void
		local
			i, nb: INTEGER
			l_type_set: ET_DYNAMIC_TYPE_SET
			l_count: INTEGER
		do
			nb := an_item_type_sets.count
			from i := 1 until i > nb loop
				l_type_set := an_item_type_sets.item (i)
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

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		local
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_FEATURE_CALL
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_source_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
			l_result_attachment: ET_DYNAMIC_NULL_ATTACHMENT
			l_current_feature: ET_DYNAMIC_FEATURE
			l_current_type: ET_DYNAMIC_TYPE
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
					error_handler.report_gibbt_error
				else
					-- The error has already been reported somewhere else.
				end
			else
				l_current_feature := a_call.current_feature
				l_current_type := a_call.current_type
				l_dynamic_feature := a_type.dynamic_feature (l_feature, current_system)
				l_dynamic_feature.set_regular (True)
				l_actuals := l_static_call.arguments
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
							error_handler.report_gibbv_error
						else
							from i := 1 until i > nb loop
								l_actual := l_actuals.actual_argument (i)
								l_source_argument_type_set := l_current_feature.dynamic_type_set (l_actual)
								if l_source_argument_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									set_fatal_error
									error_handler.report_gibdw_error
								else
									create l_attachment.make (l_source_argument_type_set, l_actual, l_current_feature, l_current_type)
									l_target_argument_type_sets.item (i).put_source (l_attachment, current_system)
								end
								i := i + 1
							end
						end
					end
				end
				l_result_type_set := l_dynamic_feature.result_type_set
				if a_call.result_type_set /= Void then
					if l_result_type_set = Void then
							-- Internal error: it has already been checked somewhere else
							-- that the redeclaration of a query should be a query.
						set_fatal_error
						error_handler.report_gibbw_error
					else
						create l_result_attachment.make (l_result_type_set, l_current_feature, l_current_type)
						a_call.result_type_set.put_source (l_result_attachment, current_system)
					end
				elseif l_result_type_set /= Void then
						-- Internal error: it has already been checked somewhere else
						-- that the redeclaration of a procedure should be a procedure.
					set_fatal_error
					error_handler.report_gibbx_error
				end
			end
		end

feature {NONE} -- CAT-calls

	check_catcall_target_validity (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_CALL) is
			-- Check whether target type `a_type' introduces CAT-calls in `a_call'.
		local
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ACTUAL_ARGUMENTS
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
		an_actual_source: ET_DYNAMIC_ATTACHMENT; a_call: ET_DYNAMIC_CALL) is
			-- Report a CAT-call error in `a_call'. When the target is of type `a_target_type', we
			-- try to pass to the corresponding feature `a_dynamic_feature' an actual
			-- argument of type `an_actual_type' (coming from `an_actual_source')
			-- which does not conform to the type of the `arg'-th corresponding formal
			-- argument `a_formal_type'.
		require
			a_taarget_type_not_void: a_target_type /= Void
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
			i, nb: INTEGER
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
			l_message.append_string (a_call.position.line.out)
			l_message.append_character (',')
			l_message.append_string (a_call.position.column.out)
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
			l_message.append_string ("%TTarget type: '")
			l_message.append_string (a_target_type.base_type.to_text)
			l_message.append_string ("'%N")
			from
				l_type_set := a_call.target_type_set
			until
				l_type_set = Void
			loop
				from
					l_source := l_type_set.sources
					l_type_set := Void
				until
					l_source = Void
				loop
					if l_source.has_type (a_target_type) then
						if not l_source.is_null_attachment then
							l_message.append_string ("%T%T")
							from i := 1 until i > nb loop
								l_message.append_character ('.')
								i := i + 1
							end
							l_message.append_string ("class ")
							l_message.append_string (l_source.current_type.base_type.to_text)
							l_message.append_string (" (")
							l_class_impl := l_source.current_feature.static_feature.implementation_class
							if l_source.current_type.base_type.direct_base_class (universe) /= l_class_impl then
								l_message.append_string (l_class_impl.name.name)
								l_message.append_character (',')
							end
							l_message.append_string (l_source.position.line.out)
							l_message.append_character (',')
							l_message.append_string (l_source.position.column.out)
							l_message.append_character (')')
						end
						if not l_visited_sources.has (l_source) then
							if not l_source.is_null_attachment then
								l_message.append_character ('%N')
								nb := nb + 1
							end
							l_source_stack.force (l_source)
							l_visited_sources.force_last (l_source)
							l_type_set := l_source.source_type_set
								-- Jump out of the loop.
							l_source := Void
						else
							if not l_source.is_null_attachment then
								l_message.append_string (" -- already visited%N")
							end
							from
								l_source := Void
							until
								l_source_stack.is_empty or l_source /= Void
							loop
								l_source := l_source_stack.item
								l_source_stack.remove
								if not l_source.is_null_attachment then
									nb := nb - 1
								end
								l_source := l_source.next_attachment
							end
						end
					else
						from
							l_source := l_source.next_attachment
						until
							l_source_stack.is_empty or l_source /= Void
						loop
							l_source := l_source_stack.item
							l_source_stack.remove
							if not l_source.is_null_attachment then
								nb := nb - 1
							end
							l_source := l_source.next_attachment
						end
					end
				end
			end
			l_visited_sources.wipe_out
			l_source_stack.wipe_out
			nb := 0
			l_message.append_string ("%TArgument type: '")
			l_message.append_string (an_actual_type.base_type.to_text)
			l_message.append_string ("'%N")
			from
				l_source := an_actual_source
				l_visited_sources.force_last (l_source)
				l_source_stack.force (l_source)
				if not l_source.is_null_attachment then
					l_message.append_string ("%T%Tclass ")
					l_message.append_string (l_source.current_type.base_type.to_text)
					l_message.append_string (" (")
					l_class_impl := l_source.current_feature.static_feature.implementation_class
					if l_source.current_type.base_type.direct_base_class (universe) /= l_class_impl then
						l_message.append_string (l_class_impl.name.name)
						l_message.append_character (',')
					end
					l_message.append_string (l_source.position.line.out)
					l_message.append_character (',')
					l_message.append_string (l_source.position.column.out)
					l_message.append_string (")%N")
					nb := nb + 1
				end
				l_type_set := l_source.source_type_set
			until
				l_type_set = Void
			loop
				from
					l_source := l_type_set.sources
					l_type_set := Void
				until
					l_source = Void
				loop
					if l_source.has_type (an_actual_type) then
						if not l_source.is_null_attachment then
							l_message.append_string ("%T%T")
							from i := 1 until i > nb loop
								l_message.append_character ('.')
								i := i + 1
							end
							l_message.append_string ("class ")
							l_message.append_string (l_source.current_type.base_type.to_text)
							l_message.append_string (" (")
							l_class_impl := l_source.current_feature.static_feature.implementation_class
							if l_source.current_type.base_type.direct_base_class (universe) /= l_class_impl then
								l_message.append_string (l_class_impl.name.name)
								l_message.append_character (',')
							end
							l_message.append_string (l_source.position.line.out)
							l_message.append_character (',')
							l_message.append_string (l_source.position.column.out)
							l_message.append_character (')')
						end
						if not l_visited_sources.has (l_source) then
							if not l_source.is_null_attachment then
								l_message.append_character ('%N')
								nb := nb + 1
							end
							l_source_stack.force (l_source)
							l_visited_sources.force_last (l_source)
							l_type_set := l_source.source_type_set
								-- Jump out of the loop.
							l_source := Void
						else
							if not l_source.is_null_attachment then
								l_message.append_string (" -- already visited%N")
							end
							from
								l_source := Void
							until
								l_source_stack.is_empty or l_source /= Void
							loop
								l_source := l_source_stack.item
								l_source_stack.remove
								if not l_source.is_null_attachment then
									nb := nb - 1
								end
								l_source := l_source.next_attachment
							end
						end
					else
						from
							l_source := l_source.next_attachment
						until
							l_source_stack.is_empty or l_source /= Void
						loop
							l_source := l_source_stack.item
							l_source_stack.remove
							if not l_source.is_null_attachment then
								nb := nb - 1
							end
							l_source := l_source.next_attachment
						end
					end
				end
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
				else
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
				else
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
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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
				else
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
			l_item_attachment: ET_DYNAMIC_MANIFEST_ARRAY_ITEM
			l_area_attachment: ET_DYNAMIC_MANIFEST_ARRAY_AREA
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
							create l_area_attachment.make (l_special_type, an_expression, current_dynamic_feature, current_dynamic_type)
							l_area_type_set.put_source (l_area_attachment, current_system)
							l_item_type_set := l_special_type.item_type_set
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
			l_expression: ET_EXPRESSION
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_MANIFEST_TUPLE_ITEM
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
								create l_attachment.make (l_dynamic_type_set, l_expression, current_dynamic_feature, current_dynamic_type)
								l_item_type_sets.item (i).put_source (l_attachment, current_system)
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
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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
		do
			if current_type = current_dynamic_type.base_type then
-- TODO
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				set_dynamic_type_set (l_dynamic_type, an_expression)
			end
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call expression has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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

	report_static_call_instruction (an_instruction: ET_STATIC_FEATURE_CALL; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call instruction has been processed.
		local
			i, nb: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
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
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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
			l_attachment: ET_DYNAMIC_MANIFEST_STRING_AREA
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.string_type
				if a_string.index = 0 and string_index /= 0 then
					a_string.set_index (string_index)
				end
				l_type.set_alive
				set_dynamic_type_set (l_type, a_string)
				if string_index = 0 then
					string_index := a_string.index
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
					else
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
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_feature := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_dynamic_feature.set_regular (True)
-- TODO
				l_dynamic_type := current_system.dynamic_type (a_type, a_context)
				l_dynamic_type.set_alive
				set_dynamic_type_set (l_dynamic_type, an_expression)
			end
		end

	report_unqualified_call_expression (an_expression: ET_EXPRESSION; a_call: ET_FEATURE_CALL; a_feature: ET_FEATURE) is
			-- Report that an unqualified call expression has been processed.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_query := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_regular (True)
				l_actuals := a_call.arguments
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
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibbo_error
							else
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
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

	report_unqualified_call_instruction (a_call: ET_FEATURE_CALL; a_feature: ET_FEATURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_attachment: ET_DYNAMIC_ACTUAL_ARGUMENT
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_actual: ET_EXPRESSION
		do
			if current_type = current_dynamic_type.base_type then
				l_procedure := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_regular (True)
				l_actuals := a_call.arguments
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
					else
						from i := 1 until i > nb loop
							l_actual := l_actuals.actual_argument (i)
							l_dynamic_type_set := dynamic_type_set (l_actual)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_gibbr_error
							else
								create l_attachment.make (l_dynamic_type_set, l_actual, current_dynamic_feature, current_dynamic_type)
								l_argument_type_sets.item (i).put_source (l_attachment, current_system)
							end
							i := i + 1
						end
					end
				end
			end
		end

end
