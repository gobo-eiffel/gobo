note

	description:

		"Finders of callers of a given feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_FEATURE_CALLER_FINDER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_ITERATOR
		rename
			make as make_ast_processor
		redefine
			process_assigner,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bracket_expression,
			process_call_agent,
			process_class,
			process_constant_attribute,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_function,
			process_dotnet_procedure,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_feature_address,
			process_features,
			process_general_qualified_feature_call_expression,
			process_general_qualified_feature_call_instruction,
			process_infix_expression,
			process_invariants,
			process_like_feature,
			process_object_equality_expression,
			process_once_function,
			process_once_function_inline_agent,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesis_expression,
			process_parenthesis_instruction,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_static_call_expression,
			process_static_call_instruction,
			process_unique_attribute,
			process_unqualified_call_expression,
			process_unqualified_call_instruction
		end

	ET_SHARED_FEATURE_COMPARATOR_BY_NAME
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new feature caller finder.
		do
			precursor (a_system_processor)
			current_class := tokens.unknown_class
			callee_feature := tokens.unknown_feature
			callee_class := tokens.unknown_class
			current_standalone_closure := tokens.unknown_feature
			current_closure := tokens.unknown_feature
			create callee_seeds.make (100)
			create callee_classes.make (500)
			create expression_type_finder.make (a_system_processor)
			create internal_type_context.make_with_capacity (current_class, 100)
		end

feature -- Basic operations

	find_callers_in_class (a_callee_feature: ET_FEATURE; a_callee_class, a_class: ET_CLASS)
			-- Find callers in `a_class' of `a_callee_feature' from `a_callee_class'.
		require
			a_callee_feature_not_void: a_callee_feature /= Void
			a_callee_class_not_void: a_callee_class /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_callee_feature: like callee_feature
			l_old_callee_class: like callee_class
		do
			l_old_callee_feature := callee_feature
			callee_feature := a_callee_feature
			l_old_callee_class := callee_class
			callee_class := a_callee_class
			callee_seeds.wipe_out
			a_callee_feature.add_seeds_to_set (callee_seeds)
			callee_classes.wipe_out
			callee_classes.force (a_callee_class)
			callee_classes.append (a_callee_class.ancestor_classes)
			callee_classes.append (a_callee_class.descendants)
			a_class.process (Current)
			callee_seeds.wipe_out
			callee_classes.wipe_out
			callee_feature := l_old_callee_feature
			callee_class := l_old_callee_class
		end

	find_callers_in_system (a_callee_feature: ET_FEATURE; a_callee_class: ET_CLASS; a_system: ET_SYSTEM)
			-- Find callers in `a_system' of `a_callee_feature' from `a_callee_class'.
		require
			a_callee_feature_not_void: a_callee_feature /= Void
			a_callee_class_not_void: a_callee_class /= Void
			a_system_not_void: a_system /= Void
		local
			l_old_callee_feature: like callee_feature
			l_old_callee_class: like callee_class
		do
			l_old_callee_feature := callee_feature
			callee_feature := a_callee_feature
			l_old_callee_class := callee_class
			callee_class := a_callee_class
			callee_seeds.wipe_out
			a_callee_feature.add_seeds_to_set (callee_seeds)
			callee_classes.wipe_out
			callee_classes.force (a_callee_class)
			callee_classes.append (a_callee_class.ancestor_classes)
			callee_classes.append (a_callee_class.descendants)
			a_system.classes_do_recursive (agent {ET_CLASS}.process (Current))
			callee_seeds.wipe_out
			callee_classes.wipe_out
			callee_feature := l_old_callee_feature
			callee_class := l_old_callee_class
		end

	report_caller (a_call_name: ET_CALL_NAME; a_caller: ET_STANDALONE_CLOSURE)
			-- Report that `callee_feature' from `callee_class' is called
			-- in `a_caller` from `current_class` by `a_call_name`.
		require
			a_call_name_not_void: a_call_name /= Void
			a_caller_not_void: a_caller /= Void
		do
		end

feature {ET_AST_NODE} -- Processing

	process_assigner (a_assigner: ET_ASSIGNER)
			-- Process `a_assigner'.
		local
			l_feature_name: ET_FEATURE_NAME
			l_seed: INTEGER
		do
			l_feature_name := a_assigner.feature_name
			l_seed := l_feature_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
				report_caller (l_feature_name, current_standalone_closure)
			end
			precursor (a_assigner)
		end

	process_assigner_instruction (a_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_call_name: ET_IDENTIFIER
			l_old_call_name: ET_CALL_NAME
			l_position: ET_POSITION
			l_seed: INTEGER
		do
			l_old_call_name := a_instruction.name
			if not (attached {ET_IDENTIFIER} l_old_call_name as l_label and then l_label.is_tuple_label) then
				l_seed := l_old_call_name.seed
				if l_seed /= 0 and then callee_seeds.has (l_seed) then
					create l_call_name.make (a_instruction.assign_symbol.text)
					l_call_name.set_seed (l_seed)
					l_call_name.set_feature_name (True)
					l_position := a_instruction.assign_symbol.first_position
					l_call_name.set_position (l_position.line, l_position.column)
					a_instruction.set_name (l_call_name)
					process_qualified_feature_call (a_instruction)
					a_instruction.set_name (l_old_call_name)
				end
			end
			precursor (a_instruction)
		end

	process_assignment (a_instruction: ET_ASSIGNMENT)
			-- Process `a_instruction'.
		local
			l_seed: INTEGER
		do
			if attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then l_identifier.is_feature_name then
				l_seed := l_identifier.seed
				if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
					report_caller (l_identifier, current_standalone_closure)
				end
			end
			precursor (a_instruction)
		end

	process_assignment_attempt (a_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `a_instruction'.
		local
			l_seed: INTEGER
		do
			if attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then l_identifier.is_feature_name then
				l_seed := l_identifier.seed
				if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
					report_caller (l_identifier, current_standalone_closure)
				end
			end
			precursor (a_instruction)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_bang_instruction (a_instruction: ET_BANG_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			precursor (a_instruction)
		end

	process_bracket_expression (a_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_call_agent (a_expression: ET_CALL_AGENT)
			-- Process `a_expression'.
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			l_target: ET_AGENT_TARGET
			l_class: ET_CLASS
		do
			l_name := a_expression.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) then
				l_target := a_expression.target
				internal_type_context.reset (current_class)
				if attached {ET_AGENT_OPEN_TARGET} l_target as l_open_target then
					internal_type_context.put_last (l_open_target.type)
				elseif attached {ET_EXPRESSION} l_target as l_expression_target then
					expression_type_finder.find_expression_type_in_closure (l_expression_target, current_closure, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
				end
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if callee_classes.has (l_class) then
					report_caller (l_name, current_standalone_closure)
				end
			end
			precursor (a_expression)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_old_current_class: like current_class
		do
			l_old_current_class := current_class
			current_class := a_class
			process_features (a_class)
			if attached a_class.invariants as l_invariants then
				l_invariants.process (Current)
			end
			current_class := l_old_current_class
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_create_expression (a_expression: ET_CREATE_EXPRESSION)
			-- Process `a_expression`.
		do
			process_creation_expression (a_expression)
			precursor (a_expression)
		end

	process_create_instruction (a_instruction: ET_CREATE_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			precursor (a_instruction)
		end

	process_creation_expression (a_expression: ET_CREATION_EXPRESSION)
			-- Process `a_expression`.
		require
			a_expression_not_void: a_expression /= Void
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_seed: INTEGER
		do
			l_name := a_expression.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_expression.type)
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if callee_classes.has (l_class) then
					report_caller (l_name, current_standalone_closure)
				end
			end
		end

	process_creation_instruction (a_instruction: ET_CREATION_INSTRUCTION)
			-- Process `a_instruction`.
		require
			a_instruction_not_void: a_instruction /= Void
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_target: ET_WRITABLE
			l_seed: INTEGER
		do
			l_name := a_instruction.name
			l_target := a_instruction.target
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) then
				internal_type_context.reset (current_class)
				if attached a_instruction.type as l_type then
					internal_type_context.put_last (l_type)
				else
					expression_type_finder.find_expression_type_in_closure (l_target, current_closure, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
				end
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if callee_classes.has (l_class) then
					report_caller (l_name, current_standalone_closure)
				end
			end
			if attached {ET_IDENTIFIER} l_target as l_identifier and then l_identifier.is_feature_name then
				l_seed := l_identifier.seed
				if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
					report_caller (l_identifier, current_standalone_closure)
				end
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_do_function_inline_agent (a_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_do_procedure_inline_agent (a_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_external_function_inline_agent (a_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_external_procedure_inline_agent (a_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_feature_address (a_expression: ET_FEATURE_ADDRESS)
			-- Process `a_expression'.
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
		do
			l_name := a_expression.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
				report_caller (l_name, current_standalone_closure)
			end
			precursor (a_expression)
		end

	process_features (a_class: ET_CLASS)
			-- Process features of declared in `a_class',
			-- in alphabetical order.
		local
			l_features: DS_ARRAYED_LIST [ET_FEATURE]
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			i, nb: INTEGER
			l_sorter: DS_QUICK_SORTER [ET_FEATURE]
		do
			l_queries := a_class.queries
			l_procedures := a_class.procedures
			create l_features.make (l_queries.declared_count + l_procedures.declared_count)
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_features.put_last (l_query)
					-- Next query.
				from
				until
					l_query = Void or else l_query.synonym = Void
				loop
					i := i + 1
					if i <= nb then
						l_query := l_queries.item (i)
					else
						l_query := Void
					end
				end
				i := i + 1
			end
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				l_features.put_last (l_procedure)
					-- Next procedure.
				from
				until
					l_procedure = Void or else l_procedure.synonym = Void
				loop
					i := i + 1
					if i <= nb then
						l_procedure := l_procedures.item (i)
					else
						l_procedure := Void
					end
				end
				i := i + 1
			end
			create l_sorter.make (feature_comparator_by_name)
			l_features.sort (l_sorter)
			nb := l_features.count
			from i := 1 until i > nb loop
				l_features.item (i).process (Current)
				i := i + 1
			end
		end

	process_general_qualified_feature_call_expression (a_expression: ET_GENERAL_QUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_general_qualified_feature_call_instruction (a_instruction: ET_GENERAL_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
			precursor (a_instruction)
		end

	process_infix_expression (a_expression: ET_INFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_list
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_list
			precursor (a_list)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
		do
			l_name := a_type.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
				report_caller (l_name, current_standalone_closure)
			end
			precursor (a_type)
		end

	process_object_equality_expression (a_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_once_function_inline_agent (a_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_once_procedure_inline_agent (a_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_parenthesis_expression (a_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_parenthesis_instruction (a_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
			precursor (a_instruction)
		end

	process_precursor_call (a_call: ET_PRECURSOR_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_PRECURSOR_KEYWORD
			l_seed: INTEGER
		do
			l_name := a_call.precursor_keyword
			l_seed := l_name.seed
			if not attached a_call.parent_type as l_parent_type then
				-- Do nothing.
			elseif l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (l_parent_type.base_class) then
				report_caller (l_name, current_standalone_closure)
			end
		end

	process_precursor_expression (a_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_expression)
			end
			precursor (a_expression)
		end

	process_precursor_instruction (a_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_prefix_expression (a_expression: ET_PREFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_qualified_call_expression (a_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_expression)
			end
			precursor (a_expression)
		end

	process_qualified_call_instruction (a_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_qualified_feature_call (a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_class: ET_CLASS
		do
			l_name := a_call.name
			if not (attached {ET_IDENTIFIER} l_name as l_label and then l_label.is_tuple_label) then
				l_seed := l_name.seed
				if l_seed /= 0 and then callee_seeds.has (l_seed) then
					internal_type_context.reset (current_class)
					expression_type_finder.find_expression_type_in_closure (a_call.target, current_closure, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
					l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
					if callee_classes.has (l_class) then
						report_caller (l_name, current_standalone_closure)
					end
				end
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			precursor (a_type)
		end

	process_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			l_class: ET_CLASS
		do
			l_name := a_type.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_type.target_type)
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if callee_classes.has (l_class) then
					report_caller (l_name, current_standalone_closure)
				end
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			precursor (a_type)
		end

	process_static_call_expression (a_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_expression)
			end
			precursor (a_expression)
		end

	process_static_call_instruction (a_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_class: ET_CLASS
		do
			l_name := a_call.name
			l_seed := l_name.seed
			if l_seed /= 0 and then callee_seeds.has (l_seed) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_call.type)
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if callee_classes.has (l_class) then
					report_caller (l_name, current_standalone_closure)
				end
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_standalone_closure: like current_standalone_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_standalone_closure := current_standalone_closure
			current_standalone_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
			current_standalone_closure := l_old_standalone_closure
		end

	process_unqualified_call_expression (a_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
		do
			l_name := a_expression.name
			l_seed := l_name.seed
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			elseif l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
				report_caller (l_name, current_standalone_closure)
			end
			precursor (a_expression)
		end

	process_unqualified_call_instruction (a_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
		do
			l_name := a_instruction.name
			l_seed := l_name.seed
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			elseif l_seed /= 0 and then callee_seeds.has (l_seed) and then callee_classes.has (current_class) then
				report_caller (l_name, current_standalone_closure)
			end
			precursor (a_instruction)
		end

feature {NONE} -- Implementation

	callee_feature: ET_FEATURE
			-- Feature being called

	callee_class: ET_CLASS
			-- Class to which `callee_feature` belongs

	callee_seeds: DS_HASH_SET [INTEGER]
			-- Seeds of `callee_feature`

	callee_classes: DS_HASH_SET [ET_CLASS]
			-- Ancestors and descendants of `callee_class`,
			-- containing `callee_class` itself

	current_closure: ET_CLOSURE
			-- Closure (feature, invariant, inline agent)
			-- being processed

	current_standalone_closure: ET_STANDALONE_CLOSURE
			-- Current feature or invariant being processed

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

invariant

	callee_feature_not_void: callee_feature /= Void
	callee_class_not_void: callee_class /= Void
	callee_seeds_not_void: callee_seeds /= Void
	current_closure_not_void: current_closure /= Void
	current_standalone_closure_not_void: current_standalone_closure /= Void
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
