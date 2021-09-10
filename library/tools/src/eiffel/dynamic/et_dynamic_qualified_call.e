note

	description:

		"Eiffel qualified calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_QUALIFIED_CALL

inherit

	ET_DYNAMIC_TARGET

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Access

	static_call: ET_CALL_COMPONENT
			-- Static call

	static_feature: detachable ET_FEATURE
			-- Static feature of the call;
			-- Void if no such feature found
		deferred
		end

	dynamic_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM): detachable ET_DYNAMIC_FEATURE
			-- Run-time feature in `a_type' corresponding to current call;
			-- Void if no such feature
		require
			not_tuple_label: not is_tuple_label
			a_type_not_void: a_type /= Void
			a_type_valid: target_type_set.has_type (a_type)
			a_system_not_void: a_system /= Void
		deferred
		end

	target_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of target

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature where the call appears

	current_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION
			-- Position of call
		do
			Result := static_call.position
		ensure
			position_not_void: Result /= Void
		end

feature -- Status report

	is_tuple_label: BOOLEAN
			-- Is current call a call to a Tuple label?
		do
			Result := static_call.is_tuple_label
		end

	is_call_agent: BOOLEAN
			-- Is current call a call agent?
		do
			Result := static_call.is_call_agent
		end

	is_generated: BOOLEAN
			-- Has code for current call been registered to be generated?

	force_result_boxing: BOOLEAN
			-- Should result be boxed even though the result static type is embedded?
			-- This is needed when the call is an attribute, tuple label or "SPECIAL"
			-- item, the call result type is embedded, and it is the target of another call.
			-- In that case we force the result type to be of reference type in order
			-- to force the boxing of the result so that the other call is applied on
			-- the result object itself and not on a copy of this object.
		do
			-- Result := False
		end

feature -- Status setting

	set_generated (b: BOOLEAN)
			-- Set `is_generated' to `b'.
		do
			is_generated := b
		ensure
			generated_set: is_generated = b
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `target_type_set' when
			-- `propagate_types' was last called

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		local
			l_dynamic_feature: like dynamic_feature
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			if not is_tuple_label then
				l_dynamic_feature := dynamic_feature (a_type, a_system)
				if l_dynamic_feature = Void then
					if a_type.conforms_to_primary_type (target_type_set.static_type.primary_type) then
							-- Internal error: there should be a feature with that seed
							-- in all descendants of `target_type_set.static_type'.
						l_builder := a_system.dynamic_type_set_builder
						l_builder.set_fatal_error
						l_builder.error_handler.report_giaaa_error
					else
						-- The error has already been reported somewhere else.
					end
				else
					put_type_with_feature (a_type, l_dynamic_feature, a_system)
				end
			else
				put_type_with_tuple_label (a_type, a_system.dynamic_type_set_builder)
			end
		end

	propagate_types (a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate types from `target_type_set' using `a_builder'.
		require
			a_builder_not_void: a_builder /= Void
		local
			l_count, old_count: INTEGER
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			old_count := count
			l_count := target_type_set.count
			if l_count /= old_count then
				nb := l_count - old_count
				count := l_count
				nb2 := target_type_set.count
				from j := nb2 until j < 1 loop
					a_builder.propagate_call_type (target_type_set.dynamic_type (j), Current)
					i := i + 1
					if i < nb then
						j := j - 1
					else
						j := 0 -- Jump out of the loop.
					end
				end
				if i /= nb then
						-- Internal error: the type counts are corrupted.
					a_builder.set_fatal_error
					a_builder.error_handler.report_giaaa_error
				end
			end
		end

	propagate_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate `a_type' from `target_type_set' using `a_builder'.
		require
			a_type_not_void: a_type /= Void
			a_builder_not_void: a_builder /= Void
		local
			l_dynamic_feature: like dynamic_feature
			l_system: ET_DYNAMIC_SYSTEM
		do
			if not is_tuple_label then
				l_system := a_builder.current_dynamic_system
				l_dynamic_feature := dynamic_feature (a_type, l_system)
				if l_dynamic_feature = Void then
					if a_type.conforms_to_primary_type (target_type_set.static_type.primary_type) then
							-- Internal error: there should be a feature with that seed
							-- in all descendants of `target_type_set.static_type'.
						a_builder.set_fatal_error
						a_builder.error_handler.report_giaaa_error
					else
						-- The error has already been reported somewhere else.
					end
				else
					propagate_type_with_feature (a_type, l_dynamic_feature, a_builder)
				end
			else
				put_type_with_tuple_label (a_type, a_builder)
			end
		end

feature {NONE} -- Implementation

	put_type_with_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' to current set.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_system_not_void: a_system /= Void
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_actual: ET_ARGUMENT_OPERAND
			l_source_argument_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_argument_type_set: detachable ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_manifest_tuple_type: ET_DYNAMIC_TYPE
			l_actual_manifest_tuple: detachable ET_MANIFEST_TUPLE
		do
			a_feature.set_regular (True)
			if attached static_call.arguments as l_actuals then
				nb := l_actuals.count
				if nb > 0 then
					if (a_feature.is_builtin_procedure_call or a_feature.is_builtin_function_item) and then a_type.is_agent_type then
							-- This is something of the form:  'my_agent.call ([...])' or 'my_agent.item ([...])'
							-- Try to get the open operand type sets directly from the
							-- argument if it is a manifest tuple.
						if not attached {ET_DYNAMIC_ROUTINE_TYPE} a_type as l_agent_type then
								-- Internal error: it has to be an agent type.
							l_builder := a_system.dynamic_type_set_builder
							l_builder.set_fatal_error
							l_builder.error_handler.report_giaaa_error
						else
							if nb /= 1 then
									-- Internal error: 'call' or 'item' should have exactly one argument.
								l_builder := a_system.dynamic_type_set_builder
								l_builder.set_fatal_error
								l_builder.error_handler.report_giaaa_error
							else
								l_actual := l_actuals.actual_argument (1)
								if attached {ET_MANIFEST_TUPLE} l_actual as l_manifest_tuple then
									l_actual_manifest_tuple := l_manifest_tuple
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- We don't get enough operands. This will be reported
											-- by the CAT-call checking.
										nb := l_manifest_tuple.count
									end
									from i := 1 until i > nb loop
										l_source_argument_type_set := current_feature.dynamic_type_set (l_manifest_tuple.expression (i))
										if l_source_argument_type_set = Void then
												-- Internal error: the dynamic type sets of the actual
												-- arguments should be known at this stage.
											l_builder := a_system.dynamic_type_set_builder
											l_builder.set_fatal_error
											l_builder.error_handler.report_giaaa_error
										else
											l_source_argument_type_set.put_target (l_open_operand_type_sets.item (i), a_system)
										end
										i := i + 1
									end
								end
								l_source_argument_type_set := current_feature.dynamic_type_set (l_actual)
								l_target_argument_type_set := a_feature.argument_type_set (1)
								if l_source_argument_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									l_builder := a_system.dynamic_type_set_builder
									l_builder.set_fatal_error
									l_builder.error_handler.report_giaaa_error
								elseif l_target_argument_type_set = Void then
										-- Internal error: it has already been checked somewhere else
										-- that there was the same number of formal arguments in
										-- feature redeclaration.
									l_builder := a_system.dynamic_type_set_builder
									l_builder.set_fatal_error
									l_builder.error_handler.report_giaaa_error
								elseif l_actual_manifest_tuple = Void then
									l_source_argument_type_set.put_target (l_target_argument_type_set, a_system)
								else
									l_manifest_tuple_type := l_source_argument_type_set.static_type
									if attached {ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET} l_target_argument_type_set as l_open_operand_type_set and then l_manifest_tuple_type.conforms_to_type (l_open_operand_type_set.static_type) then
										l_open_operand_type_set.put_type (l_manifest_tuple_type.primary_type)
									else
										l_source_argument_type_set.put_target (l_target_argument_type_set, a_system)
									end
								end
							end
						end
					else
						from i := 1 until i > nb loop
							l_source_argument_type_set := current_feature.dynamic_type_set (l_actuals.actual_argument (i))
							l_target_argument_type_set := a_feature.argument_type_set (i)
							if l_source_argument_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- arguments should be known at this stage.
								l_builder := a_system.dynamic_type_set_builder
								l_builder.set_fatal_error
								l_builder.error_handler.report_giaaa_error
							elseif l_target_argument_type_set = Void then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of formal arguments in
									-- feature redeclaration.
								l_builder := a_system.dynamic_type_set_builder
								l_builder.set_fatal_error
								l_builder.error_handler.report_giaaa_error
							else
								l_source_argument_type_set.put_target (l_target_argument_type_set, a_system)
							end
							i := i + 1
						end
					end
				end
			end
		end

	propagate_type_with_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate `a_type' from `target_type_set' using `a_builder'.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		require
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_builder_not_void: a_builder /= Void
		local
			l_source_argument_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_target_argument_type_set: detachable ET_DYNAMIC_TYPE_SET
			l_actuals: detachable ET_ARGUMENT_OPERANDS
			l_actual: ET_ARGUMENT_OPERAND
			i, nb: INTEGER
			l_attachment: ET_DYNAMIC_ARGUMENT_ATTACHMENT
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_manifest_tuple_type: ET_DYNAMIC_TYPE
			l_system: ET_DYNAMIC_SYSTEM
			l_actual_manifest_tuple: detachable ET_MANIFEST_TUPLE
		do
			l_system := a_builder.current_dynamic_system
			a_feature.set_regular (True)
			l_actuals := static_call.arguments
			if l_actuals /= Void then
				nb := l_actuals.count
				if nb > 0 then
					if (a_feature.is_builtin_procedure_call or a_feature.is_builtin_function_item) and then a_type.is_agent_type then
							-- This is something of the form:  'my_agent.call ([...])' or 'my_agent.item ([...])'
							-- Try to get the open operand type sets directly from the
							-- argument if it is a manifest tuple.
						if not attached {ET_DYNAMIC_ROUTINE_TYPE} a_type as l_agent_type then
								-- Internal error: it has to be an agent type.
							a_builder.set_fatal_error
							a_builder.error_handler.report_giaaa_error
						else
							if nb /= 1 then
									-- Internal error: 'call' or 'item' should have exactly one argument.
								a_builder.set_fatal_error
								a_builder.error_handler.report_giaaa_error
							else
								l_actual := l_actuals.actual_argument (1)
								if attached {ET_MANIFEST_TUPLE} l_actual as l_manifest_tuple then
									l_actual_manifest_tuple := l_manifest_tuple
									l_open_operand_type_sets := l_agent_type.open_operand_type_sets
									nb := l_open_operand_type_sets.count
									if l_manifest_tuple.count < nb then
											-- We don't get enough operands. This will be reported
											-- by the CAT-call checking.
										nb := l_manifest_tuple.count
									end
									from i := 1 until i > nb loop
										l_target_argument_type_set := l_open_operand_type_sets.item (i)
										if not l_target_argument_type_set.is_expanded then
											l_actual := l_manifest_tuple.expression (i)
											l_source_argument_type_set := current_feature.dynamic_type_set (l_actual)
											if l_source_argument_type_set = Void then
													-- Internal error: the dynamic type sets of the actual
													-- arguments should be known at this stage.
												a_builder.set_fatal_error
												a_builder.error_handler.report_giaaa_error
											else
												create l_attachment.make (l_source_argument_type_set, l_actual, current_feature, current_type)
												l_target_argument_type_set.put_source (l_attachment, l_system)
											end
										end
										i := i + 1
									end
								end
								l_target_argument_type_set := a_feature.argument_type_set (1)
								if l_target_argument_type_set = Void then
										-- Internal error: it has already been checked somewhere else
										-- that there was the same number of formal arguments in
										-- feature redeclaration.
									a_builder.set_fatal_error
									a_builder.error_handler.report_giaaa_error
								elseif not l_target_argument_type_set.is_expanded then
									l_source_argument_type_set := current_feature.dynamic_type_set (l_actual)
									if l_source_argument_type_set = Void then
											-- Internal error: the dynamic type sets of the actual
											-- arguments should be known at this stage.
										a_builder.set_fatal_error
										a_builder.error_handler.report_giaaa_error
									elseif l_actual_manifest_tuple = Void then
										create l_attachment.make (l_source_argument_type_set, l_actual, current_feature, current_type)
										l_target_argument_type_set.put_source (l_attachment, l_system)
									else
										l_manifest_tuple_type := l_source_argument_type_set.static_type
										if attached {ET_DYNAMIC_AGENT_OPERAND_PULL_TYPE_SET} l_target_argument_type_set as l_open_operand_type_set and then l_manifest_tuple_type.conforms_to_type (l_open_operand_type_set.static_type) then
											l_open_operand_type_set.put_type (l_manifest_tuple_type.primary_type)
										else
											create l_attachment.make (l_source_argument_type_set, l_actual, current_feature, current_type)
											l_target_argument_type_set.put_source (l_attachment, l_system)
										end
									end
								end
							end
						end
					else
						from i := 1 until i > nb loop
							l_target_argument_type_set := a_feature.argument_type_set (i)
							if l_target_argument_type_set = Void then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of formal arguments in
									-- feature redeclaration.
								a_builder.set_fatal_error
								a_builder.error_handler.report_giaaa_error
							elseif not l_target_argument_type_set.is_expanded then
								l_actual := l_actuals.actual_argument (i)
								l_source_argument_type_set := current_feature.dynamic_type_set (l_actual)
								if l_source_argument_type_set = Void then
										-- Internal error: the dynamic type sets of the actual
										-- arguments should be known at this stage.
									a_builder.set_fatal_error
									a_builder.error_handler.report_giaaa_error
								else
									create l_attachment.make (l_source_argument_type_set, l_actual, current_feature, current_type)
									l_target_argument_type_set.put_source (l_attachment, l_system)
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

feature {ET_DYNAMIC_TYPE_BUILDER} -- Implementation

	put_type_with_tuple_label (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Add `a_type' to current set when the current call is a call to a Tuple label.
		require
			tuple_label: is_tuple_label
			a_type_not_void: a_type /= Void
			a_builder_not_void: a_builder /= Void
		deferred
		end

feature -- Link

	next: detachable like Current
			-- Next call with the same target static type

	set_next (a_next: like next)
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

invariant

	static_call_not_void: static_call /= Void
	static_call_is_qualified: static_call.is_qualified_call
	target_type_set_not_void: target_type_set /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end
