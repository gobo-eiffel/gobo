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
		redefine
			make_from_checker, set_state,
			report_assignment,
			report_assignment_attempt,
			report_attribute_assignment_target,
			report_bit_constant,
			report_character_constant,
			report_creation_expression,
			report_current,
			report_local_assignment_target,
			report_local_variable_declaration,
			report_qualified_call,
			report_qualified_call_expression,
			report_qualified_call_instruction,
			report_result_assignment_target,
			report_unqualified_call_expression,
			report_unqualified_call_instruction
		end

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
			create dynamic_type_set_stack.make (10)
			create dynamic_call_stack.make (10)
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
				create actual_context.make_with_capacity (current_type, 10)
				create formal_context.make_with_capacity (current_type, 10)
				create instruction_context.make_with_capacity (current_type, 10)
				create expression_context.make_with_capacity (current_type, 10)
				create assertion_context.make_with_capacity (current_type, 10)
				create convert_actuals.make_with_capacity (1)
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

feature -- Generation

	build_dynamic_type_sets (a_feature: ET_DYNAMIC_FEATURE; a_current_dynamic_type: ET_DYNAMIC_TYPE) is
			-- Build dynamic type sets for `a_feature' in `a_current_dynamic_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_current_dynamic_type_not_void: a_current_dynamic_type /= Void
		local
			old_feature: ET_DYNAMIC_FEATURE
			old_type: ET_DYNAMIC_TYPE
		do
			old_feature := current_dynamic_feature
			current_dynamic_feature := a_feature
			old_type := current_dynamic_type
			current_dynamic_type := a_current_dynamic_type
			check_feature_validity (a_feature.static_feature, a_current_dynamic_type.base_type)
			a_feature.set_built (True)
			current_dynamic_feature := old_feature
			current_dynamic_type := old_type
			dynamic_type_set_stack.wipe_out
			dynamic_call_stack.wipe_out
		end

feature {NONE} -- Event handling

	report_assignment is
			-- Report that an assignment instruction has been processed.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				if dynamic_type_set_stack.count < 2 then
-- TODO: internal error
				else
					l_source_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					l_target_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					l_source_type_set.put_target (l_target_type_set, current_system)
				end
			end
		end

	report_assignment_attempt is
			-- Report that an assignment attempt instruction has been processed.
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
		do
			if current_type = current_dynamic_type.base_type then
				if dynamic_type_set_stack.count < 2 then
-- TODO: internal error
				else
					l_source_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					l_target_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					create l_dynamic_assignment_attempt.make (l_target_type_set)
					l_source_type_set.put_target (l_dynamic_assignment_attempt, current_system)
					current_dynamic_feature.put_assignment_attempt (l_dynamic_assignment_attempt)
				end
			end
		end

	report_attribute_assignment_target (an_attribute: ET_FEATURE) is
			-- Report that `an_attribute' has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_type.dynamic_feature (an_attribute, current_system).result_type
				if l_dynamic_type_set = Void then
-- TODO: internal error
				else
					dynamic_type_set_stack.force (l_dynamic_type_set)
				end
			end
		end

	report_bit_constant is
			-- Report that a bit constant has been processed.
		do
-- TODO: not supported.
		end

	report_character_constant (a_constant: CHARACTER) is
			-- Report that a character has been processed.
		local
			l_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_type := current_system.character_type
				l_type.set_alive (True)
				dynamic_type_set_stack.force (l_type)
			end
		end

	report_creation_expression (a_creation_type: ET_NAMED_TYPE; a_procedure: ET_FEATURE) is
			-- Report that a creation expression has been processed.
		local
			i, nb: INTEGER
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_creation_type: ET_DYNAMIC_TYPE
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_creation_type := current_system.dynamic_type (a_creation_type, current_type)
				l_procedure := l_dynamic_creation_type.dynamic_feature (a_procedure, current_system)
				l_procedure.set_creation (True)
				l_dynamic_creation_type.set_alive (True)
				l_argument_types := l_procedure.argument_types
				if l_argument_types /= Void then
					nb := l_argument_types.count
					if dynamic_type_set_stack.count < nb then
-- TODO: internal error
					else
						from i := nb until i < 1 loop
							l_dynamic_type_set := dynamic_type_set_stack.item
							dynamic_type_set_stack.remove
							l_dynamic_type_set.put_target (l_argument_types.item (i), current_system)
							i := i - 1
						end
					end
				end
				dynamic_type_set_stack.force (l_dynamic_creation_type)
			end
		end

	report_current is
			-- Report that the current entity has been processed.
		do
			if current_type = current_dynamic_type.base_type then
				dynamic_type_set_stack.force (current_dynamic_type)
			end
		end

	report_local_assignment_target (i: INTEGER) is
			-- Report that `i'-th local variable has been
			-- processed as target of an assignment (attempt).
		local
			l_local_types: ET_DYNAMIC_TYPE_SET_LIST
		do
			if current_type = current_dynamic_type.base_type then
				l_local_types := current_dynamic_feature.local_types
				if l_local_types = Void then
-- TODO: internal error.
				elseif i < 1 or i > l_local_types.count then
-- TODO: internal error.
				else
					dynamic_type_set_stack.force (l_local_types.item (i))
				end
			end
		end

	report_local_variable_declaration (i: INTEGER; a_type: ET_TYPE) is
			-- Report that the declaration of the `i'-th local variable
			-- of type `a_type' has been processed.
			-- Note: `a_type' is still viewed from the implementation class
			-- of `current_feature'. Its formal generic parameters need
			-- to be resolved in `current_class' before using it.
		local
			l_resolved_type: ET_TYPE
			l_local_types: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_NESTED_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_resolved_type := resolved_formal_parameters (a_type)
				if not has_fatal_error then
					l_local_types := current_dynamic_feature.local_types
					if l_local_types = Void then
-- TODO: internal error
					elseif i < 1 or i > l_local_types.count then
-- TODO: internal error
					else
						l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type)
						create l_dynamic_type_set.make (l_dynamic_type)
						l_local_types.put (l_dynamic_type_set, i)
					end
				end
			end
		end

	report_qualified_call is
			-- Report that a qualified call will be processed.
		local
			l_call: ET_DYNAMIC_CALL
		do
			create l_call.make (current_dynamic_type, dummy_feature, current_system)
			current_dynamic_feature.put_feature_call (l_call)
			dynamic_call_stack.force (l_call)
		end

	report_qualified_call_expression (a_feature: ET_FEATURE) is
			-- Report that a qualified call expression has been processed.
		local
			i, nb: INTEGER
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_call: ET_DYNAMIC_CALL
		do
			if current_type = current_dynamic_type.base_type then
				if dynamic_call_stack.is_empty then
-- TODO: internal error
				elseif dynamic_type_set_stack.is_empty then
-- TODO: internal error
				else
					l_call := dynamic_call_stack.item
					dynamic_call_stack.remove
					l_dynamic_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					l_call.reset (l_dynamic_type_set.static_type, a_feature, current_system)
					l_dynamic_type_set.put_target (l_call, current_system)
					l_argument_types := l_call.argument_types
					if l_argument_types /= Void then
						nb := l_argument_types.count
						if dynamic_type_set_stack.count < nb then
-- TODO: internal error
						else
							from i := nb until i < 1 loop
								l_dynamic_type_set := dynamic_type_set_stack.item
								dynamic_type_set_stack.remove
								l_dynamic_type_set.put_target (l_argument_types.item (i), current_system)
								i := i - 1
							end
						end
					end
					l_dynamic_type_set := l_call.result_type
					if l_dynamic_type_set = Void then
-- TODO: internal error
					else
						dynamic_type_set_stack.force (l_dynamic_type_set)
					end
				end
			end
		end

	report_qualified_call_instruction (a_feature: ET_FEATURE) is
			-- Report that a qualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_call: ET_DYNAMIC_CALL
		do
			if current_type = current_dynamic_type.base_type then
				if dynamic_call_stack.is_empty then
-- TODO: internal error
				elseif dynamic_type_set_stack.is_empty then
-- TODO: internal error
				else
					l_call := dynamic_call_stack.item
					dynamic_call_stack.remove
					l_dynamic_type_set := dynamic_type_set_stack.item
					dynamic_type_set_stack.remove
					l_call.reset (l_dynamic_type_set.static_type, a_feature, current_system)
					l_dynamic_type_set.put_target (l_call, current_system)
					l_argument_types := l_call.argument_types
					if l_argument_types /= Void then
						nb := l_argument_types.count
						if dynamic_type_set_stack.count < nb then
-- TODO: internal error
						else
							from i := nb until i < 1 loop
								l_dynamic_type_set := dynamic_type_set_stack.item
								dynamic_type_set_stack.remove
								l_dynamic_type_set.put_target (l_argument_types.item (i), current_system)
								i := i - 1
							end
						end
					end
				end
			end
		end

	report_result_assignment_target is
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_dynamic_type_set := current_dynamic_feature.result_type
				if l_dynamic_type_set = Void then
-- TODO: internal error
				else
					dynamic_type_set_stack.force (l_dynamic_type_set)
				end
			end
		end

	report_unqualified_call_expression (a_feature: ET_FEATURE) is
			-- Report that an unqualified call expression has been processed.
		local
			i, nb: INTEGER
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_query := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_query.set_regular (True)
				l_argument_types := l_query.argument_types
				if l_argument_types /= Void then
					nb := l_argument_types.count
					if dynamic_type_set_stack.count < nb then
-- TODO: internal error
					else
						from i := nb until i < 1 loop
							l_dynamic_type_set := dynamic_type_set_stack.item
							dynamic_type_set_stack.remove
							l_dynamic_type_set.put_target (l_argument_types.item (i), current_system)
							i := i - 1
						end
					end
				end
				l_dynamic_type_set := l_query.result_type
				if l_dynamic_type_set = Void then
-- TODO: internal error
				else
					dynamic_type_set_stack.force (l_dynamic_type_set)
				end
			end
		end

	report_unqualified_call_instruction (a_feature: ET_FEATURE) is
			-- Report that an unqualified call instruction has been processed.
		local
			i, nb: INTEGER
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if current_type = current_dynamic_type.base_type then
				l_procedure := current_dynamic_type.dynamic_feature (a_feature, current_system)
				l_procedure.set_regular (True)
				l_argument_types := l_procedure.argument_types
				if l_argument_types /= Void then
					nb := l_argument_types.count
					if dynamic_type_set_stack.count < nb then
-- TODO: internal error
					else
						from i := nb until i < 1 loop
							l_dynamic_type_set := dynamic_type_set_stack.item
							dynamic_type_set_stack.remove
							l_dynamic_type_set.put_target (l_argument_types.item (i), current_system)
							i := i - 1
						end
					end
				end
			end
		end

feature {ET_FEATURE_CHECKER} -- Access

	current_dynamic_type: ET_DYNAMIC_TYPE
			-- Target type of `current_dynamic_feature'

	current_dynamic_feature: ET_DYNAMIC_FEATURE
			-- Feature whose dynamic type sets are being built

feature {ET_FEATURE_CHECKER} -- Status report

	set_state (other: like Current) is
			-- Set current state with state of `other'.
		do
			precursor (other)
			current_dynamic_type := other.current_dynamic_type
			current_dynamic_feature := other.current_dynamic_feature
		ensure then
			current_dynamic_type_set: current_dynamic_type = other.current_dynamic_type
			current_dynamic_feature_set: current_dynamic_feature = other.current_dynamic_feature
		end

feature {NONE} -- Implementation

	dynamic_type_set_stack: DS_ARRAYED_STACK [ET_DYNAMIC_TYPE_SET]
			-- Dynamic type set stack

	dynamic_call_stack: DS_ARRAYED_STACK [ET_DYNAMIC_CALL]
			-- Dynamic call stack

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

	dynamic_type_set_stack_not_void: dynamic_type_set_stack /= Void
	no_void_dynamic_type_set: not dynamic_type_set_stack.has (Void)
	dynamic_call_stack_not_void: dynamic_call_stack /= Void
	no_void_dynamic_call: not dynamic_call_stack.has (Void)
	current_dynamic_type_not_void: current_dynamic_type /= Void
	current_dynamic_feature_not_void: current_dynamic_feature /= Void
	current_system_not_void: current_system /= Void

end
